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
    UserRepository userRepository;

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

    @Override
    public ResponseEntity<Integer> updateMember(String criteria, Map<String, Object> dataSet) {
        Integer rows = 0;
        if (criteria.equalsIgnoreCase("registerOpen")) {
            if (dataSet.get("selector").toString().equalsIgnoreCase("all")) {
                memberRepo.updateRegistrationAll((Integer) dataSet.get("year"));
            } else {
                memberRepo.updateRegistrationMember(dataSet.get("selector").toString(), (Integer) dataSet.get("year"));
            }
            rows = 1;
        } else if (criteria.equalsIgnoreCase("memberAccept")) {
            // log.info("acceptedBy{} {} memberId{}", dataSet.get("acceptedBy"), LocalDate.now(), dataSet.get("memberId"));
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
        if (!validateMemberRest(memberDTO)) {
            throw new IllegalArgumentException("Invalid member data");
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
            //member.setPassword(hashedPassword);
            member.setMDate(memberDTO.getMDate());
            member.setStatus(memberDTO.getStatus());
            member.setPhotoUrl(memberDTO.getPhotoUrl());
            member.setDeleted(memberDTO.isDeleted());
            member.setRegistrationOpen(memberDTO.getRegistrationOpen());
            Set<RoleDTO> dd = memberDTO.getRoles();
            Set<Role> roles = dd.stream()
                    .map(roledto -> roleRepo.findByRole(roledto.getRole()))
                    .collect(Collectors.toSet());
            User user= userRepository.save(new User(memberDTO.getEmpNo(), hashedPassword, roles));
            member.setUser(user);
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
            //member.setPassword(memberDTO.getPassword());
            member.setMDate(memberDTO.getMDate());
            member.setStatus(memberDTO.getStatus());
            member.setPhotoUrl(memberDTO.getPhotoUrl());
            member.setDeleted(memberDTO.isDeleted());
            member.setRegistrationOpen(memberDTO.getRegistrationOpen());
        }
        int regYear;
        // Process member registrations
        for (RegistrationDTO temp : memberDTO.getMemberRegistrations()) {
            //  log.info("temp {}", temp);
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
            Optional<Dependant> newDep = dependantRepo.findByNameNicDob(d.getName(), d.getNic(), d.getDob());
            Dependant dependantNew;
            if (newDep.isPresent()) {
                dependantNew = newDep.get();
                System.out.println("Old Dep"+ dependantNew);
            }else{
                Dependant dependant = new Dependant();
                dependant.setId(d.getId());
                dependant.setName(d.getName());
                dependant.setNic(d.getNic());
                dependant.setDob(d.getDob());
                //log.info("dependant save {} to {}", d, dependant);
                dependantNew = dependantRepo.save(dependant);
            }
            DependantData dd = memberDependantDataRepo.findDuplicateData(
                    savedMember.getId(), dependantNew.getId(), d.getRegisterYear()
            );
            if (dd == null) {
                DependantData mdd = new DependantData();
                mdd.setRegisterYear(d.getRegisterYear());
                mdd.setRegisterDate(d.getRegisterDate());
                mdd.setRelationship(d.getRelationship());
                mdd.setDependant(dependantNew);
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
            //log.info("beneficiary save {}", d);
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

        // Retrieve the updated member with all associations
        MemberDTO response = memberRepo.getMemberDTOEmpNo(memberDTO.getEmpNo());
        response.setMemberRegistrations(memberRegistrationRepo.getMemberRegistration(0, memberDTO.getEmpNo()));
System.out.println("received "+memberDTO.getName());
        System.out.println("Saved "+response);
        // Send confirmation email
        /*Map<String, Object> variables = new HashMap<>();
        variables.put("name", response.getName());
        variables.put("schemaLink", generateSchemeDownloadLink());

        byte[] application = IcasUtil.genApplication(response);
        emailService.sendEmailWithAttachment(
                response.getEmail(),
                "Online Application Received",
                "email-registration",
                variables, application, "Application.pdf");*/
        return response;
    }

    @Override
    public ResponseEntity<MemberDTO> getMember(String empNo) {
        try {
            Member member = memberRepo.getDTO_empNo(empNo);
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

    @Override
    public Set<BeneficiaryDTO> getMemberBeneficiaries(int year, String empNo, String name) {
        try {
            return beneficiaryRepo.getEmployeeBeneficiaries(year, empNo, name);
        } catch (Exception ex) {
            return new HashSet<>();
        }
    }

    @Override
    public Set<DependantDTO> getMemberDependants(int year, String empNo, String name) {
        try {
            return dependantRepo.getEmployeeDependants(year, empNo, name);
        } catch (Exception ex) {
            return new HashSet<>();
        }
    }
}

    /*

    private String generateSchemeDownloadLink() {
        return baseUrl + "/download/scheme/2023";
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
    }*/
