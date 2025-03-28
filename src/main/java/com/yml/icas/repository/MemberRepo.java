package com.yml.icas.repository;

import com.yml.icas.dto.MemberDTO;
import com.yml.icas.model.Member;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface MemberRepo extends JpaRepository<Member, Integer> {

    Optional<Member> findByEmpNo(String empNo);

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
    Member getDTO_empNo(@Param("empNo") String empNo);


    @Query("SELECT new com.yml.icas.dto.MemberDTO(m.id,m.empNo,m.name,m.address, m.email,m.contactNo, m.civilStatus, m.nic,m.sex, m.dob," +
            "m.designation, m.department, m.status, m.photoUrl, m.registrationOpen) " +
            "FROM Member m WHERE LOWER(m.empNo) = LOWER(:empNo)")
    MemberDTO getMemberDTOEmpNo(@Param("empNo") String empNo);

    @Query("UPDATE Member set registrationOpen =:regYear where deleted = false" +
            " and registrationOpen != :regYear ")
    void updateRegistrationAll(Integer regYear);

    @Query("UPDATE Member set registrationOpen =:regYear where deleted = false" +
            " and empNo =:empNo ")
    void updateRegistrationMember(String empNo, Integer regYear);

    /*
Page<Member> findAllByEmpNoContainsIgnoreCase(String empNo, Pageable pageable);
@Query("Select m from Member m where lower(m.empNo) = lower(:empNo)")
    Member getMember(@Param("empNo") String empNo);
    Page<Member> findByNameContainingIgnoreCase(String name, Pageable pageable);

    @Query("Select m.id from Member m where lower(m.empNo) = lower(:empNo)")
    Integer getMemberId(@Param("empNo") String empNo);

    @Query("Select m from Member m, MemberRegistration mr " +
            " where m.id = mr.member.id and mr.year= :regYear")
    Set<Member> findByRegYear(@Param("regYear") Integer regYear);

    @Query("Select m from Member m where m.status = :status")
    Set<Member> findAllByStatusIgnoreCase(@Param("status") String status);
*/
}
