package com.yml.icas.util;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Component
public class JwtFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain)
            throws ServletException, IOException {

        String token = request.getHeader("Authorization");
        System.out.println("Incoming request: " + request.getRequestURI());
        System.out.println("Authorization Header: " + token);

        if (token != null && token.startsWith("Bearer ")) {
            String username = JwtUtil.validateToken(token.substring(7));
            List<String> roles = JwtUtil.extractRoles(token.substring(7));

            System.out.println("Validated Token - User: " + username);

            if (username != null && roles != null) {
                // Extract roles from token
                List<GrantedAuthority> authorities = roles.stream()
                        .map(SimpleGrantedAuthority::new)
                        .collect(Collectors.toList());

                UsernamePasswordAuthenticationToken authToken =
                        new UsernamePasswordAuthenticationToken(username, null, authorities);
                System.out.println("Set Authentication: " + authToken.getAuthorities());
                SecurityContextHolder.getContext().setAuthentication(authToken);

                System.out.println("Authenticated User: " + username);
                System.out.println("User Roles: " + roles);  // ✅ Print roles for debugging
                System.out.println("User Roles (SecurityContext): " + SecurityContextHolder.getContext().getAuthentication().getAuthorities());
            }
        }
        filterChain.doFilter(request, response);
    }
}