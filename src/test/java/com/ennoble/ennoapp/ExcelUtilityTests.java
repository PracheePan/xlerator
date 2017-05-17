package com.ennoble.ennoapp;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.junit4.SpringRunner;

import com.ennoble.ennoapp.excel.ExcelUtilityService;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
public class ExcelUtilityTests {

	@Autowired
	private ExcelUtilityService excelUtilityService;

	@Test
	public void contexLoads() throws Exception {
		assertThat(excelUtilityService).isNotNull();
	}

	@Test
	public void createNewExcelFile() throws Exception {
		String fileName = "D:\\ENNOAPP\\excel\\createNewExcelFile.xls";
		boolean isError = excelUtilityService.createNewExcelFile(fileName);
		assertThat(isError).isFalse();
	}

	@Test
	public void createExcelWithFormula() {
		String fileName = "D:\\ENNOAPP\\excel\\createExcelWithFormula.xls";
		boolean isError = excelUtilityService.createExcelWithFormula(fileName);
		assertThat(isError).isFalse();
	}

	@Test
	public void readExcelFile() throws Exception {
		String fileName = "D:\\ENNOAPP\\excel\\newExcel.xls";
		boolean isError = excelUtilityService.readExcelFile(fileName);
		assertThat(isError).isFalse();
	}

	@Test
	public void readExcelFileWithFormula() throws Exception {
		String fileName = "D:\\ENNOAPP\\excel\\newExcelWithFormula.xls";
		boolean isError = excelUtilityService.readExcelFileWithFormula(fileName);
		assertThat(isError).isFalse();
	}

}
