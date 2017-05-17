package com.ennoble.ennoapp.pdf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;

@Service
public class PDFReaderService {

	private final static Logger logger = LoggerFactory.getLogger(PDFReaderService.class);

	
	/**
	 * 
	 * @param pdfFile
	 */
	public boolean readPDFDocument(String pdfFile) {
		boolean isError = false;
		PdfReader pdfReader = null;
		try {
			// Create PdfReader instance.
			pdfReader = new PdfReader(pdfFile);

			// Get the number of pages in pdf.
			int pages = pdfReader.getNumberOfPages();
			logger.info(":: Pages ::" + pages);

			// Iterate the pdf through pages.
			for (int i = 1; i <= pages; i++) {
				
				// Extract the page content using PdfTextExtractor.
				String pageContent = PdfTextExtractor.getTextFromPage(pdfReader, i);
				
				// Print the page content on console.
				logger.info(":: ++++++++++++++++++" + i + "++++++++++++++++++ ::");
				logger.info(pageContent);
				logger.info(":: ------------------" + i + "------------------ ::");
			}
			logger.info("Is this document tampered: " + pdfReader.isTampered());
			logger.info("Is this document encrypted: " + pdfReader.isEncrypted());
		} catch (Exception e) {
			logger.error(":: Exception in readPDFDocument()  ::", e);
			isError = true;
		} finally {
			if (null != pdfReader) {
				// Close the PdfReader.
				pdfReader.close();
			}
		}
		return isError;
	}
}
