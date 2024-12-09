package com.yml.icas.service;

import com.yml.icas.dto.HistoryDTO;
import com.yml.icas.dto.MemberDTO;
import com.yml.icas.dto.ObjectMapper;
import com.yml.icas.model.Member;
import com.yml.icas.repository.RegistrationRepo;
import com.yml.icas.repository.MemberRepo;
import com.yml.icas.repository.SchemeDataRepo;
import com.yml.icas.service.interfaces.GuestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
    public Set<HistoryDTO> getHis() {
        HistoryDTO opd = new HistoryDTO("2,4.1-OPD", schemeDataRepo.getOPD(), schemeDataRepo.getMaxAmount("2.1"));
        HistoryDTO sh = new HistoryDTO("1-Surgical & Hospital Expenses", schemeDataRepo.getSH(), schemeDataRepo.getMaxAmount("1"));
        HistoryDTO pa = new HistoryDTO("3-Personal Accident", schemeDataRepo.getPA(), schemeDataRepo.getMaxAmount("3.2.a"));
        HistoryDTO cr = new HistoryDTO("5-Critical Illness", schemeDataRepo.getCR(), schemeDataRepo.getMaxAmount("5.1"));


        Set<HistoryDTO> data = new HashSet<>();
        data.add(opd);
        data.add(sh);
        data.add(pa);
        data.add(cr);
        return data;
    }
}
