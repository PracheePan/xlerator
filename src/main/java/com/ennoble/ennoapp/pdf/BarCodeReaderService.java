package com.ennoble.ennoapp.pdf;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Arrays;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Reader;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.QRCodeWriter;

@Service
public class BarCodeReaderService {

	private static final Logger logger = LoggerFactory.getLogger(BarCodeReaderService.class);

	/**
	 * 
	 * @param fileName
	 * @return
	 */
	public String readBarCode(String fileName) {
		logger.info(":: Entered into readBarCode() ::");
		String resultText = null;
		try {
			InputStream barCodeInputStream = new FileInputStream(fileName);  
			BufferedImage barCodeBufferedImage = ImageIO.read(barCodeInputStream);  
			  
			LuminanceSource source = new BufferedImageLuminanceSource(barCodeBufferedImage);  
			BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));  
			Reader reader = new MultiFormatReader();  
			Result result = reader.decode(bitmap);  
			  
			resultText = result.getText(); 
			System.out.println("Barcode text is " + resultText);
		} catch (Exception e) {
			logger.error(":: Exception occured in readBarCode() ::", e);
		} finally {
			logger.info(":: Exited from readBarCode() ::");
		}
		return resultText;
	}
	
	/**
	 * 
	 * @param text
	 * @param fileLocation
	 * @return
	 */
	public boolean generateBarCode(String text, String fileLocation) {
		logger.info(":: Entered into generateBarCode() ::");
		try {			
			int width = 400;  
			int height = 300; // change the height and width as per your requirement  
			  
			// (ImageIO.getWriterFormatNames() returns a list of supported formats)  			
			String[] formatNames = ImageIO.getWriterFormatNames();			
			logger.info("" + Arrays.asList(formatNames));
			String imageFormat = "png"; // could be "gif", "tiff", "jpeg"
			  
			BitMatrix bitMatrix = new QRCodeWriter().encode(text, BarcodeFormat.QR_CODE, width, height);
			File file = new File(fileLocation + "qrcode_"+ text +".png");
			MatrixToImageWriter.writeToStream(bitMatrix, imageFormat, new FileOutputStream(file));
			
			System.out.println(":: Barcode Generation is Completed ::");
		} catch (Exception e) {
			logger.error(":: Exception occured in generateBarCode() ::", e);
			return false;
		} finally {
			logger.info(":: Exited from generateBarCode() ::");
		}
		return true;
	}

}
