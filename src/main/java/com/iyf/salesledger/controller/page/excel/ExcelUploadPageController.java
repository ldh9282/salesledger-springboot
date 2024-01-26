package com.iyf.salesledger.controller.page.excel;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class ExcelUploadPageController {

	/***
	 * @기능 excel/empPoolExcelUploadPage.jsp 인력풀 엑셀업로드페이지
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/excel/empPoolExcelUpload")
	public String showEmpPoolExcelUploadPage() {
		if (log.isInfoEnabled()) {log.info("Start ExcelUploadPageController.showEmpPoolExcelUploadPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "excel/empPoolExcelUpload");}
		if (log.isInfoEnabled()) {log.info("End ExcelUploadPageController.showEmpPoolExcelUploadPage");}
		return "excel/empPoolExcelUpload";
	}
	
	/***
	 * @기능 excel/empLedgerExcelUpload.jsp 인력원장 엑셀업로드페이지
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/excel/empLedgerExcelUpload")
	public String showEmpLedgerExcelUploadPage() {
		if (log.isInfoEnabled()) {log.info("Start ExcelUploadPageController.showEmpLedgerExcelUploadPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "excel/empLedgerExcelUpload");}
		if (log.isInfoEnabled()) {log.info("End ExcelUploadPageController.showEmpLedgerExcelUploadPage");}
		return "excel/empLedgerExcelUpload";
	}
}
