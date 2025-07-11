package com.yml.icas.repository;

import com.yml.icas.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findByEmpNo(String empNo);

    Optional<User> findByResetToken(String token);
    boolean existsByEmpNo(String empNo);
}