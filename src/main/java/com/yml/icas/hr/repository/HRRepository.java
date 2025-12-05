package com.yml.icas.hr.repository;

import com.yml.icas.hr.model.HR;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface HRRepository extends JpaRepository<HR, Integer> {
    @Query("SELECT h FROM HR h WHERE LOWER(h.empNo) = LOWER(:empNo)")
    HR findByEmpNoIgnoreCase(@Param("empNo") String empNo);
}