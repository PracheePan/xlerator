package com.ennoble.ennoapp;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.junit4.SpringRunner;

import com.ennoble.ennoapp.pdf.PDFReaderService;
import com.ennoble.ennoapp.pdf.PDFWriterService;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
public class PDFUtilityTests {

	@Autowired
	private PDFReaderService pdfReaderService;

	@Autowired
	private PDFWriterService pdfWriterService;

	@Test
	public void contexLoads() throws Exception {
		assertThat(pdfReaderService).isNotNull();
		assertThat(pdfWriterService).isNotNull();
	}

	@Test
	public void readPDF() throws Exception {
		String fileName = "D:/ENNOAPP/pdf/FirstPdf.pdf";
		boolean isError = pdfReaderService.readPDFDocument(fileName);
		assertThat(isError).isFalse();
	}

	@Test
	public void writePDf() {
		String fileName = "D:/ENNOAPP/pdf/FirstPdf.pdf";
		boolean isError = pdfWriterService.createPDF(fileName);
		assertThat(isError).isFalse();
	}
}
