package com.yml.icas.repository;

import com.yml.icas.model.Role;
import com.yml.icas.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Set;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findByEmpNo(String empNo);
    boolean existsByEmpNo(String empNo);
}