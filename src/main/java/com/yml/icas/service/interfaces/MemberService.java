package com.yml.icas.service.interfaces;

import com.yml.icas.dto.BeneficiaryDTO;
import com.yml.icas.dto.DependantDTO;
import com.yml.icas.dto.MemberDTO;
import com.yml.icas.model.Member;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface MemberService {
    List<Member> getAllMembers();
    ResponseEntity<Integer> updateMember(String criteria, Map<String, Object> dataSet);

   // ResponseEntity<byte[]> signUp(MemberDTO memberDTO);

    MemberDTO signUpNew(MemberDTO memberDTO);

    ResponseEntity<MemberDTO> getMember(String empNo);

    ResponseEntity<String[]> getRelationShip(String rs);

    Page<MemberDTO> searchMember(Map<String, Object> searchParams);

    Page<MemberDTO> getMembers(int page, int size, String search);

    void updateRoles(Integer memberId, List<String> roles);

    Set<BeneficiaryDTO> getMemberBeneficiaries(int year, String empNo, String name);
    Set<DependantDTO> getMemberDependants(int year, String empNo, String name);
}
