package com.yml.icas.service;

import com.yml.icas.dto.*;
import com.yml.icas.model.*;
import com.yml.icas.repository.*;
import com.yml.icas.service.interfaces.MemberService;
import com.yml.icas.util.IcasUtil;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

import static com.yml.icas.util.IcasUtil.DateToString;
import static com.yml.icas.util.MyConstants.ALL;
import static com.yml.icas.util.MyConstants.REGISTRATION_PENDING;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

    @Value("${app.frontend.base-url}")
    private String baseUrl;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    private MemberRepo memberRepo;

    @Autowired
    private RoleRepo roleRepo;

    @Autowired
    private RegistrationRepo memberRegistrationRepo;

    @Autowired
    private DependantDataRepo memberDependantDataRepo;

    @Autowired
    private DependantRepo dependantRepo;

    @Autowired
    private BeneficiaryRepo beneficiaryRepo;

    @Autowired
    private BeneficiaryDataRepo beneficiaryDataRepo;

    @Autowired
    private EmailService emailService;

    public MemberServiceImpl(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }
    public void updateExistingPasswords() {
        List<Member> users = memberRepo.findAll();
        for (Member user : users) {
            if (!user.getPassword().startsWith("$2a$")) { // Check if already hashed
                String hashedPassword = passwordEncoder.encode(user.getPassword());
                user.setPassword(hashedPassword);
                memberRepo.save(user);
            }
        }
    }
    @Override
    public ResponseEntity<Integer> updateMember(String criteria, Map<String, Object> dataSet) {
        log.info("dataSet {}", dataSet);
        Integer rows = 0;
        if (criteria.equalsIgnoreCase("registerOpen")) {
            if (dataSet.get("selector").toString().equalsIgnoreCase("all")) {
                memberRepo.updateRegistrationAll((Integer) dataSet.get("year"));
            } else {
                memberRepo.updateRegistrationMember(dataSet.get("selector").toString(), (Integer) dataSet.get("year"));
            }
            rows = 1;
        } else if (criteria.equalsIgnoreCase("role")) {
            List<String> dd = (List<String>) dataSet.get("newrole");
            Set<Role> roles = dd.stream()
                    .map(roleName -> roleRepo.findByRole(roleName))
                    .collect(Collectors.toSet());

            if (dataSet.get("memberId") != null) {
                Member mm = memberRepo.findByEmpNoIgnoreCase((String) dataSet.get("empNo"));
                mm.setRoles(roles);
                memberRepo.save(mm);
                rows += 1;
            }

        } else if (criteria.equalsIgnoreCase("memberAccept")) {
            log.info("acceptedBy{} {} memberId{}", dataSet.get("acceptedBy"), LocalDate.now(), dataSet.get("memberId"));
            if (dataSet.get("memberId") != null) {
                rows = memberRegistrationRepo.acceptRegistration((Integer) dataSet.get("acceptedBy"),
                        LocalDate.now(), (Integer) dataSet.get("memberId"));

                if (rows == 1) {
                    Map<String, Object> variables = new HashMap<>();
                    Optional<Member> member = memberRepo.findById((Integer) dataSet.get("memberId"));
                    if (member.isPresent()) {
                        variables.put("name", member.get().getName());
                        variables.put("username", member.get().getEmpNo());
                        variables.put("siteLink", baseUrl);
                        variables.put("schemaLink", baseUrl + "/download/scheme/2023");
                        log.info("email sending started");
                        emailService.sendEmailAsync(
                                member.get().getEmail(),
                                "Registration Update",
                                "email-registration-complete",
                                variables);
                    }
                }
            }
        }
        return new ResponseEntity<>(rows, HttpStatus.OK);
    }

    @Transactional
    @Override
    public MemberDTO signUpNew(MemberDTO memberDTO) {
        log.info("memberDTO received to service: {}", memberDTO);
        MemberDTO response = null;

        int regYear;
        try {
            // Validate the incoming memberDTO
            if (!validateMemberRest(memberDTO)) {
                return new MemberDTO();
            }

            // Check if the member already exists
            Member member = memberRepo.findByEmpNoIgnoreCase(memberDTO.getEmpNo());
            if (member == null) {
                // Create new member
                member = new Member();
                member.setEmpNo(memberDTO.getEmpNo());
                member.setName(memberDTO.getName());
                member.setAddress(memberDTO.getAddress());
                member.setEmail(memberDTO.getEmail());
                member.setContactNo(memberDTO.getContactNo());
                member.setCivilStatus(memberDTO.getCivilStatus());
                member.setNic(memberDTO.getNic());
                member.setSex(memberDTO.getSex());
                member.setDob(memberDTO.getDob());
                member.setDesignation(memberDTO.getDesignation());
                member.setDepartment(memberDTO.getDepartment());
                String hashedPassword = passwordEncoder.encode(memberDTO.getPassword());
                member.setPassword(hashedPassword);
                member.setMDate(memberDTO.getMDate());
                member.setStatus(memberDTO.getStatus());
                member.setPhotoUrl(memberDTO.getPhotoUrl());
                member.setDeleted(memberDTO.isDeleted());
                member.setRegistrationOpen(memberDTO.getRegistrationOpen());
                member = memberRepo.save(member);
            } else {
                // Update existing member details
                member.setName(memberDTO.getName());
                member.setAddress(memberDTO.getAddress());
                member.setEmail(memberDTO.getEmail());
                member.setContactNo(memberDTO.getContactNo());
                member.setCivilStatus(memberDTO.getCivilStatus());
                member.setNic(memberDTO.getNic());
                member.setSex(memberDTO.getSex());
                member.setDob(memberDTO.getDob());
                member.setDesignation(memberDTO.getDesignation());
                member.setDepartment(memberDTO.getDepartment());
                member.setPassword(memberDTO.getPassword());
                member.setMDate(memberDTO.getMDate());
                member.setStatus(memberDTO.getStatus());
                member.setPhotoUrl(memberDTO.getPhotoUrl());
                member.setDeleted(memberDTO.isDeleted());
                member.setRegistrationOpen(memberDTO.getRegistrationOpen());
            }

            // Process member registrations
            for (RegistrationDTO temp : memberDTO.getMemberRegistrations()) {
                log.info("temp {}", temp);
                Registration memberRegistration = new Registration();
                regYear = temp.getYear();
                memberRegistration.setYear(regYear);
                memberRegistration.setRegisterDate(temp.getRegisterDate());
                memberRegistration.setSchemeType(temp.getSchemeType());
                memberRegistration.setMember(member);
                memberRegistration.setAcceptedBy(temp.getAcceptedBy());
                memberRegistration.setAcceptedDate(temp.getAcceptedDate());
                member.getMemberRegistrations().add(memberRegistration);
            }

            // Save the member and related entities
            Member savedMember = memberRepo.save(member);

            // Process dependants
            Set<DependantDTO> dependants = memberDTO.getDependants();
            for (DependantDTO d : dependants) {
                Dependant newDep = dependantRepo.findByNameNicDob(d.getName(), d.getNic(), d.getDob());
                if (newDep == null) {
                    Dependant dependant = new Dependant();
                    dependant.setId(d.getId());
                    dependant.setName(d.getName());
                    dependant.setNic(d.getNic());
                    dependant.setDob(d.getDob());
                    log.info("dependant save {} to {}", d, dependant);
                    newDep = dependantRepo.save(dependant);
                }
                DependantData dd = memberDependantDataRepo.findDuplicateData(
                        savedMember.getId(), newDep.getId(), d.getRegisterYear()
                );
                if (dd == null) {
                    DependantData mdd = new DependantData();
                    mdd.setRegisterYear(d.getRegisterYear());
                    mdd.setRegisterDate(d.getRegisterDate());
                    mdd.setRelationship(d.getRelationship());
                    mdd.setDependant(newDep);
                    mdd.setMember(savedMember);
                    memberDependantDataRepo.save(mdd);
                }
            }

            // Process beneficiaries
            Set<BeneficiaryDTO> beneficiaries = memberDTO.getBeneficiaries();
            for (BeneficiaryDTO d : beneficiaries) {
                Beneficiary beneficiary = new Beneficiary();
                beneficiary.setId(d.getId());
                beneficiary.setName(d.getName());
                beneficiary.setNic(d.getNic());
                log.info("beneficiary save {}", d);
                log.info("actual save {}, {}, {}", beneficiary.getId(), beneficiary.getName(), beneficiary.getNic());
                Beneficiary newBen = beneficiaryRepo.save(beneficiary);

                BeneficiaryData bnd = new BeneficiaryData();
                bnd.setPercent(d.getPercent());
                bnd.setRelationship(d.getRelationship());
                bnd.setBeneficiary(newBen);
                bnd.setRegisterDate(d.getRegisterDate());
                bnd.setRegisterYear(d.getRegisterYear());
                bnd.setMember(savedMember);
                beneficiaryDataRepo.save(bnd);
            }

            Set<RoleDTO> roles = memberDTO.getRoles();
            updateRoles(member.getId(), roles.stream().map(RoleDTO::getRole).toList());



            // Retrieve the updated member with all associations
            response = memberRepo.getMemberDTOEmpNo(memberDTO.getEmpNo());
            response.setMemberRegistrations(memberRegistrationRepo.getMemberRegistration(0, memberDTO.getEmpNo()));

            // Send confirmation email
            Map<String, Object> variables = new HashMap<>();
            variables.put("name", response.getName());
            variables.put("schemaLink", generateSchemeDownloadLink());
                /*Optional<Integer> newRegYear = successMemberDTO.getMemberRegistrations().stream()
                        .max(Comparator.comparing(Registration::getYear))
                        .map(Registration::getYear);
                newRegYear.ifPresent(year -> variables.put("applicationLink", baseUrl + "/download/application/" + year + "/" + successMemberDTO.getEmpNo()));
                */
            byte[] application = IcasUtil.genApplication(response);
            emailService.sendEmailWithAttachment(
                    response.getEmail(),
                    "Online Application Received",
                    "email-registration",
                    variables, application, "Application.pdf");
        } catch (Exception ignored) {
        }
        return response;
    }

   /* @Transactional
    @Override
    public Member signUpNew(MemberDTO memberDTO) {
        log.info("memberDTO received to service" + memberDTO.getMemberRegistrations().toString());
        Member response = null;
        try {
            if (!validateMemberRest(memberDTO)) {
                return new Member();
            }
            Member member = memberRepo.findByEmpNoIgnoreCase(memberDTO.getEmpNo());
            if (member == null) {
                member = ObjectMapper.mapToMember(memberDTO);
            }

            MemberRegistrationDTO temp = (memberDTO.getMemberRegistrations().stream().toList()).get(0);
            log.info("temp {} ", temp);
            Registration memberRegistration = new Registration();
            memberRegistration.setYear(temp.getYear());
            memberRegistration.setRegisterDate(temp.getRegisterDate());
            memberRegistration.setSchemeType(temp.getSchemeType());
            memberRegistration.setMember(member);

            member.getMemberRegistrations().add(memberRegistration);
            for (Registration mm : member.getMemberRegistrations()) {
                log.info("prepaired "+mm.getId());
                log.info("getYear "+mm.getYear() );
                log.info("getSchemeType "+mm.getSchemeType()) ;
                log.info("getAcceptedBy "+mm.getAcceptedBy());
                log.info("getAcceptedDate"+ mm.getAcceptedDate());
            }
            //Member savedMember = memberRepo.save(member);

            /*log.info("after save before reg " + savedMember.getMemberRegistrations());
            log.info("memberRegistrationRepo " + memberRegistrationRepo.findAll());
            for (MemberRegistration mm : savedMember.getMemberRegistrations()) {
                log.info("after save before reg"+mm.getId());
                log.info("getYear "+mm.getYear() );
                log.info("getSchemeType "+mm.getSchemeType()) ;
                log.info("getAcceptedBy "+mm.getAcceptedBy());
                log.info("getAcceptedDate"+ mm.getAcceptedDate());

            }*/

           /* log.info("after 2 nd save"+ mapMember.getMemberRegistrations());
            for (MemberRegistration mm : savedMember.getMemberRegistrations()) {
                log.info("after 2nd reg "+mm.getId());
                log.info("getYear "+mm.getYear() );
                log.info("getSchemeType "+mm.getSchemeType()) ;
                log.info("getAcceptedBy "+mm.getAcceptedBy());
                log.info("getAcceptedDate "+ mm.getAcceptedDate());

            }*/

            /*savedMember = memberRepo.save(mapMember);

            Set<DependantDTO> dependants = memberDTO.getDependants();
            Member finalMember = savedMember;
            dependants.forEach(d -> {
                Dependant dependant = new Dependant();
                dependant.setId(d.getId());
                dependant.setName(d.getName());
                dependant.setNic(d.getNic());
                dependant.setDob(d.getDob());
                Dependant newDep = dependantRepo.save(dependant);
                DependantData mdd = new DependantData();
                mdd.setRegisterYear(d.getRegisterYear());
                mdd.setRegisterDate(d.getRegisterDate());
                mdd.setRelationship(d.getRelationship());
                mdd.setDependant(newDep);
                mdd.setMember(finalMember);
                memberDependantDataRepo.save(mdd);
            });

            Set<BeneficiaryDTO> beneficiaries = memberDTO.getBeneficiaries();
            beneficiaries.forEach(d -> {
                Beneficiary beneficiary = new Beneficiary();
                beneficiary.setId(d.getId());
                beneficiary.setName(d.getName());
                beneficiary.setNic(d.getNic());
                Beneficiary newBen = beneficiaryRepo.save(beneficiary);
                BeneficiaryData bnd = new BeneficiaryData();
                bnd.setPercent(d.getPercent());
                bnd.setRelationship(d.getRelationship());
                bnd.setBeneficiary(newBen);
                bnd.setRegisterDate(d.getRegisterDate());
                bnd.setRegisterYear(d.getRegisterYear());
                bnd.setMember(finalMember);
                beneficiaryDataRepo.save(bnd);
            });

            Member successMember = memberRepo.findByEmpNoIgnoreCase(memberDTO.getEmpNo());

            if (!Objects.isNull(successMember)) {
                Map<String, Object> variables = new HashMap<>();
                variables.put("name", successMember.getName());
                variables.put("schemaLink", generateSchemeDownloadLink());
                Optional<Integer> newRegYear = successMember.getMemberRegistrations().stream()
                        .max(Comparator.comparing(Registration::getYear))
                        .map(Registration::getYear);
                if (newRegYear.isPresent()) {
                    variables.put("applicationLink", baseUrl + "/download/application/" + newRegYear.get() + "/" + successMember.getEmpNo());
                }
                byte[] application = IcasUtil.genApplication(successMember);
                emailService.sendEmailWithAttachment(
                        successMember.getEmail(),
                        "Online Application Received",
                        "email-registration",
                        variables, application, "Application.pdf");
                response = successMember;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return response;
    }*/

    @Override
    public ResponseEntity<MemberDTO> getMember(String empNo) {
        log.info("fetch MemberDTO {}", empNo);
        try {
            Member member = memberRepo.getDTO_empNo(empNo);
            log.info("fetch findByEmpNoIgnoreCase {} ", member);
            return new ResponseEntity<>(Objects.requireNonNullElseGet(ObjectMapper.mapToMemberDTO(member), MemberDTO::new), HttpStatus.OK);

        } catch (Exception ex) {
            return new ResponseEntity<>(new MemberDTO(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    private boolean validateMemberRest(MemberDTO memberDTO) {
        return !memberDTO.getEmpNo().isEmpty() && !memberDTO.getName().isEmpty();
        //&& requestMap.containsKey("email") && requestMap.containsKey("nic");
    }

    @Override
    public ResponseEntity<String[]> getRelationShip(String rs) {
        try {
            return new ResponseEntity<>(memberDependantDataRepo.findDistinctByRelationshipLike(rs), HttpStatus.OK);
        } catch (Exception ex) {
            return new ResponseEntity<>(new String[]{}, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public Page<MemberDTO> searchMember(Map<String, Object> searchParams) {
        Pageable pageable = IcasUtil.createPageableObjects(searchParams);
        try {
            Page<Registration> mt;
            Page<MemberDTO> memberDTOPage = null;
            /*if (searchParams.get("searchFor").toString().equalsIgnoreCase("notAccept")) {
                mt = memberRegistrationRepo.findByAcceptedDateNull(pageable);

                memberDTOPage = mt.map(mtt -> ObjectMapper.mapToMemberDTO(mtt.getMember()));
            } else if (searchParams.get("searchFor").toString().equalsIgnoreCase("accepted")) {
                mt = memberRegistrationRepo.findByAcceptedDate((Date) searchParams.get("acceptDate"), pageable);
                memberDTOPage = mt.map(mtt -> ObjectMapper.mapToMemberDTO(mtt.getMember()));
            }

            */
            log.info("searchParams param {} ", searchParams);

            if (searchParams.get("searchFor").toString().equalsIgnoreCase(REGISTRATION_PENDING)) {
                mt = memberRegistrationRepo.filterRegistration((String) searchParams.get("filter"),
                        DateToString(searchParams.get("searchText"))
                        , pageable);
                memberDTOPage = mt.map(mtt -> ObjectMapper.mapToMemberDTO(mtt.getMember()));
            }
            if (searchParams.get("searchFor").toString().equalsIgnoreCase(ALL)) {
                Page<Member> mm = memberRepo.getMembers((String) searchParams.get("filter"), pageable);
                memberDTOPage = mm.map(ObjectMapper::mapToMemberDTO);
            }

            log.info("searchParams from {} result \n{}", searchParams, memberDTOPage);
            return memberDTOPage;
        } catch (Exception ex) {
            return null;
        }
    }

    @Override
    public Page<MemberDTO> getMembers(int page, int size, String search) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Member> memberPage = null;
        try {
            if (search != null && !search.isEmpty())
                memberPage = memberRepo.findAllByNameContainsIgnoreCase(search, pageable);
            else memberPage = memberRepo.findAll(pageable);
        } catch (Exception ignored) {
        }
        assert memberPage != null;
        return memberPage.map(ObjectMapper::mapToMemberDTO);
    }

    public void updateRoles(Integer memberId, List<String> roles) {
        Set<Role> updatedRoles = roles.stream().map(roleName -> roleRepo.findByRole(roleName)).collect(Collectors.toSet());
        Member member = memberRepo.findById(memberId).orElseThrow(() -> new RuntimeException("Member not found"));

        // Update the member's roles
        member.setRoles(updatedRoles);

        // Save the member entity
        member = memberRepo.save(member);

        String email = member.getEmail();
        Map<String, Object> variables = new HashMap<>();
        variables.put("name", member.getName());
        variables.put("roles", roles);

        emailService.sendEmail(email, "Role Updated", "role-update", variables);
    }

    @Override
    public Set<BeneficiaryDTO> getMemberBeneficiaries(int year, String empNo, String name) {
        try {
            Set<BeneficiaryDTO> beneficiaryDTOS = beneficiaryRepo.getEmployeeBeneficiaries(year, empNo, name);
            log.info("Dependants {}", beneficiaryDTOS);
            return beneficiaryDTOS;
        } catch (Exception ex) {
            return new HashSet<>();
        }
    }

    @Override
    public Set<DependantDTO> getMemberDependants(int year, String empNo, String name) {
        try {
            Set<DependantDTO> dependants = dependantRepo.getEmployeeDependants(year, empNo, name);
            log.info("Dependants {}", dependants);
            return dependants;
        } catch (Exception ex) {
            return new HashSet<>();
        }
    }

    private String generateSchemeDownloadLink() {
        return baseUrl + "/download/scheme/2023";
    }
}
    /*

        public Member signUpNewold(MemberDTO memberDTO) {
        log.info("memberDTO received to service" + memberDTO.getMemberRegistrations().toString());
        Member response = null;
        try {
            if (!validateMemberRest(memberDTO)) {
                return new Member();
            }
            Member member = memberRepo.findByEmpNoIgnoreCase(memberDTO.getEmpNo());
            if (member == null) {
                member = ObjectMapper.mapToMember(memberDTO);
            }
            Member mapMember = ObjectMapper.mapToMember(memberDTO);


            Member savedMember = memberRepo.save(mapMember);

            log.info("after save before reg " + savedMember.getMemberRegistrations());
            log.info("memberRegistrationRepo " + memberRegistrationRepo.findAll());
            for (MemberRegistration mm : savedMember.getMemberRegistrations()) {
                log.info("after save before reg"+mm.getId());
                log.info("getYear "+mm.getYear() );
                log.info("getSchemeType "+mm.getSchemeType()) ;
                log.info("getAcceptedBy "+mm.getAcceptedBy());
                log.info("getAcceptedDate"+ mm.getAcceptedDate());

            }

Registration memberRegistration = new Registration();
RegistrationDTO temp = (memberDTO.getMemberRegistrations().stream().toList()).get(0);
            log.info("temp {} ", temp);
            memberRegistration.setYear(temp.getYear());
        memberRegistration.setRegisterDate(temp.getRegisterDate());
        memberRegistration.setSchemeType(temp.getSchemeType());
        memberRegistration.setMember(new Member(savedMember.getId()));

        savedMember.getMemberRegistrations().add(memberRegistration);


           /log.info("after 2 nd save"+ mapMember.getMemberRegistrations());
            for (MemberRegistration mm : savedMember.getMemberRegistrations()) {
                log.info("after 2nd reg "+mm.getId());
                log.info("getYear "+mm.getYear() );
                log.info("getSchemeType "+mm.getSchemeType()) ;
                log.info("getAcceptedBy "+mm.getAcceptedBy());
                log.info("getAcceptedDate "+ mm.getAcceptedDate());

            }

savedMember = memberRepo.save(mapMember);

            log.info("after save after reg {} ", savedMember.getMemberRegistrations());
        log.info("memberRegistrationRepo After All {}", memberRegistrationRepo.findAll());

            for (MemberRegistration mm : savedMember.getMemberRegistrations()) {
                log.info("after save after reg "+mm.getId());
                log.info("getYear "+mm.getYear() );
                log.info("getSchemeType "+mm.getSchemeType()) ;
                log.info("getAcceptedBy "+mm.getAcceptedBy());
                log.info("getAcceptedDate"+ mm.getAcceptedDate());
            }

Set<DependantDTO> dependants = memberDTO.getDependants();
Member finalMember = savedMember;
            dependants.forEach(d -> {
Dependant dependant = new Dependant();
                dependant.setId(d.getId());
        dependant.setName(d.getName());
        dependant.setNic(d.getNic());
        dependant.setDob(d.getDob());
Dependant newDep = dependantRepo.save(dependant);
DependantData mdd = new DependantData();
                mdd.setRegisterYear(d.getRegisterYear());
        mdd.setRegisterDate(d.getRegisterDate());
        mdd.setRelationship(d.getRelationship());
        mdd.setDependant(newDep);
                mdd.setMember(finalMember);
                memberDependantDataRepo.save(mdd);
            });

Set<BeneficiaryDTO> beneficiaries = memberDTO.getBeneficiaries();
            beneficiaries.forEach(d -> {
Beneficiary beneficiary = new Beneficiary();
                beneficiary.setId(d.getId());
        beneficiary.setName(d.getName());
        beneficiary.setNic(d.getNic());
Beneficiary newBen = beneficiaryRepo.save(beneficiary);
BeneficiaryData bnd = new BeneficiaryData();
                bnd.setPercent(d.getPercent());
        bnd.setRelationship(d.getRelationship());
        bnd.setBeneficiary(newBen);
                bnd.setRegisterDate(d.getRegisterDate());
        bnd.setRegisterYear(d.getRegisterYear());
        bnd.setMember(finalMember);
                beneficiaryDataRepo.save(bnd);
            });

Member successMember = memberRepo.findByEmpNoIgnoreCase(memberDTO.getEmpNo());

            if (!Objects.isNull(successMember)) {
Map<String, Object> variables = new HashMap<>();
                variables.put("name", successMember.getName());
        variables.put("schemaLink", generateSchemeDownloadLink());
Optional<Integer> newRegYear = successMember.getMemberRegistrations().stream()
        .max(Comparator.comparing(Registration::getYear))
        .map(Registration::getYear);
                if (newRegYear.isPresent()) {
        variables.put("applicationLink", baseUrl + "/download/application/" + newRegYear.get() + "/" + successMember.getEmpNo());
        }
byte[] application = IcasUtil.genApplication(successMember);
                emailService.sendEmailWithAttachment(
        successMember.getEmail(),
                        "Online Application Received",
                                "email-registration",
variables, application, "Application.pdf");
response = successMember;
            }
                    } catch (Exception ex) {
        ex.printStackTrace();
        }
                return response;
    }
        public Member addRegistration(Member member) {
            log.info("addRegistration 323", member.getId());
            Set<MemberRegistration> regData = memberRegistrationRepo.findByMember(new Member(member.getId()));
            log.info("MemberRegistration ", regData.stream().toArray().toString());
            member.getMemberRegistrations().addAll(regData.stream()
                    .map(rd -> {
                        MemberRegistration mr = new MemberRegistration();
                        mr.setSchemeType(rd.getSchemeType());
                        mr.setYear(rd.getYear());
                        mr.setAcceptedDate(rd.getAcceptedDate());
                        mr.setAcceptedBy(rd.getAcceptedBy());
                        return mr;
                    }).collect(Collectors.toSet()));
            return member;
        }
    */
    /*
        @Deprecated
        @Transactional
        @Async
        @Override
        public ResponseEntity<byte[]> signUp(MemberDTO memberDTO) {
            ResponseEntity<byte[]> response = null;
            try {
                if (!validateMemberRest(memberDTO)) {
                    return new ResponseEntity<>(new byte[]{'i', 'n', 'v', 'a', 'l', 'i', 'd'}, HttpStatus.INTERNAL_SERVER_ERROR);
                }
                Member member = memberRepo.findByEmpNoIgnoreCase(memberDTO.getEmpNo());
                Member mapMember = ObjectMapper.mapToMember(memberDTO);
                if (Objects.isNull(member)) {
                    memberRepo.save(mapMember);
                }
                Member savedMember = memberRepo.findByEmpNoIgnoreCase(memberDTO.getEmpNo());

                MemberRegistration memberRegistration = ObjectMapper.mapToMemberRegistration(memberDTO.getMemberRegistrations());
                MemberRegistration oldReg = memberRegistrationRepo.findByYearAndMember(memberRegistration.getYear(), savedMember);
                if (Objects.isNull(oldReg)) {
                    memberRegistration.setMember(savedMember);
                    memberRegistrationRepo.save(memberRegistration);
                } else {
                    throw new Exception("Already register for the year " + memberRegistration.getYear());
                }


                Set<DependantDTO> dependants = memberDTO.getDependants();
                dependants.forEach(d -> {
                    Dependant dependant = new Dependant();
                    dependant.setId(d.getId());
                    dependant.setName(d.getName());
                    dependant.setNic(d.getNic());
                    dependant.setDob(d.getDob());
                    Dependant newDep = dependantRepo.save(dependant);
                    MemberDependantData mdd = new MemberDependantData();
                    mdd.setRegisterYear(memberRegistration.getYear());
                    mdd.setRelationship(d.getRelationship());
                    mdd.setDependant(newDep);
                    mdd.setMember(savedMember);
                    memberDependantDataRepo.save(mdd);
                });

                Set<BeneficiaryDTO> beneficiaries = memberDTO.getBeneficiaries();
                beneficiaries.forEach(d -> {
                    Beneficiary beneficiary = new Beneficiary();
                    beneficiary.setId(d.getId());
                    beneficiary.setName(d.getName());
                    beneficiary.setNic(d.getNic());
                    Beneficiary newBen = beneficiaryRepo.save(beneficiary);
                    BeneficiaryData bnd = new BeneficiaryData();
                    bnd.setPercent(d.getPercent());
                    bnd.setRelationship(d.getRelationship());
                    bnd.setBeneficiary(newBen);
                    bnd.setRegisterDate(d.getRegisterDate());
                    bnd.setMember(savedMember);
                    beneficiaryDataRepo.save(bnd);
                });
                log.info("Saved Member {}", savedMember);
            } catch (Exception ex) {
                ex.printStackTrace();
                log.info("some error occurred");
                response = new ResponseEntity<>(new byte[]{'e', 'r', 'r', 'o', 'r'}, HttpStatus.INTERNAL_SERVER_ERROR);
            } finally {
                Member successMember = memberRepo.findByEmpNoIgnoreCase(memberDTO.getEmpNo());
                //sendEmailToNewMember(requestMap.get("email"));
                log.info("finally successMember member {}", successMember);
                if (!Objects.isNull(successMember))
                    response = new ResponseEntity<>(genApplication(successMember), HttpStatus.OK);
            }
            return response;
        }
    */

