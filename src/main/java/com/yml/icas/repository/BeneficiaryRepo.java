package com.yml.icas.repository;

import com.yml.icas.dto.BeneficiaryDTO;
import com.yml.icas.model.Beneficiary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Set;

public interface BeneficiaryRepo extends JpaRepository<Beneficiary, Integer> {
    @Query("select new com.yml.icas.dto.BeneficiaryDTO(bd.id, bd.beneficiary.name," +
            "bd.beneficiary.nic, bd.relationship, bd.percent, bd.registerDate, " +
            "bd.registerYear, bd.deleted) from BeneficiaryData bd " +
            "where bd.registerYear=:year and bd.member.empNo=:empNo")
    Set<BeneficiaryDTO> findAllByEmpNo(int year, String empNo);
}
