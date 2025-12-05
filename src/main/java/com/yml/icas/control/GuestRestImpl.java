package com.yml.icas.control;

import com.yml.icas.hr.HrService;
import com.yml.icas.hr.model.HR;
import com.yml.icas.service.GuestServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;
import java.util.Set;

@Slf4j
@RestController
public class GuestRestImpl implements GuestRest {
    @Autowired
    GuestServiceImpl guestService;

    @Autowired
    HrService hrService;
    @Override
    public ResponseEntity<Map<String, Object>> memberValidation(Integer year, String empNo) {
        return guestService.memberValidation(year, empNo);
    }

    @Override
    public ResponseEntity<Page<Set<Map<String, Object>>>> getHis() {
        return ResponseEntity.ok(guestService.getHis());
    }

    @Override
    public ResponseEntity<?> test() {
        HR hr = new HR();
        hr.setEmpNo("aa");
        hr.setName("Saman");
        HR hr1 = hrService.get();
        return ResponseEntity.ok(hr1);
    }
}