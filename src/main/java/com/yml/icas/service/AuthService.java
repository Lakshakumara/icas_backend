package com.yml.icas.service;

import com.yml.icas.control.ChangePasswordRequest;
import com.yml.icas.dto.MessageResponse;
import com.yml.icas.model.User;
import com.yml.icas.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.Optional;

@RequiredArgsConstructor
@Slf4j
@Service
public class AuthService {

    private final UserRepository userRepository;


    private final PasswordEncoder passwordEncoder;

    public ResponseEntity<?> changeDefaultPassword(ChangePasswordRequest request, Principal principal) {
        String empNo = principal.getName(); // fetched from JWT
        System.out.println(empNo);
        Optional<User> optionalUser = userRepository.findByEmpNo(empNo);
        if (optionalUser.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new MessageResponse("User not found"));
        }
        System.out.println("User Found");
        User user = optionalUser.get();

        if (!passwordEncoder.matches(request.getOldPassword(), user.getPassword())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Current password is incorrect"));
        }

        if (!user.isDefaultPassword()) {
            return ResponseEntity.badRequest().body(new MessageResponse("Password already changed"));
        }

        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        user.setDefaultPassword(false);
        User uu = userRepository.save(user);
System.out.println(uu);
        return ResponseEntity.ok(new MessageResponse("Password changed successfully"));
    }
}
