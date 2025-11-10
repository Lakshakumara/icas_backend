package com.yml.icas.repository;

import com.yml.icas.dto.RegistrationDTO;
import com.yml.icas.model.Registration;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.Date;
import java.util.Set;

public interface RegistrationRepo extends JpaRepository<Registration, Integer> {
    @Modifying
    @Transactional
    @Query(value = "UPDATE member_registration set acceptedby=:acceptedBy, accepteddate=:accepteddate " +
            "where member_id=:memberId and acceptedby is null", nativeQuery = true)
    Integer acceptRegistration(@Param("acceptedBy") Integer acceptedBy,
                               @Param("accepteddate") LocalDate accepteddate, @Param("memberId") Integer memberId);

    @Query("SELECT r FROM Registration r WHERE " +
            "(:filter IS NULL OR :filter = '' OR " +
            "lower(r.member.empNo) LIKE lower(concat('%', :filter, '%')) OR " +
            "lower(r.member.name) LIKE lower(concat('%', :filter, '%'))) " +
            "AND (cast(:acceptedDate as date) IS NULL AND r.acceptedDate IS NULL " +
            "OR cast(:acceptedDate as date) IS NOT NULL AND r.acceptedDate = cast(:acceptedDate as date)) " +
            "ORDER BY r.acceptedDate")
    Page<Registration> filterRegistration(
            @Param("filter") String filter,
            @Param("acceptedDate") Date acceptedDate,
            Pageable pageable);
    @Query("SELECT new com.yml.icas.dto.RegistrationDTO(r.id, r.member.id,r.year,r.schemeType,r.registerDate, r.acceptedDate,r.acceptedBy) " +
            "FROM Registration r " +
            "WHERE r.member.empNo=:empNo " +
            "AND (:year IS NULL OR :year = 0 OR r.year = :year)")
    Set<RegistrationDTO> getMemberRegistration(@Param("year") Integer year, @Param("empNo") String empNo);
}
