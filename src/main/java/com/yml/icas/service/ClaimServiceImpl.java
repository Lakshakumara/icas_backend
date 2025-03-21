package com.yml.icas.service;

import com.yml.icas.dto.*;
import com.yml.icas.model.Claim;
import com.yml.icas.model.ClaimData;
import com.yml.icas.model.Member;
import com.yml.icas.model.SchemeData;
import com.yml.icas.repository.*;
import com.yml.icas.service.interfaces.ClaimService;
import com.yml.icas.util.Converter;
import com.yml.icas.util.IcasUtil;
import com.yml.icas.util.MyConstants;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

import static com.yml.icas.util.IcasUtil.DatetoString;

@Slf4j
@Service
public class ClaimServiceImpl implements ClaimService {
    @Autowired
    ClaimRepo claimRepo;

    @Autowired
    ClaimDataRepo claimDataRepo;

    @Autowired
    MemberRepo memberRepo;

    @Autowired
    DependantRepo dependantRepo;

    @Autowired
    SchemeDataRepo schemeDataRepo;

    @Autowired
    private EmailService emailService;

    @Autowired
    private ClaimRepositoryCustomImpl claimRepository;

    public Integer addClaim(ClaimDTO claimDTO) {
        Claim c = null;
        try {
            c = toClaim(claimDTO);
            log.info("ready to save addClaim {}", c);
            c = claimRepo.save(Objects.requireNonNull(c));
            List<Stage> stages = new ArrayList<>();
            stages.add(new Stage("Online Application", "Received", ""));
            stages.add(new Stage("Department Head Approval", "Pending", ""));
            emailClaimProgress(Objects.requireNonNull(ObjectMapper.mapToClaimDTO(c)), stages);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c.getId();
    }
    private Integer addClaimData(Map<String, Object> dataSet) {
        SchemeData scheme = schemeDataRepo.findByIdText((String) dataSet.get("idText"));
        ClaimData cd = new ClaimData();
        cd.setSchemeData(scheme);
        cd.setClaim(new Claim((int) dataSet.get("id")));
        cd.setRequestAmount(Converter.toDouble(dataSet.get("requestAmount")));
        cd.setClaimDataStatus((String) dataSet.get("claimDataStatus"));
        cd.setDeductionAmount(Converter.toDouble(dataSet.get("deductionAmount")));
        cd.setDeductionRemarks((String) dataSet.get("deductionRemarks"));
        cd.setRejectedDate(Converter.toDate(dataSet.get("rejectDate")));
        cd.setRejectRemarks((String) dataSet.get("rejectRemarks"));
        cd.setRemarks((String) dataSet.get("remarks"));
        log.info("saved ClaimData {}", cd);
        claimDataRepo.save(cd);
        return 1;
    }
    private Integer updateClaimData(Map<String, Object> dataSet) {
        ClaimData cd = claimDataRepo.getReferenceById((int) dataSet.get("claimDataId"));
        cd.setRequestAmount(Converter.toDouble(dataSet.get("requestAmount")));
        cd.setAdjustAmount(Converter.toDouble(dataSet.get("adjustAmount")));
        cd.setAdjustRemarks((String) dataSet.get("adjustRemarks"));
        cd.setRemarks((String) dataSet.get("remarks"));
        cd.setPaidAmount(Converter.toDouble(dataSet.get("paidAmount")));
        claimDataRepo.save(cd);
        return 1;
    }
    public Boolean deleteClaimData(Integer id) {
        boolean ok = false;
        try {
            claimDataRepo.deleteById(id);
            ok = true;
        } catch (Exception ignored) {
        }
        return ok;
    }
    @Override
    public ResponseEntity<Integer> updateClaim(Map<String, Object>[] dataSets) {
        log.info("received Claim update data Set {}", (Object) dataSets);
        int rows = 0;
        Long voucherId = new Date().getTime();
        List<Stage> stages = new ArrayList<>();
        Integer claimId = null;
        boolean isEmail = true;
        for (Map<String, Object> dataSet : dataSets) {
            claimId = (Integer) dataSet.get("id");
            try {
                if (dataSet.get("criteria").toString().equalsIgnoreCase("claimreject")) {
                    rows += claimRepo.claimReject(claimId,
                            (String) dataSet.get("claimStatus"),
                            (String) dataSet.get("rejectRemarks"), MyConstants.TODAY());
                    stages.add(new Stage("Claim Rejected", (String) dataSet.get("rejectRemarks"), MyConstants.TODAY().toString()));

                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("headaccept")) {
                    rows += claimRepo.updateHeadAccept(claimId,
                            (String) dataSet.get("claimStatus"),
                            (Integer) dataSet.get("acceptedBy"), MyConstants.TODAY());
                    stages.add(new Stage("Department Approval", "Approved", MyConstants.TODAY().toString()));

                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("forwordmec")) {
                    rows += claimRepo.forwardMEC(claimId,
                            (String) dataSet.get("claimStatus"), MyConstants.TODAY());
                    stages.add(new Stage("Medical Board Evaluation", "Sent", MyConstants.TODAY().toString()));

                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("mec_approved")) {
                    log.info("received Object {} ", dataSet.get("mecreturndate"));
                    log.info("received String {} ", (String) dataSet.get("mecreturndate"));
                    //log.info("received Date {} ", LocalDate.parse((CharSequence) dataSet.get("mecreturndate")));
                    rows += claimRepo.mecApproval(claimId,
                            (String) dataSet.get("claimStatus"),
                            (String) dataSet.get("mecremarks"),
                            MyConstants.TODAY(),
                            (String) dataSet.get("remarks"));
                    stages.add(new Stage("Medical Board Evaluation", "Received", MyConstants.TODAY().toString()));

                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("voucher")) {
                    isEmail = false;
                    rows += claimRepo.finalize(claimId,
                            Double.parseDouble(String.valueOf(dataSet.get("deductionAmount"))),
                            Double.parseDouble(String.valueOf(dataSet.get("paidAmount"))),
                            String.valueOf(dataSet.get("claimStatus")));
                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("forwordfinance")) {
                    rows += claimRepo.forwardFinance(claimId,
                            (String) dataSet.get("claimStatus"), MyConstants.TODAY(),
                            Double.parseDouble(String.valueOf(dataSet.get("paidAmount"))),
                            voucherId);
                    stages.add(new Stage("Payment Processing", String.valueOf(dataSet.get("paidAmount")), MyConstants.TODAY().toString()));

                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("forwordpaid")) {
                    rows += claimRepo.forwardPaid(claimId,
                            (String) dataSet.get("claimStatus"), MyConstants.TODAY());
                    stages.add(new Stage("Shroff", String.valueOf(dataSet.get("paidAmount")), MyConstants.TODAY().toString()));

                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("claimdata")) {
                    isEmail = false;
                    rows += addClaimData(dataSet);
                    log.info("data saved {}", rows);
                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("claimdataupdate")) {
                    isEmail = false;
                    rows += updateClaimData(dataSet);
                    log.info("data saved {}", rows);
                }

                /*else if (dataSet.get("criteria").toString().equalsIgnoreCase("opdupdate")) {
                    addClaimData(dataSet);
                    rows += claimRepo.opdComplete(claimId,
                            (String) dataSet.get("claimStatus"),
                            Converter.toDouble(dataSet.get("deductionAmount")),
                            (String) dataSet.get("mecremarks"),
                            MyConstants.TODAY(),
                            Converter.toDate(dataSet.get("rejecteddate")),
                            (String) dataSet.get("rejectremarks")
                    );
                } */
            } catch (Exception e) {
                e.printStackTrace();
                return new ResponseEntity<>(rows, HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }
        if(isEmail) emailClaimProgress(getClaim(claimId), stages);
        return new ResponseEntity<>(rows, HttpStatus.OK);
    }

    @Override
    public ClaimDTO getClaim(Integer claimId) {
        try {
            Claim claim = claimRepo.findClaimById(claimId);
            return ObjectMapper.mapToClaimDTO(claim);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Page<ClaimDTO> getAllClaim(Map<String, String> params) {
        log.info("getAllClaim params {}", params);
        Pageable pageable = IcasUtil.createPageable(params);
        Page<Claim> claimList;


        String department = params.getOrDefault("department","");
        if(department.isEmpty()) {
            Member member = memberRepo.findByEmpNoIgnoreCase(params.get("empNo"));
            claimList = claimRepo.getClaim(
                    (member == null) ? null : member.getId(),
                    params.get("claimType"),
                    (params.get("year").isEmpty()) ? 0 : Integer.parseInt(params.get("year")),
                    params.get("claimStatus"),
                    params.get("filter"),
                    pageable);
        }else{
            claimList = claimRepo.getDepartmentClaim(
                    department,
                    params.get("filter"),
                    pageable);
        }
        assert claimList != null;
        Page<ClaimDTO> cd = claimList.map(ObjectMapper::mapToClaimDTO);
        for (ClaimDTO c:cd) {log.info(String.valueOf(c));}
        return cd;
    }

    @Override
    public Set<ClaimDTO> getDashboardData(Integer year, String empNo) {
        Set<ClaimDTO> dd;
        try {
            Member member = memberRepo.findByEmpNoIgnoreCase(empNo);
            Set<Claim> claimList = new HashSet<>(claimRepo.getDashboardData(
                    member, year));
            dd = claimList.stream().map(ObjectMapper::mapToClaimDTO).collect(Collectors.toSet());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return dd;
    }

    @Override
    public long[] getVoucherIds() {
        try {
            return claimRepo.getVoucherId();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Page<ClaimDTO> getTest() {
        Pageable pageable = PageRequest.of(0,5);
        Member member = memberRepo.findByEmpNoIgnoreCase("100");

        Page<Claim> claimList = claimRepo.getClaim(
                member.getId(),
                "%",
                0,
                null,
                null,
                pageable);
        Page<ClaimDTO> cd = claimList.map(ObjectMapper::mapToClaimDTO);
        for (ClaimDTO c:cd) {
            log.info(String.valueOf(c));
        }
        return cd;
    }

    @Override
    public Page<ClaimDataDTO> getClaimData(Map<String, String> params) {
        Pageable pageable = PageRequest.of(Integer.parseInt(params.get("pageIndex")),Integer.parseInt(params.get("pageSize")));

        Page<ClaimData> cd = claimDataRepo.getClaimData(Integer.parseInt(params.get("claimId")),
                pageable);
        Page<ClaimDataDTO> ret = cd.map(ObjectMapper::mapToClaimDataDTO);
        log.info("cd {} ",ret);
        return  ret;
    }

    @Override
    public Set<HistoryDTO> getClaimHistorySummary(Map<String, String> params) {
        String empNo=params.getOrDefault("empNo", "");
        List<String> opd1 = schemeDataRepo.getOPD();
        Map<String, Object> paymentSummary = claimDataRepo.getPaymentSummary(empNo, opd1);
        HistoryDTO opd = new HistoryDTO("2,4.1-OPD", opd1, schemeDataRepo.getMaxAmount("2.1"), paymentSummary.get("count"), paymentSummary.get("paid"));
        opd1 = schemeDataRepo.getSH();
        paymentSummary = claimDataRepo.getPaymentSummary(empNo, opd1);
        HistoryDTO sh = new HistoryDTO("1-Surgical & Hospital Expenses", opd1, schemeDataRepo.getMaxAmount("1"), paymentSummary.get("count"), paymentSummary.get("paid"));
        opd1 = schemeDataRepo.getPA();
        paymentSummary = claimDataRepo.getPaymentSummary(empNo, opd1);
        HistoryDTO pa = new HistoryDTO("3-Personal Accident", opd1, schemeDataRepo.getMaxAmount("3.2.a"), paymentSummary.get("count"), paymentSummary.get("paid"));
        opd1 = schemeDataRepo.getCR();
        paymentSummary = claimDataRepo.getPaymentSummary(empNo, opd1);
        HistoryDTO cr = new HistoryDTO("5-Critical Illness", opd1, schemeDataRepo.getMaxAmount("5.1"), paymentSummary.get("count"), paymentSummary.get("paid"));

        Set<HistoryDTO> data = new HashSet<>();
        data.add(opd);
        data.add(sh);
        data.add(pa);
        data.add(cr);
        return data;
    }

    @Override
    public Page<ClaimHistoryDTO> getClaimDataHistory(Map<String, String> params) {
        Pageable pageable = IcasUtil.createPageable(params);
        String empNo = params.getOrDefault("empNo", "");
        List<String> idTextList = null;
        if(!Objects.equals(params.get("idText"), "null")) {
            idTextList = Arrays.asList(params.get("idText").split(","));
        }
        Page<ClaimHistoryDTO> ch = claimDataRepo.getClaimDataHistory(empNo, idTextList, pageable);
        log.info("params {}\n fetch {}", params, ch);
        return ch;
    }

    @Override
    public Page<ClaimDataHistoryDTO> getClaimDataHistoryAll(Map<String, String> params) {
        Pageable pageable = IcasUtil.createPageable(params);
        String empNo = params.getOrDefault("empNo", "");
        List<String> idTextList = null;
        if(!Objects.equals(params.get("idText"), "null")) {
            idTextList = Arrays.asList(params.get("idText").split(","));
        }
        Page<ClaimDataHistoryDTO> ch = claimDataRepo.getClaimDataHistoryAll(empNo, idTextList, pageable);
        log.info("params {}\n fetch {}", params, ch);
        return ch;
    }

    public void emailClaimProgress(ClaimDTO claimDTO, List<Stage> stages) {
        log.info("received to emailClaimProgress {}", claimDTO.toString());
        Map<String, Object> variables = new HashMap<>();
        variables.put("name", claimDTO.getMember().getName());
        variables.put("claimId", claimDTO.getMember().getId());
        variables.put("stages", stages);
        emailService.sendEmail(claimDTO.getMember().getEmail(), claimDTO.getRequestFor() + " Progress", "claim-progress", variables);
    }

    private Claim toClaim(ClaimDTO claimDTO) {
        if (Objects.isNull(claimDTO)) return null;
        Claim c = new Claim();
        c.setId(claimDTO.getId());
        c.setMember(memberRepo.getReferenceById(claimDTO.getMemberId()));
        if (claimDTO.getDependant() != null)
            c.setDependant(dependantRepo.getReferenceById(claimDTO.getDependant().getId()));
        c.setCategory(claimDTO.getCategory());
        c.setRequestFor(claimDTO.getRequestFor());

        c.setInjuryDate(claimDTO.getInjuryDate());
        c.setInjuryPlace(claimDTO.getInjuryPlace());
        c.setInjuryHow(claimDTO.getInjuryHow());
        c.setInjuryNature(claimDTO.getInjuryNature());

        c.setIllnessDate(claimDTO.getIllnessDate());
        c.setIllnessNature(claimDTO.getIllnessNature());
        c.setIllnessFirstConsultDate(claimDTO.getIllnessFirstConsultDate());
        c.setIllnessFirstDr(claimDTO.getIllnessFirstDr());
        c.setHospitalStartDate(claimDTO.getHospitalStartDate());
        c.setHospitalEndDate(claimDTO.getHospitalEndDate());
        c.setInfoTreatment(claimDTO.getInfoTreatment());
        c.setInfoHospital(claimDTO.getInfoHospital());
        c.setInfoConsultant(claimDTO.getInfoConsultant());

        c.setClaimDate(claimDTO.getClaimDate());
        c.setStartDate(claimDTO.getStartDate());
        c.setRequestAmount(claimDTO.getRequestAmount());

        c.setAcceptedDate(claimDTO.getAcceptedDate());
        c.setAcceptedBy(claimDTO.getAcceptedBy());

        c.setMecSendDate(claimDTO.getMecSendDate());
        c.setDeductionAmount(claimDTO.getDeductionAmount());
        c.setPaidAmount(claimDTO.getPaidAmount());
        c.setVoucherId(claimDTO.getVoucherId());

        c.setFinanceSendDate(claimDTO.getFinanceSendDate());
        c.setCompletedDate(claimDTO.getCompletedDate());

        c.setMecRemarks(claimDTO.getMecRemarks());
        c.setMecReturnDate(claimDTO.getMecReturnDate());
        c.setRejectedDate(claimDTO.getRejectedDate());
        c.setRejectRemarks(claimDTO.getRejectRemarks());

        c.setClaimStatus(claimDTO.getClaimStatus());
        c.setRemarks(claimDTO.getRemarks());

        c.setAppeal(claimDTO.isAppeal());
        c.setAppealRefId(claimDTO.getAppealRefId());
        c.setAppealRemarks(claimDTO.getAppealRemarks());
        return c;
    }

}
@Setter
@Getter
@AllArgsConstructor
class Stage {
    private String name;
    private String status;
    private String remarks;
}

  /*
    private Claim getClaimOPD(ClaimOPDDTO claimOPDDTO) {
        Claim cd = new Claim();
        if (Objects.isNull(claimOPDDTO)) return cd;
        cd.setId(claimOPDDTO.getId());
        cd.setMember(memberRepo.getReferenceById(claimOPDDTO.getMemberId()));
        cd.setRequestFor(claimOPDDTO.getRequestFor());
        cd.setCategory(claimOPDDTO.getCategory());
        cd.setStartDate(claimOPDDTO.getStartDate());
        cd.setClaimDate(claimOPDDTO.getClaimDate());
        cd.setRequestAmount(claimOPDDTO.getRequestAmount());
        cd.setClaimStatus(claimOPDDTO.getClaimStatus());
        cd.setAcceptedDate(claimOPDDTO.getAcceptedDate());
        return cd;
    }
   public Page<Claim> searchClaims(Map<String, String> params) {
        return claimRepository.searchClaims(params);
    }



    @Override
    public ResponseEntity<Integer> saveOpd(ClaimOPDDTO claimOPDDTO) {
        Claim claim;
        try {
            claim = claimRepo.save(getClaimOPD(claimOPDDTO));
            List<Stage> stages = new ArrayList<>();
            stages.add(new Stage("Online Application", "Received", ""));
            stages.add(new Stage("Department Head Approval", "Pending", ""));
            emailClaimProgress(Objects.requireNonNull(ObjectMapper.mapToClaimDTO(claim)), stages);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(claim.getId(), HttpStatus.OK);
    }

    @Override
    public Set<ClaimDTO> getAllClaim(Map<String, String> params) {
        log.info("getAllClaim params {}", params);
        final Set<ClaimDTO> dd = new HashSet<>();
        try {
            Set<Claim> claimList = new HashSet<>();
            if (!params.get("empNo").isEmpty()) {
                Integer id = memberRepo.getMemberId(params.get("empNo"));
                if (!Objects.isNull(id)) {
                    if (Integer.parseInt(params.get("year")) == 0 && !params.get("claimStatus").equalsIgnoreCase("%")) {
                        claimList = new HashSet<>(claimRepo.getClaimData(
                                new Member(id),
                                params.get("claimStatus")));
                    } else if (Integer.parseInt(params.get("year")) == 0 && params.get("claimStatus").equalsIgnoreCase("%")) {
                        claimList = new HashSet<>(claimRepo.getClaimData(new Member(id)));
                    } else if (Integer.parseInt(params.get("year")) != 0 && !params.get("claimStatus").equalsIgnoreCase("%")) {
                        claimList = new HashSet<>(claimRepo.getClaimData(
                                new Member(id),
                                Integer.valueOf(params.get("year")),
                                params.get("claimStatus")));
                    } else if (Integer.parseInt(params.get("year")) != 0 && params.get("claimStatus").equalsIgnoreCase("%")) {
                        claimList = new HashSet<>(claimRepo.getClaimData(new Member(id),
                                Integer.valueOf(params.get("year"))));
                    } else {
                        claimList = new HashSet<>(claimRepo.getClaimData(
                                new Member(id), params.get("claimType"),
                                Integer.valueOf(params.get("year")),
                                params.get("claimStatus")));
                    }
                }
                log.info("params.get(\"empNo\") {}\n year {}\n claimStatus {}",
                        params.get("empNo"),
                        Integer.parseInt(params.get("year")), params.get("claimStatus"));

            } else {
                if (params.get("claimType").equalsIgnoreCase("%")) {
                    log.info("params.get(\"claimStatus\") {}", params.get("claimStatus"));
                    claimList = new HashSet<>(claimRepo.findAllByClaimStatusLike(params.get("claimStatus")));
                } else {
                    log.info("params.get().equalsIgnoreCase {} {}", params.get("claimType"), params.get("claimStatus"));
                    claimList = new HashSet<>(claimRepo
                            .getClaims(params.get("claimType"), params.get("claimStatus")));
                }

            }
            String filterText = params.get("filter");
            if (!filterText.isEmpty()) {
                claimList = claimList.stream()
                        .filter(claim -> claim.getMember().getEmpNo().contains(filterText) || claim.getMember().getName().contains(filterText))
                        .collect(Collectors.toSet());
            }
            dd.addAll(claimList.stream().map(ObjectMapper::mapToClaimDTO).collect(Collectors.toSet()));
        } catch (Exception e) {
            e.printStackTrace();
            return dd;
        }
        log.info("getAllClaim for params.get(\"empNo\"){}\n {}", params.get("empNo"), dd);
        return dd;
    }
       public void emailClaimProgress(Claim claim) {
        log.info("received to emailClaimProgress {}", claim.toString());
        Map<String, Object> variables = new HashMap<>();
        variables.put("name", claim.getMember().getName());
        variables.put("claimId", claim.getMember().getId());

        List<Stage> stages = new ArrayList<>();
        if(claim.getAcceptedDate() == null) {
            stages.add(new Stage("Online Application", "Received", DatetoString(claim.getClaimDate())));
            stages.add(new Stage("Department Head Approval", "Pending", ""));
        }else {
            stages.add(new Stage("Online Application", "Received", DatetoString(claim.getClaimDate())));
            stages.add(new Stage("Department Approval", "Approved", DatetoString(claim.getAcceptedDate())));
        }
        if(claim.getMecSendDate() == null){

        }
        variables.put("stages", stages);
        emailService.sendEmail(claim.getMember().getEmail(),
                "Insurance Claim Progress "+claim.getRequestFor(),
                "claim-progress", variables);
    }
*/