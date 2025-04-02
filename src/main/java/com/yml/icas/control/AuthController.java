package com.yml.icas.control;

import com.yml.icas.service.AuthService;
import com.yml.icas.service.CustomUserDetailsService;
import com.yml.icas.util.JwtUtil;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private AuthService authService;


    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private CustomUserDetailsService userDetailsService;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest authRequest) {
        String token = authService.authenticate(authRequest.getUsername(), authRequest.getPassword());
        return ResponseEntity.ok(new AuthResponse(token));
    }

    @PostMapping("/login1")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest) {
        try {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(loginRequest.getEmpNo(), loginRequest.getPassword())
            );

            SecurityContextHolder.getContext().setAuthentication(authentication);

            // ✅ Load User Details
            UserDetails userDetails = userDetailsService.loadUserByUsername(loginRequest.getEmpNo());
            String token = jwtUtil.generateToken(userDetails);

            return ResponseEntity.ok(new AuthResponse(token));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials");
        }
    }

}

@Getter
@Setter
class AuthRequest {
    private String username;
    private String password;
}

@Getter
class AuthResponse {
    private String token;
    public AuthResponse(String token) {
        this.token = token;
    }
}
@Getter
@Setter
class LoginRequest {
    private String empNo;
    private String password;
}