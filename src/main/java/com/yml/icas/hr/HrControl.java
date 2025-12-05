package com.yml.icas.hr;

import com.yml.icas.hr.model.HR;
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
   /* @PostMapping(path = "/add")
    ResponseEntity<HR> addHR(@RequestBody HRDTO hrdto){
        try {
            return ResponseEntity.ok(hrService.save(getHR(hrdto)));
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }*/
}