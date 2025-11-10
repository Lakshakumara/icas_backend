package com.yml.icas.repository;

import com.yml.icas.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {
    Set<Role> findByRoleIn(Set<String> names);
    Set<Role> findByRoleIn(List<String> names);
}
