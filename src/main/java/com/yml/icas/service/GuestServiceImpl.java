package com.yml.icas.service;

import com.yml.icas.dto.ClaimDataHistoryDTO;
import com.yml.icas.dto.MemberDTO;
import com.yml.icas.dto.ObjectMapper;
import com.yml.icas.model.Member;
import com.yml.icas.repository.*;
import com.yml.icas.service.interfaces.GuestService;
import com.yml.icas.service.interfaces.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.*;

@Slf4j
@Service
public class GuestServiceImpl implements GuestService {

    @Autowired
    MemberRepo memberRepo;

    @Autowired
    RegistrationRepo memberRegistrationRepo;

    @Autowired
    SchemeDataRepo schemeDataRepo;

    @Autowired
    ClaimDataRepo claimDataRepo;

    @Autowired
    RoleRepo roleRepo;

    @Autowired
    MemberService memberService;

    @Autowired
    UserRepository userRepository;

    @Override
    public ResponseEntity<Map<String, Object>> memberValidation(Integer year, String empNo) {
        Map<String, Object> response = new HashMap<>();
        HttpStatus statusGest;
        try {
            Member member = memberRepo.findByEmpNoIgnoreCase(empNo);
            MemberDTO memberDTO = ObjectMapper.mapToMemberDTO(member);

            if (Objects.isNull(memberDTO)) {
                response.put("isMember", false);
            } else {
                response.put("isMember", true);
                response.put("member", memberDTO);
 /*
                Set<MemberRegistration> mr = memberRegistrationRepo.findByMember(new Member(member.getId()));
                log.info("guest MemberRegistration {}", mr);
                Set<Map<String, Object>> aa = mr.stream().map(data -> {
                    data.setMember(null);
                    Map<String, Object> i = new HashMap<>();
                    i.put("id", data.getId());
                    i.put("year", data.getYear());
                    return i;
                }).collect(Collectors.toSet());
                response.put("registration", aa);*/
            }
            statusGest = HttpStatus.OK;
        } catch (Exception ex) {
            statusGest = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return new ResponseEntity<>(response, statusGest);
    }

    @Override
    public Page<Set<Map<String, Object>>> getHis() {
        Pageable pageable = PageRequest.of(0, 50);
        String empNo = "100";
        List<String> idTextList = null;
        Page<ClaimDataHistoryDTO> ch = claimDataRepo
                .getClaimDataHistoryAll(empNo, null, pageable);
        ch.stream().forEach(p->{
            log.info("\n values {}",  p);
        });
        log.info("\n fetch {}",  ch.getContent());

       /* Role r = roleRepo.findByRole("ROLE_USER");
        List<Member> allMembers = memberService.getAllMembers();
        for (Member m : allMembers) {
            User userx = new User(m.getEmpNo(), m.getPassword(), Set.of(r));
            System.out.println(userx);
            userRepository.save(userx);
            m.setUser(userx);
            memberRepo.save(m);
        }*/
        return null;
    }
}
