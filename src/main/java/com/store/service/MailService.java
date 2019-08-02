package com.store.service;

import com.store.config.MailConfig;
import com.store.model.store.Email;
import com.store.repository.EmailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.mail.javamail.JavaMailSender;


@Service
public class MailService {
    private final JavaMailSender mailSender;
    private final EmailRepository emailRepository;

    @Autowired
    public MailService(JavaMailSender mailSender, EmailRepository emailRepository) {
        this.mailSender = mailSender;
        this.emailRepository = emailRepository;
    }

    private final static String USERNAME = MailConfig.getUSERNAME();


    void send(String emailTo, String subject, String message) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();

        mailMessage.setFrom(USERNAME);
        mailMessage.setTo(emailTo);
        mailMessage.setSubject(subject);
        mailMessage.setText(message);

        mailSender.send(mailMessage);
    }

    public void addEmailRepository (final String emailAdd) {
        if (emailRepository.findByEmail(emailAdd) == null) {
            Email email = new Email(emailAdd);
            emailRepository.save(email);
        }
    }
}
