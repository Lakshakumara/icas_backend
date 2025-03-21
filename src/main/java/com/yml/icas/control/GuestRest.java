package com.yml.icas.control;

import com.yml.icas.dto.HistoryDTO;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;
import java.util.Set;

//@CrossOrigin(origins = {"http://192.168.43.181:4200", "http://localhost:4200"}))
@CrossOrigin(origins = "*")
@RequestMapping(path = "/guest")
public interface GuestRest {

    @GetMapping(path = "/{year}/{empNo}")
    ResponseEntity<Map<String, Object>> memberValidation(@PathVariable(name = "year") Integer year,
                                                         @PathVariable(name = "empNo") String empNo);

    @GetMapping()
    ResponseEntity<Page<Set<Map<String, Object>>>> getHis();

}
