package com.yml.icas.repository;

import com.yml.icas.dto.MemberDTO;
import com.yml.icas.model.Member;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface MemberRepo extends JpaRepository<Member, Integer> {
    boolean existsByEmpNoIgnoreCase(String empNo);

    Optional<Member> findByEmpNo(String empNo);
    @Query("SELECT m FROM Member m WHERE LOWER(m.email) = LOWER(:email)")
    Optional<Member> findByEmail(String email);
    @Query("SELECT m FROM Member m WHERE " +
            "(:filter IS NULL OR :filter = '' OR " +
            "lower(m.empNo) LIKE lower(concat(:filter, '%')) OR " +
            "lower(m.name) LIKE lower(concat(:filter, '%')) OR " +
            "lower(m.name) LIKE lower(concat('% ', :filter, '%'))) ")
    Page<Member> getMembers(@Param("filter") String filter, Pageable pageable);

    Page<Member> findAllByNameContainsIgnoreCase(String name, Pageable pageable);

    @Query("SELECT m FROM Member m WHERE LOWER(m.empNo) = LOWER(:empNo)")
    Member findByEmpNoIgnoreCase(@Param("empNo") String empNo);

    @EntityGraph(value = "Member.withRegistrations", type = EntityGraph.EntityGraphType.LOAD)
    @Query("SELECT m FROM Member m WHERE LOWER(m.empNo) = LOWER(:empNo)")
    /*@Query("""
    SELECT DISTINCT m
    FROM Member m
    LEFT JOIN FETCH m.memberRegistrations r
    WHERE LOWER(m.empNo) = LOWER(:empNo)
    ORDER BY r.year DESC
    """)*/
    Member getDTO_empNo(@Param("empNo") String empNo);


    @Query("SELECT new com.yml.icas.dto.MemberDTO(m.id,m.empNo,m.name,m.address, m.email,m.contactNo, m.civilStatus, m.nic,m.sex, m.dob," +
            "m.designation, m.department, m.status, m.photoUrl, m.registrationOpen) " +
            "FROM Member m WHERE LOWER(m.empNo) = LOWER(:empNo)")
    MemberDTO getMemberDTOEmpNo(@Param("empNo") String empNo);
    @Modifying
    @Transactional
    @Query("UPDATE Member m set m.registrationOpen =:year where m.deleted=false and m.registrationOpen != :year ")
    void updateRegistrationAll(@Param("year") Integer year);
    @Modifying
    @Transactional
    @Query("UPDATE Member set registrationOpen =:year where deleted = false" +
            " and empNo =:empNo ")
    void updateRegistrationMember(@Param("empNo") String empNo, @Param("year") Integer yer);
}
