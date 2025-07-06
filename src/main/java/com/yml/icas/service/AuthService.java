package com.yml.icas.service;

import com.yml.icas.control.ChangePasswordRequest;
import com.yml.icas.control.ResetForgottenPasswordRequest;
import com.yml.icas.dto.MessageResponse;
import com.yml.icas.model.Member;
import com.yml.icas.model.User;
import com.yml.icas.repository.MemberRepo;
import com.yml.icas.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@RequiredArgsConstructor
@Slf4j
@Service
public class AuthService {

    private final UserRepository userRepository;

    private  final MemberRepo memberRepo;

    private final PasswordEncoder passwordEncoder;
    private  final EmailService emailService;

    public ResponseEntity<?> changeDefaultPassword(ChangePasswordRequest request, Principal principal) {
        String empNo = principal.getName(); // fetched from JWT
        Optional<User> optionalUser = userRepository.findByEmpNo(empNo);
        if (optionalUser.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new MessageResponse("User not found"));
        }
        User user = optionalUser.get();

        if (!passwordEncoder.matches(request.getOldPassword(), user.getPassword())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Current password is incorrect"));
        }

        if (!user.isDefaultPassword()) {
            return ResponseEntity.badRequest().body(new MessageResponse("Password already changed"));
        }

        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        user.setDefaultPassword(false);
        userRepository.save(user);
        return ResponseEntity.ok(new MessageResponse("Password changed successfully"));
    }

    public ResponseEntity<?> forgotPassword(Map<String, String> request) {
        String email = request.get("email");
        Optional<Member> optionalMember = memberRepo.findByEmail(email);
        if (optionalMember.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(new MessageResponse("Email is not Register as a Member"));
        }
        Member member = optionalMember.get();

        Optional<User> optionalUser = userRepository.findByEmpNo(member.getEmpNo());
        if (optionalUser.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(new MessageResponse("User not found"));
        }

        User user = optionalUser.get();

        // Generate a reset token (could also use UUID + expiry, etc.)
        String resetToken = UUID.randomUUID().toString();

        user.setResetToken(resetToken);
        user.setTokenExpiry(LocalDateTime.now().plusHours(1)); // optional
        userRepository.save(user);

        Map<String, Object> variables = new HashMap<>();
        variables.put("name", member.getName());
        variables.put("email", email);
        variables.put("resetToken", resetToken);
System.out.println(variables);
        System.out.println(resetToken);
        // Send token via email (you'd integrate email sending here)
        emailService.sendResetEmail(email, "Password Reset Link", "pwResetEmail",variables);

        return ResponseEntity.ok(new MessageResponse("Reset link sent to your email"));
    }

    public ResponseEntity<?> resetForgottenPassword(ResetForgottenPasswordRequest request) {
        Optional<User> optionalUser = userRepository.findByResetToken(request.getToken());
        if (optionalUser.isEmpty()) {
            return ResponseEntity.badRequest()
                    .body(new MessageResponse("Invalid or expired reset token"));
        }

        User user = optionalUser.get();

        // Optional: check if token expired
        if (user.getTokenExpiry().isBefore(LocalDateTime.now())) {
            return ResponseEntity.badRequest()
                    .body(new MessageResponse("Reset token has expired"));
        }

        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        user.setResetToken(null);
        user.setTokenExpiry(null);
        userRepository.save(user);

        return ResponseEntity.ok(new MessageResponse("Password reset successfully"));
    }
}
