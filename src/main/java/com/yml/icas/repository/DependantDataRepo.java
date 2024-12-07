package com.yml.icas.repository;

import com.yml.icas.model.DependantData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface DependantDataRepo extends JpaRepository<DependantData, Integer> {


    @Query("SELECT m.relationship FROM DependantData m WHERE m.relationship LIKE %:rs%")
    String[] findDistinctByRelationshipLike(@Param("rs") String rs);
/*
    DependantData findMemberDependantDataByAndDependant_Name(@Param("dependantName") String dependantName);

    List<DependantData> findMemberDependantDataByMember_IdAndRegisterYear(
            @Param("memberId") Integer memberId, @Param("year") Integer year);*/
}
