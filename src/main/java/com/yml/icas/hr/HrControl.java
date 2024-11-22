package com.yml.icas.hr;

import com.yml.icas.dto.ClaimDTO;
import com.yml.icas.repository.SchemeDataRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "*")
@RequestMapping(path = "/hr")
@RestController
public class HrControl {

    @Autowired
    HrService hrService;

    @Autowired
    SchemeDataRepo schemeDataRepo;

    @GetMapping("/{empNo}")
    public ResponseEntity<HR> getEmployee(@PathVariable("empNo") String empNo) {
        try {
            HR employee = hrService.getEmployee(empNo);
            System.out.println(employee);
            return ResponseEntity.ok((employee==null)?new HR():employee);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping(path = "/add")
    ResponseEntity<HR> addHR(@RequestBody HRDTO hrdto){
        try {
            return ResponseEntity.ok(hrService.save(getHR(hrdto)));
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    private HR getHR(HRDTO hrdto){
        HR r = new HR();
        r.setId(hrdto.getId());
        r.setAddress(hrdto.getAddress());
        r.setContactNo(hrdto.getContactNo());
        r.setDob(hrdto.getDob());
        r.setDesignation(hrdto.getDesignation());
        r.setDepartment(hrdto.getDepartment());
        r.setEmail(hrdto.getEmail());
        r.setEmpNo(hrdto.getEmpNo());
        r.setNic(hrdto.getNic());
        r.setName(hrdto.getName());
        r.setSex(hrdto.getSex());
        r.setCivilStatus(hrdto.getCivilStatus());
        r.setDeleted(hrdto.isDeleted());
        r.setDeletedDate(hrdto.getDeletedDate());
        r.setPhotoUrl(hrdto.getPhotoUrl());
        return r;
    }
}