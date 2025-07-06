package com.yml.icas.service;

import com.yml.icas.model.Member;
import com.yml.icas.model.Role;
import com.yml.icas.model.User;
import com.yml.icas.repository.MemberRepo;
import com.yml.icas.repository.RoleRepo;
import com.yml.icas.repository.UserRepository;
import com.yml.icas.service.interfaces.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String empNo) throws UsernameNotFoundException {
        User user = userRepository.findByEmpNo(empNo)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));



        /*return new org.springframework.security.core.userdetails.User(
                user.getEmpNo(),
                user.getPassword(),
                user.getRoles().stream().map(role -> new SimpleGrantedAuthority(role.getRole())).collect(Collectors.toList())
        );*/
        return new CustomUserDetails(user);
    }
}

