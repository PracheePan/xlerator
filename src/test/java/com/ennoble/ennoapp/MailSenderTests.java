package com.ennoble.ennoapp;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.junit4.SpringRunner;

import com.ennoble.ennoapp.service.SampleMailSender;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
public class MailSenderTests {

	@Autowired
	private SampleMailSender sampleMailSender;
	
	@Test
	public void contexLoads() throws Exception {
		assertThat(sampleMailSender).isNotNull();
	}
	
	@Test
	public void sendMail() throws Exception {
		String subject = "Sample Subject for Ennoapp";
		String toMail = "ennoapp12@gmail.com";
		String text = "Sample Text";
		boolean isError = sampleMailSender.sendMail(subject, toMail, text);
		assertThat(isError).isTrue();
	}
	
}
