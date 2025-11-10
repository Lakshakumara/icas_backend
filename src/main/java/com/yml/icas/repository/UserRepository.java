package com.yml.icas.repository;

import com.yml.icas.model.Role;
import com.yml.icas.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Set;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findByEmpNo(String empNo);
    //@Query("select User from User where User.empNo=:empNo")
    //Set<Role> findUserRoles(@Param("empNo") String empNo);
    Optional<User> findByResetToken(String token);
    boolean existsByEmpNo(String empNo);
}