package com.yml.icas.hr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HrService {

    @Autowired
    HRDao hrDao;

    public HR getEmployee(String empNo) {
        return hrDao.findByEmpNo(empNo);
    }

    public HR save(HR hr) {
        return hrDao.save(hr);
    }
}
