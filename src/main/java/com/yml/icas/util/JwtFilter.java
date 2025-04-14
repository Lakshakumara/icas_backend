package com.yml.icas.util;

import io.jsonwebtoken.ExpiredJwtException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class JwtFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(@NonNull HttpServletRequest request,
                                    @NonNull HttpServletResponse response,
                                    @NonNull FilterChain filterChain
    ) throws IOException {
        try {
            String token = request.getHeader("Authorization");
           // System.out.println("Incoming request: " + request.getRequestURI());
            //System.out.println("Authorization token: " + token);

            if (token != null && token.startsWith("Bearer ")) {
                String username = JwtUtil.validateToken(token.substring(7));
                List<HashMap<String, String>> roles = JwtUtil.extractRoles(token.substring(7));
                if (username != null && roles != null) {
                    // Extract roles from token
                    List<SimpleGrantedAuthority> auth = roles.stream()
                            .map(r -> new SimpleGrantedAuthority(r.get("authority")))
                            .toList();

                    UsernamePasswordAuthenticationToken authToken =
                            new UsernamePasswordAuthenticationToken(username, null, auth);
                    //taken from imegoscode
                    authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(authToken);

                    //System.out.println("Authenticated User: " + username);
                    //System.out.println("User Roles (SecurityContext): " + SecurityContextHolder.getContext().getAuthentication().getAuthorities());
                }
            }
            filterChain.doFilter(request, response);
        } catch (ExpiredJwtException e) {
            // Token has expired
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setContentType("application/json");
            response.getWriter().write("{\"error\": \"Token expired\"}");
        } catch (Exception ex) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setContentType("application/json");
            response.getWriter().write("{\"error\": \"" + ex.getMessage() + "\"}");
        }
    }
}