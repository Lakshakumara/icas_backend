package com.yml.icas.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class MailConfig {
    @Autowired
    private Environment env;
    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        String host = env.getProperty("spring.mail.host");
        Integer port = env.getProperty("spring.mail.port", Integer.class);
        String username = env.getProperty("spring.mail.username");
        String password = env.getProperty("spring.mail.password");
        if (host == null || port == null || username == null || password == null) {
            throw new IllegalStateException("Mail properties not set correctly");
        }

        mailSender.setHost(host);
        mailSender.setPort(port);
        mailSender.setUsername(username);
        mailSender.setPassword(password);

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", env.getProperty("spring.mail.properties.mail.smtp.auth"));
        props.put("mail.smtp.starttls.enable", env.getProperty("spring.mail.properties.mail.smtp.starttls.enable"));
        props.put("mail.smtp.starttls.required", env.getProperty("spring.mail.properties.mail.smtp.starttls.required"));
        props.put("mail.debug", env.getProperty("spring.mail.properties.mail.debug"));

        mailSender.setJavaMailProperties(props);
        return mailSender;
    }
}