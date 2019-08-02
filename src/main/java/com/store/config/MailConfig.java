package com.store.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class MailConfig {
    private final static String HOST = "smtp.yandex.ru";
    private final static String USERNAME = "ignatovich.d@dst4brest.by";
    private final static String PASSWORD = "1QAZwsx1";
    private final static int PORT = 465;
    private final static String PROTOCOL = "smtps";
    private final static String DEBUG = "false";

    @Bean
    public JavaMailSender getMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

        mailSender.setHost(HOST);
        mailSender.setPort(PORT);
        mailSender.setUsername(USERNAME);
        mailSender.setPassword(PASSWORD);

        Properties properties = mailSender.getJavaMailProperties();

        properties.setProperty("mail.transport.protocol", PROTOCOL);
        properties.setProperty("mail.debug", DEBUG);

        return mailSender;
    }

    public static String getUSERNAME() {
        return USERNAME;
    }
}
