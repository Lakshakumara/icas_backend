package com.yml.icas.repository;

import com.yml.icas.model.DependantData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface DependantDataRepo extends JpaRepository<DependantData, Integer> {

    @Query("SELECT d FROM DependantData d WHERE d.member.id = :member_id AND d.registerYear = :registeryear AND d.dependant.id = :dependant_id")
    DependantData findDuplicateData(@Param("member_id") int member_id,  @Param("dependant_id") int dependant_id, @Param("registeryear") int registeryear);

    @Query("SELECT m.relationship FROM DependantData m WHERE m.relationship LIKE %:rs%")
    String[] findDistinctByRelationshipLike(@Param("rs") String rs);
}