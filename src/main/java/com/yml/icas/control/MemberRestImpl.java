package com.yml.icas.control;

import com.yml.icas.dto.BeneficiaryDTO;
import com.yml.icas.dto.DependantDTO;
import com.yml.icas.dto.MemberDTO;
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
    public ResponseEntity<MemberDTO> signup(MemberDTO memberDTO) {
        MemberDTO member = memberService.signUpNew(memberDTO);
        return ResponseEntity.ok(member);
    }

    @Override
    public ResponseEntity<MemberDTO> getMember(String empNo) {
        try {
            return memberService.getMember(empNo);
        } catch (Exception ex) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<Page<MemberDTO>> searchMember(Map<String, Object> searchParams) {
        try {
            return new ResponseEntity<>(memberService.searchMember(searchParams), HttpStatus.OK);
        } catch (Exception ex) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /*@Override
    public ResponseEntity<Set<BeneficiaryDTO>> getMemberBeneficiariesWithoutName(int year, String empNo) {
        return getMemberBeneficiaries(year, empNo, null);
    }*/

    @Override
    public ResponseEntity<Set<BeneficiaryDTO>> getMemberBeneficiaries(int year, String empNo, String name) {
        log.info("year={} empNo={} name={}", year, empNo, name);
        Set<BeneficiaryDTO> beneficiaryDTOS = new HashSet<>();
        try {
            beneficiaryDTOS = memberService.getMemberBeneficiaries(year, empNo, name);
            return ResponseEntity.ok(beneficiaryDTOS);
        } catch (Exception ex) {
            return new ResponseEntity<>(beneficiaryDTOS, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<Set<DependantDTO>> getMemberDependants(int year, String empNo, String name) {

        log.info("year={} empNo={} name={}", year, empNo, name);
        Set<DependantDTO> dependants = new HashSet<>();
        try {
            dependants = memberService.getMemberDependants(year, empNo, name);
            return ResponseEntity.ok(dependants);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(dependants, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<String[]> getRelationShip(String rs) {
        return memberService.getRelationShip(rs);
    }

    public ResponseEntity<Void> updateRoles(Integer memberId, UpdateRolesRequest request) {
        memberService.updateRoles(memberId, request.getRoles());
        return ResponseEntity.noContent().build();
    }

    @Override
    public ResponseEntity<Integer> updateMember(String criteria, Map<String, Object> dataSet) {
        log.info(criteria + "dataset {}", dataSet);
        return memberService.updateMember(criteria, dataSet);
    }

    /*public ResponseEntity<Page<MemberDTO>> getMembers(int page, int size, String search) {
        Page<MemberDTO> members = memberService.getMembers(page, size, search);
        return ResponseEntity.ok(members);
    }*/
}
