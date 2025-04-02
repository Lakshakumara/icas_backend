package com.yml.icas.service;

import com.yml.icas.model.Member;
import com.yml.icas.model.Role;
import com.yml.icas.repository.MemberRepo;
import com.yml.icas.util.JwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
@Slf4j
@Service
public class AuthService {
    @Autowired
    private MemberRepo memberRepo;

    @Autowired
    MemberServiceImpl memberService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    public String authenticate(String username, String password) {
       // memberService.updateExistingPasswords();
        Member user = memberRepo.findByEmpNo(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new BadCredentialsException("Invalid credentials");
        }

        return JwtUtil.generateToken(username, user.getRoles().stream().map(Role::getRole).toList()); // Generate JWT token
    }
}
