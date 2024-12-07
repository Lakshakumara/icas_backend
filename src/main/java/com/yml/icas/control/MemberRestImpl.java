package com.yml.icas.control;

import com.yml.icas.dto.BeneficiaryDTO;
import com.yml.icas.dto.MemberDTO;
import com.yml.icas.dto.ObjectMapper;
import com.yml.icas.model.Member;
import com.yml.icas.service.MemberServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Slf4j
@RestController
public class MemberRestImpl implements MemberRest {
    @Autowired
    MemberServiceImpl memberService;

    @Override
    public ResponseEntity<MemberDTO> signupNew(MemberDTO memberDTO) {
        try {
            log.info(memberDTO.toString());
            Member member = memberService.signUpNew(memberDTO);
            return ResponseEntity.ok(ObjectMapper.mapToMemberDTO(member));
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(new MemberDTO(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<MemberDTO> getMember(String empNo) {
        try {
            return memberService.getMember(empNo);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<Page<MemberDTO>> searchMember(Map<String, Object> searchParams) {
        try {
            return new ResponseEntity<>(memberService.searchMember(searchParams), HttpStatus.OK);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<Set<BeneficiaryDTO>> getBeneficiaries(int year, String empNo) {
        Set<BeneficiaryDTO> beneficiaryDTOS= new HashSet<>();
        try {
            beneficiaryDTOS =  memberService.getBeneficiaries(year, empNo);
            return ResponseEntity.ok(beneficiaryDTOS);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(beneficiaryDTOS, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<String[]> getRelationShip(String rs) {
        return memberService.getRelationShip(rs);
    }

    public ResponseEntity<Void> updateRoles( Integer memberId, UpdateRolesRequest request) {
        memberService.updateRoles(memberId, request.getRoles());
        return ResponseEntity.noContent().build();
    }
    @Override
    public ResponseEntity<Integer> updateMember(String criteria, Map<String, Object> dataSet) {
        log.info(criteria +"dataset {}",dataSet);
        return memberService.updateMember(criteria, dataSet);
    }

    /*public ResponseEntity<Page<MemberDTO>> getMembers(int page, int size, String search) {
        Page<MemberDTO> members = memberService.getMembers(page, size, search);
        return ResponseEntity.ok(members);
    }*/
}
