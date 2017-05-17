package com.ennoble.ennoapp;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.junit4.SpringRunner;

import com.ennoble.ennoapp.pdf.BarCodeReaderService;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
public class BarCodeUtilityTests {

	@Autowired
	private BarCodeReaderService barCodeReaderService;

	@Test
	public void contexLoads() throws Exception {
		assertThat(barCodeReaderService).isNotNull();
	}

//	@Test
//	public void readBarCode() throws Exception {
//		String fileName = "D:/ENNOAPP/barcode/qrcode_97802017507991.png";
//		String text = barCodeReaderService.readBarCode(fileName);
//		assertThat(text).isNotNull();
//	}
//	
//	@Test
//	public void generateBarCode() throws Exception {
//		String fileName = "D:/ENNOAPP/barcode/";
//		String input = "9989762143";
//		boolean isError = barCodeReaderService.generateBarCode(input, fileName);
//		assertThat(isError).isFalse();
//	}
	
}
