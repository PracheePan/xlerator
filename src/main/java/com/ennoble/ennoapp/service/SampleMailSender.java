package com.ennoble.ennoapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class SampleMailSender {

	@Value("${spring.mail.from}")
	private String from;

	private @Autowired JavaMailSender javaMailSender;

	/**
	 * 
	 * @param subject
	 * @param toMail
	 * @param text
	 * @return
	 */
	public boolean sendMail(String subject, String toMail, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setTo(toMail);
		message.setSubject(subject);
		message.setText(text);
		try {
			javaMailSender.send(message);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
}
