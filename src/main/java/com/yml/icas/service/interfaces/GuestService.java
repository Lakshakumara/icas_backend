package com.yml.icas.service.interfaces;

import com.yml.icas.dto.HistoryDTO;
import org.springframework.http.ResponseEntity;

import java.util.Map;
import java.util.Set;

public interface GuestService {

    ResponseEntity<Map<String, Object>> memberValidation(Integer year, String empNo);

    Set<HistoryDTO> getHis();
}
