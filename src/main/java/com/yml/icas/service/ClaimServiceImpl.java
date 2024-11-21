package com.yml.icas.service;

import com.yml.icas.dto.ClaimDTO;
import com.yml.icas.dto.ClaimOPDDTO;
import com.yml.icas.dto.ObjectMapper;
import com.yml.icas.model.*;
import com.yml.icas.repository.*;
import com.yml.icas.service.interfaces.ClaimService;
import com.yml.icas.util.Converter;
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
    public ResponseEntity<Integer> updateClaim(Map<String, Object>[] dataSets) {
        log.info("received Claim update data Set {}", (Object) dataSets);
        int rows = 0;
        Long voucherId = new Date().getTime();
        List<Stage> stages = new ArrayList<>();
        Integer claimId = null;
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
                    rows += claimRepo.mecApproval(claimId,
                            (String) dataSet.get("claimStatus"));
                    stages.add(new Stage("Medical Board Evaluation", "Received", MyConstants.TODAY().toString()));

                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("forwordfinance")) {
                    rows += claimRepo.forwardFinance(claimId,
                            (String) dataSet.get("claimStatus"), MyConstants.TODAY(),
                            Double.parseDouble(String.valueOf(dataSet.get("paidAmount"))),
                            voucherId);
                    stages.add(new Stage("Payment Processing", String.valueOf(dataSet.get("paidAmount")), MyConstants.TODAY().toString()));

                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("forwordpaid")) {
                    rows += claimRepo.forwardPaid(claimId,
                            (String) dataSet.get("claimStatus"), MyConstants.TODAY());
                    stages.add(new Stage("Shruff", String.valueOf(dataSet.get("paidAmount")), MyConstants.TODAY().toString()));

                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("opdupdate")) {
                    addClaimData(dataSet);
                    rows += claimRepo.opdComplete(claimId,
                            (String) dataSet.get("claimStatus"),
                            Converter.toDouble(dataSet.get("deductionAmount")),
                            (String) dataSet.get("mecremarks"),
                            MyConstants.TODAY(),
                            Converter.toDate(dataSet.get("rejecteddate")),
                            (String) dataSet.get("rejectremarks")
                    );
                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("claimdata")) {
                    rows += addClaimData(dataSet);
                    log.info("data saved {}", rows);
                } else if (dataSet.get("criteria").toString().equalsIgnoreCase("finalize")) {
                    rows += claimRepo.finalize(claimId,
                            Double.parseDouble(String.valueOf(dataSet.get("deductionAmount"))),
                            Double.parseDouble(String.valueOf(dataSet.get("paidAmount"))));
                    stages.add(new Stage("Payment Processing", "Eligible Payment: " + dataSet.get("paidAmount"),
                            "Deductions: " + dataSet.get("deductionAmount")));
                }
            } catch (Exception e) {
                e.printStackTrace();
                return new ResponseEntity<>(rows, HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }
        emailClaimProgress(getClaim(claimId), stages);
        return new ResponseEntity<>(rows, HttpStatus.OK);
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

    @Override
    public ClaimDTO getClaim(Integer claimId) {
        log.info("getClaim received params {}", claimId);
        try {
            Claim claim = claimRepo.findClaimById(claimId);
            return ObjectMapper.mapToClaimDTO(claim);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

   /* @Override
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
*/
    @Override
    public Page<ClaimDTO> getAllClaim(Map<String, String> params) {
        log.info("getAllClaim params {}", params);
        Pageable pageable = PageRequest.of(Integer.valueOf(params.get("pageIndex")),
                Integer.valueOf(params.get("pageSize")));
        Member member = memberRepo.findByEmpNoIgnoreCase(params.get("empNo"));

        Page<Claim> claimList = claimRepo.getClaimData(
                (member == null)?null:member.getId(),
                params.get("claimType"),
                (params.get("year").isEmpty())?0:Integer.valueOf(params.get("year")),
                params.get("claimStatus"),
                params.get("filter"),
                pageable);
 /*       try {
            if (!params.get("empNo").isEmpty()) {
                //Member member = memberRepo.findByEmpNoIgnoreCase(params.get("empNo"));
                if (!Objects.isNull(member)) {
                    if (Integer.parseInt(params.get("year")) == 0 && !params.get("claimStatus").equalsIgnoreCase("%")) {
                        claimList = claimRepo.getClaimData(
                                member,
                                params.get("claimStatus"), params.get("filter"), pageable);

                    } else if (Integer.parseInt(params.get("year")) == 0 && params.get("claimStatus").equalsIgnoreCase("%")) {
                        claimList = claimRepo.getClaimData(member, params.get("filter"), pageable);

                    } else if (Integer.parseInt(params.get("year")) != 0 && !params.get("claimStatus").equalsIgnoreCase("%")) {
                        claimList = claimRepo.getClaimData(member,Integer.valueOf(params.get("year")),
                                params.get("claimStatus"), params.get("filter"), pageable);

                    } else if (Integer.parseInt(params.get("year")) != 0 && params.get("claimStatus").equalsIgnoreCase("%")) {
                        claimList = claimRepo.getClaimData(member,
                                Integer.valueOf(params.get("year")), params.get("filter"), pageable);
                    } else {
                        claimList = claimRepo.getClaimData(
                                member, params.get("claimType"),
                                Integer.valueOf(params.get("year")),
                                params.get("claimStatus"), params.get("filter"), pageable);
                    }
                }

            } else {
                if (params.get("claimType").equalsIgnoreCase("%")) {
                    log.info("params.get(\"claimStatus\") {}", params.get("claimStatus"));
                    claimList = claimRepo.findAllByClaimStatusLike(params.get("claimStatus"), pageable);
                } else {
                    log.info("params.get().equalsIgnoreCase {} {}", params.get("claimType"), params.get("claimStatus"));
                    claimList = claimRepo.getClaims(params.get("claimType"), params.get("claimStatus"), params.get("filter"), pageable);
                }
                claimList = claimRepo.getClaims(params.get("claimType"), params.get("claimStatus"), params.get("filter"), pageable);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
*/
        Page<ClaimDTO> cd = claimList.map(ObjectMapper::mapToClaimDTO);
        for (ClaimDTO c:cd
        ) {
            log.info(String.valueOf(c));
        }
        return cd;
    }

    @Override
    public Set<ClaimDTO> getDashboardData(Integer year, String empNo) {
        Set<ClaimDTO> dd;
        try {
            Member member = memberRepo.getMember(empNo);
            log.info("member {}", member);
            Set<Claim> claimList = new HashSet<>(claimRepo.getDashboardData(
                    member, year));
            log.info("claimList {}", claimList);
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

        Page<Claim> claimList = claimRepo.getClaimData(
                member.getId(),
                "%",
                0,
                null,
                null,
                pageable);
        Page<ClaimDTO> cd = claimList.map(ObjectMapper::mapToClaimDTO);
        log.info("cd {} ",cd.toString());
        for (ClaimDTO c:cd
        ) {
            log.info(String.valueOf(c));
        }
        return cd;
    }

    public Boolean deleteClaimData(Integer id) {
        boolean ok = false;
        try {
            claimDataRepo.deleteById(id);
            ok = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        log.info("deleted {}", ok);
        return ok;
    }

    public void emailClaimProgress(ClaimDTO claimDTO, List<Stage> stages) {
        log.info("received to emailClaimProgress {}", claimDTO.toString());
        Map<String, Object> variables = new HashMap<>();
        variables.put("name", claimDTO.getMember().getName());
        variables.put("claimId", claimDTO.getMember().getId());
        variables.put("stages", stages);
        emailService.sendEmail(claimDTO.getMember().getEmail(), claimDTO.getRequestFor() + " Progress", "claim-progress", variables);
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