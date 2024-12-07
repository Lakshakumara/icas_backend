package com.yml.icas.repository;

import com.yml.icas.dto.DependantDTO;
import com.yml.icas.model.Dependant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Set;

public interface DependantRepo extends JpaRepository<Dependant, Integer> {
    Dependant findByName(@Param("name") String name);

    @Query("select new com.yml.icas.dto.DependantDTO(md.id, md.dependant.name," +
            "md.dependant.nic, md.dependant.dob, md.relationship, md.registerDate, md.registerYear, md.deleted) from DependantData md " +
            "where md.registerYear=:year and md.member.empNo=:empNo")
    Set<DependantDTO> findAllByEmpNo(@Param("year") int year,
                                     @Param("empNo") String empNo);
}
