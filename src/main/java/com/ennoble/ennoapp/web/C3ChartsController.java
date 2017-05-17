package com.ennoble.ennoapp.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/c3charts/")
public class C3ChartsController {

	
	@RequestMapping("chart1")
	private String home() {
		return "c3chart1";
	}
}
