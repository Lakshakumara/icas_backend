package com.yml.icas.repository;

import com.yml.icas.dto.DependantDTO;
import com.yml.icas.model.Dependant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.Optional;
import java.util.Set;

public interface DependantRepo extends JpaRepository<Dependant, Integer> {

    Dependant findByName(@Param("name") String name);

    @Query("SELECT d FROM Dependant d WHERE d.name = :name AND d.nic = :nic AND d.dob = :dob")
    Optional<Dependant> findByNameNicDob(@Param("name") String name, @Param("nic") String nic, @Param("dob") Date dob);

    @Query("select new com.yml.icas.dto.DependantDTO(md.dependant.id, md.dependant.name," +
            "md.dependant.nic, md.dependant.dob, md.relationship, md.registerDate, md.registerYear, md.deleted) " +
            "from DependantData md " +
            "where (:searchYear IS NULL OR :searchYear = 0 OR md.registerYear=:searchYear) " +
            "and (:name IS NULL OR :name = '' OR lower(md.dependant.name) = lower(:name)) " +
            "and md.member.empNo=:empNo")
    Set<DependantDTO> getEmployeeDependants(@Param("searchYear") int searchYear,
                                     @Param("empNo") String empNo,
                                     @Param("name") String name);
}
