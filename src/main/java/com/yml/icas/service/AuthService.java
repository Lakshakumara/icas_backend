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
import org.springframework.beans.factory.annotation.Value;
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
import java.util.concurrent.CompletableFuture;

@RequiredArgsConstructor
@Slf4j
@Service
public class AuthService {
    @Value("${app.frontend.base-url}")
    private String baseUrl;
    private final UserRepository userRepository;
    private final MemberRepo memberRepo;
    private final EmailService emailService;

    private final PasswordEncoder passwordEncoder;

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
                    .body(new MessageResponse("Email Does not exists"));
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

        // Send token via email (you'd integrate email sending here)
        Map<String, Object> variables = new HashMap<>();
        variables.put("name", member.getName());
        variables.put("username", member.getEmpNo());
        variables.put("resetUrl", baseUrl+"/reset-password?token="+resetToken);
        variables.put("expiryHours", 1);
        //emailService.sendEmailAsync(member.getEmail(), "Password Reset Link","email-forgot-password", variables);

        try {
            // 🔹 Use the improved async method (returns CompletableFuture)
            CompletableFuture<Boolean> result = emailService.sendEmailAsyncNew(
                    member.getEmail(),
                    "Password Reset Link",
                    "email-forgot-password",
                    variables
            );

            // Option 1 — Fire and forget (non-blocking)
            // result.exceptionally(ex -> {
            //     log.error("Failed to send reset email to {}", email, ex);
            //     return false;
            // });

            // Option 2 — Wait for result (blocking briefly until email thread finishes)
            result.join(); // Wait for the async method to complete
            return ResponseEntity.ok(new MessageResponse("Reset link sent to your email"));

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new MessageResponse("Failed to send reset email. Please try again later."));
        }
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

    public boolean existsByEmpNo(String empNo) {
        return memberRepo.existsByEmpNoIgnoreCase(empNo);
    }
}
