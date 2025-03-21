package com.yml.icas.service.interfaces;

import com.yml.icas.dto.DependantDTO;
import org.springframework.http.ResponseEntity;

import java.util.Set;


public interface DependantService {
    ResponseEntity<DependantDTO> getDependant(String depName);
}
