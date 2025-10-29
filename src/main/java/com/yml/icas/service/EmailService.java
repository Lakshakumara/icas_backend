package com.yml.icas.service;

import jakarta.mail.internet.MimeMessage;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.util.Map;
import java.util.concurrent.CompletableFuture;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private TemplateEngine templateEngine;

    @Autowired
    private Environment env;
    @Async
    public CompletableFuture<Void> sendEmailAsync(String email, String subject, String template, Map<String, Object> variables) {
        // Send the email in the background without blocking the main thread
        System.out.println("In email Thread");
        sendEmail(email, subject, template, variables);
        return CompletableFuture.completedFuture(null); // Return a completed future
    }
    @Async
    public void sendEmail(String to, String subject, String templateName, Map<String, Object> variables) {
        Context context = new Context();
        context.setVariables(variables);
        String body = templateEngine.process(templateName, context);
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(body, true);
            mailSender.send(message);
            System.out.println("Email sent to "+ to);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Email not sent to "+ to);
        }
    }
    @Async
    public void sendEmailWithAttachment(String to, String subject, String templateName, Map<String, Object> variables, byte[] attachmentData, String attachmentName) {
        MimeMessage mimeMessage = mailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
            helper.setTo(to);
            helper.setSubject(subject);

            // Use your template engine to process the email content
            String content = processTemplate(templateName, variables);
            helper.setText(content, true);

            // Add attachment
            ByteArrayResource byteArrayResource = new ByteArrayResource(attachmentData);
            helper.addAttachment(attachmentName, byteArrayResource);

            mailSender.send(mimeMessage);
        } catch (Exception ignored) {
        }
    }

    private String processTemplate(String templateName, Map<String, Object> variables) {
        Context context = new Context();
        context.setVariables(variables);
        String body = templateEngine.process(templateName, context);
        return body; // Placeholder, implement your template processing logic
    }
}
