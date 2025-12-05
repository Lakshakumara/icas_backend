package com.yml.icas.hr;

import com.yml.icas.hr.model.HR;
import com.yml.icas.hr.repository.HRRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HrService {
    @Autowired
    HRRepository hrRepository;

    public HR getEmployee(String empNo) {
        return hrRepository.findByEmpNoIgnoreCase(empNo);
    }

    public HR save(HR hr) {
        return hrRepository.save(hr);
    }

    public HR get() {
        return hrRepository.findByEmpNoIgnoreCase("100");
    }
}
