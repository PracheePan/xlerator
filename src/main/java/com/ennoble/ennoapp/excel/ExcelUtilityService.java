package com.ennoble.ennoapp.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * ExcelUtility Utility Class for Reading, Writing Excel(With and Without Formula) File.
 * 
 * @author ANILKUMAR
 *
 */
@Service
public class ExcelUtilityService {

	private final static Logger logger = LoggerFactory.getLogger(ExcelUtilityService.class);
	

	/**
	 * readExcelFile
	 * 
	 * @param fileName
	 */
	public boolean readExcelFile(String fileName) {
		boolean isError = false;
		HSSFWorkbook workbook = null;
		try {
			FileInputStream fis = new FileInputStream(new File(fileName));

			// Get the workbook instance for XLS file
			workbook = new HSSFWorkbook(fis);

			// Get the number of sheets in the xlsx file
			int numberOfSheets = workbook.getNumberOfSheets();

			for (int i = 0; i < numberOfSheets; i++) {
				// Get first sheet from the workbook
				HSSFSheet sheet = workbook.getSheetAt(i);

				// Iterate through each rows from first sheet
				Iterator<Row> rowIterator = sheet.iterator();
				while (rowIterator.hasNext()) {
					Row row = rowIterator.next();

					// For each row, iterate through each columns
					Iterator<Cell> cellIterator = row.cellIterator();
					while (cellIterator.hasNext()) {

						Cell cell = cellIterator.next();

						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_BOOLEAN:
							System.out.print(cell.getBooleanCellValue() + "\t\t");
							break;
						case Cell.CELL_TYPE_NUMERIC:
							if (HSSFDateUtil.isCellDateFormatted(cell)) {
								System.out.print(cell.getDateCellValue() + "\t\t");
							} else {
								System.out.print(cell.getNumericCellValue() + "\t\t");
							}
							break;
						case Cell.CELL_TYPE_STRING:
							System.out.print(cell.getStringCellValue() + "\t\t");
							break;
						}
					}
					System.out.println("");
				}
			}

			fis.close();
		} catch (FileNotFoundException e) {
			logger.error(":: FileNotFoundException in readExcelFile()  ::", e);
			isError = true;
		} catch (IOException e) {
			logger.error(":: IOException in readExcelFile()  ::", e);
			isError = true;
		} finally {
			try {
				if (null != workbook) {
					workbook.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return isError;
	}

	/**
	 * 
	 * @param fileName
	 * @return
	 */
	public boolean readExcelFileWithFormula(String fileName) {
		boolean isError = false;
		FileInputStream fis = null;
		Workbook workbook = null;
		try {
			fis = new FileInputStream(fileName);

			// assuming xlsx file
			workbook = new HSSFWorkbook(fis);
			Sheet sheet = workbook.getSheetAt(0);
			Iterator<Row> rowIterator = sheet.iterator();
			while (rowIterator.hasNext()) {
				Row row = rowIterator.next();
				Iterator<Cell> cellIterator = row.cellIterator();

				while (cellIterator.hasNext()) {
					Cell cell = cellIterator.next();
					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_NUMERIC:
						logger.info(":: Numeric Value ::" + cell.getNumericCellValue());
						break;
					case Cell.CELL_TYPE_FORMULA:
						logger.info(":: Cell Formula= ::" + "" + cell.getCellFormula());
						logger.info(":: Cell Formula Result Type= ::" + "" + cell.getCachedFormulaResultType());
						if (cell.getCachedFormulaResultType() == Cell.CELL_TYPE_NUMERIC) {
							logger.info(":: Formula Value= ::" + cell.getNumericCellValue());
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error(":: Exception in readExcelFileWithFormula()  ::", e);
			isError = true;
		} finally {
			try {
				if (null != fis) {
					fis.close();
				}
				if (null != workbook) {
					workbook.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return isError;
	}

	/**
	 * 
	 * @param fileName
	 * @return
	 */
	public boolean createNewExcelFile(String fileName) {
		boolean isError = false;
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("Sample sheet");

		Map<String, Object[]> data = new HashMap<String, Object[]>();
		data.put("1", new Object[] { "Emp No.", "Name", "Salary", "Mobile" });
		data.put("2", new Object[] { 1d, "John", 1500000d, 9989762140d });
		data.put("3", new Object[] { 2d, "Sami", 800000d, 9989762141d });
		data.put("4", new Object[] { 3d, "Dean", 700000d, 9989762142d });

		Set<String> keyset = data.keySet();
		int rownum = 0;
		for (String key : keyset) {
			Row row = sheet.createRow(rownum++);
			Object[] objArr = data.get(key);
			int cellnum = 0;
			for (Object obj : objArr) {
				Cell cell = row.createCell(cellnum++);
				if (obj instanceof Date)
					cell.setCellValue((Date) obj);
				else if (obj instanceof Boolean)
					cell.setCellValue((Boolean) obj);
				else if (obj instanceof String)
					cell.setCellValue((String) obj);
				else if (obj instanceof Double)
					cell.setCellValue((Double) obj);
			}
		}

		try {
			FileOutputStream out = new FileOutputStream(new File(fileName));
			workbook.write(out);
			out.close();
			logger.info("Excel written successfully..");
		} catch (FileNotFoundException e) {
			logger.error(":: FileNotFoundException in readExcelFileWithFormula()  ::", e);
			isError = true;
		} catch (IOException e) {
			logger.error(":: IOException in readExcelFileWithFormula()  ::", e);
			isError = true;
		} finally {
			try {
				if (null != workbook) {
					workbook.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return isError;
	}

	/**
	 * 
	 * @param fileName
	 * @return
	 */
	public boolean createExcelWithFormula(String fileName) {
		boolean isError = false;
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("Calculate Simple Interest");

		Row header = sheet.createRow(0);
		header.createCell(0).setCellValue("Pricipal");
		header.createCell(1).setCellValue("RoI");
		header.createCell(2).setCellValue("T");
		header.createCell(3).setCellValue("Interest (P r t)");

		Row dataRow = sheet.createRow(1);
		dataRow.createCell(0).setCellValue(14500d);
		dataRow.createCell(1).setCellValue(9.25);
		dataRow.createCell(2).setCellValue(3d);
		dataRow.createCell(3).setCellFormula("A2*B2*C2");
		try {
			FileOutputStream out = new FileOutputStream(new File(fileName));
			workbook.write(out);
			out.close();
			logger.info("Excel with foumula cells written successfully");
		} catch (FileNotFoundException e) {
			logger.error(":: FileNotFoundException in readExcelFileWithFormula()  ::", e);
		} catch (IOException e) {
			logger.error(":: IOException in readExcelFileWithFormula()  ::", e);
		} finally {
			try {
				if (null != workbook) {
					workbook.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return isError;
	}
}
