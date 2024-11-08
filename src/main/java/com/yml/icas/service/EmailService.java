package com.yml.icas.service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.io.File;
import java.util.Map;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private TemplateEngine templateEngine;

    @Autowired
    private Environment env;

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
        } catch (MessagingException e) {
            Log.info("Email not sent to " + to);
        }
    }

    public void sendEmailWithAttachment(String to, String subject, String templateName, Map<String, Object> variables, File attachment) {
        MimeMessage mimeMessage = mailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
            helper.setTo(to);
            helper.setSubject(subject);

            // Use your template engine to process the email content
            String content = processTemplate(templateName, variables);
            helper.setText(content, true);

            // Add attachment
            helper.addAttachment(attachment.getName(), attachment);

            mailSender.send(mimeMessage);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exception here
        }
    }

    private String processTemplate(String templateName, Map<String, Object> variables) {
        // Process the template using Thymeleaf or your template engine
        // Return the processed content as a string
        return "<html>Processed content</html>"; // Placeholder, implement your template processing logic
    }

}
