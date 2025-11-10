package com.yml.icas.service;

import com.yml.icas.model.Role;
import com.yml.icas.model.User;
import com.yml.icas.repository.RoleRepository;
import com.yml.icas.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // 🟢 Add a new user
    public User createUser(String empNo, String rawPassword, Set<String> roleNames) {
        if (userRepository.existsByEmpNo(empNo)) {
            throw new RuntimeException("User already exists");
        }
        Set<Role> roles = roleRepository.findByRoleIn(roleNames);
        User user = new User(empNo, passwordEncoder.encode(rawPassword), roles);
        return userRepository.save(user);
    }

    // Update user password
    public User updatePassword(String empNo, String newPassword) {
        User user = userRepository.findByEmpNo(empNo)
                .orElseThrow(() -> new RuntimeException("User not found"));

        user.setPassword(passwordEncoder.encode(newPassword));
        return userRepository.save(user);
    }

    //Delete user
    public void deleteUser(String empNo) {
        User user = userRepository.findByEmpNo(empNo)
                .orElseThrow(() -> new RuntimeException("User not found"));
        userRepository.delete(user);
    }

    // Add roles to a user
    public User addRolesToUser(String empNo, Set<String> roleNames) {
        User user = userRepository.findByEmpNo(empNo)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Set<Role> roles = roleRepository.findByRoleIn(roleNames);
        user.getRoles().addAll(roles);
        return userRepository.save(user);
    }

    // Remove roles from a user
    public User removeRolesFromUser(String empNo, Set<String> roleNames) {
        User user = userRepository.findByEmpNo(empNo)
                .orElseThrow(() -> new RuntimeException("User not found"));

        user.getRoles().removeIf(role -> roleNames.contains(role.getRole()));
        return userRepository.save(user);
    }
    public User updateUserRoles(String empNo, List<String> roleNames) {
        User user = userRepository.findByEmpNo(empNo)
                .orElseThrow(() -> new RuntimeException("User not found"));
        Set<Role> roles = roleRepository.findByRoleIn(roleNames);
        user.setRoles(roles);
        return userRepository.save(user);
    }

    public Set<Role> getUserRoles(String empNo) {
        User user = userRepository.findByEmpNo(empNo)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return  user.getRoles();
    }
}

