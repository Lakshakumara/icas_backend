package com.yml.icas.repository;

import com.yml.icas.model.Member;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MemberRepo extends JpaRepository<Member, Integer> {
    @Query("SELECT m FROM Member m WHERE " +
            "(:filter IS NULL OR :filter = '' OR " +
            "lower(m.empNo) LIKE lower(concat(:filter, '%')) OR " +
            "lower(m.name) LIKE lower(concat(:filter, '%')) OR " +
            "lower(m.name) LIKE lower(concat('% ', :filter, '%'))) ")
    Page<Member> getMembers(@Param("filter") String filter, Pageable pageable);

    Page<Member> findAllByEmpNoContainsIgnoreCase(String empNo, Pageable pageable);

    Page<Member> findAllByNameContainsIgnoreCase(String name, Pageable pageable);

    @Query("Select m from Member m where lower(m.empNo) = lower(:empNo)")
    Member getMember(@Param("empNo") String empNo);

    Member findByEmpNoIgnoreCase(@Param("empNo") String empNo);
/*

    Page<Member> findByNameContainingIgnoreCase(String name, Pageable pageable);

    @Query("Select m.id from Member m where lower(m.empNo) = lower(:empNo)")
    Integer getMemberId(@Param("empNo") String empNo);

    @Query("Select m from Member m, MemberRegistration mr " +
            " where m.id = mr.member.id and mr.year= :regYear")
    Set<Member> findByRegYear(@Param("regYear") Integer regYear);

    @Query("Select m from Member m where m.status = :status")
    Set<Member> findAllByStatusIgnoreCase(@Param("status") String status);
*/
    @Query(value = "UPDATE Member set registrationOpen =:regYear where deleted = false" +
            " and registrationOpen != :regYear ",
            nativeQuery = true)
    Integer updateRegistrationAll(Integer regYear);

    @Query(value = "UPDATE Member set registrationOpen =:regYear where deleted = false" +
            " and empNo = :empNo ",
            nativeQuery = true)
    Integer updateRegistrationMember(String empNo, Integer regYear);
}
