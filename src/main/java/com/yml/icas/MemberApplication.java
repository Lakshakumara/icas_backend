package com.yml.icas;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import java.util.Arrays;
import java.util.Collections;

@Slf4j
@SpringBootApplication
@EnableAsync
public class MemberApplication {


    public static void main(String[] args) {
        SpringApplication.run(MemberApplication.class, args);
    }

   /* @Bean
    CommandLineRunner runner() {
        return args -> {
        };
    }*/
    @Bean
    public CorsFilter corsFilter() {
        final CorsConfiguration config = new CorsConfiguration();
        // Don't do this in production, use a proper list  of allowed origins
        config.setAllowedOrigins(Collections.singletonList("*"));
        config.setAllowedHeaders(Arrays.asList("Origin", "Content-Type", "Accept", "Requester-Type"));
        config.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "OPTIONS", "DELETE", "PATCH"));
        config.addExposedHeader("X-Get-Header");

        final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        //CorsConfigurationSource source = request -> null
        return new CorsFilter(source);
    }
}