package com.ennoble.ennoapp.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ennoble.ennoapp.service.SampleMailSender;

@Controller
public class MailSendingController {

	
	private static final Logger logger = LoggerFactory.getLogger(MailSendingController.class);
	
	private SampleMailSender sampleMailSender;
	
	
	/**
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public String index() {
		logger.info(":: Entered into sendMail():GET ::");
		return "sendMail";
	}
	
	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
	public String sendMailTest(@RequestParam String subject, @RequestParam String body, @RequestParam String to) {
		logger.info(":: Entered into sendMail():POST ::");
		sampleMailSender.sendMail(subject, to, body);
		
		return "sendMail";
	}
}
