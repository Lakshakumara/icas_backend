package com.yml.icas.service.interfaces;

import com.yml.icas.dto.MemberDTO;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;

import java.util.List;
import java.util.Map;

public interface MemberService {
    ResponseEntity<Integer> updateMember(String criteria, Map<String, Object> dataSet);

   // ResponseEntity<byte[]> signUp(MemberDTO memberDTO);

    Object signUpNew(MemberDTO memberDTO);

    ResponseEntity<MemberDTO> getMember(String empNo);

    ResponseEntity<String[]> getRelationShip(String rs);

    Page<MemberDTO> searchMember(Map<String, Object> searchParams);

    Page<MemberDTO> getMembers(int page, int size, String search);

    void updateRoles(Integer memberId, List<String> roles);
}
