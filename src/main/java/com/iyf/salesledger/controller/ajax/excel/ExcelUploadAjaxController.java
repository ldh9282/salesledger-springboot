package com.iyf.salesledger.controller.ajax.excel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iyf.salesledger.service.ExcelService;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class ExcelUploadAjaxController {

	
	@Autowired
	private ExcelService excelService;
	
	/***
	 * @기능 1. 엑셀 데이터로 인력풀 다건 추가 <br>
	 * 	    2. 엑셀 파일 삭제 
	 * @param file
	 * @return ResponseEntity<String>
	 */
	@PostMapping("/excel/empPoolExcelUpload.ajax")
	public ResponseEntity<String> empPoolExcelProcess(@RequestParam("file") MultipartFile file) {
		if (log.isInfoEnabled()) {log.info("Start ExcelUploadAjaxController.empPoolExcelProcess");}
		ResponseEntity<String> uploadResult = excelService.empPoolExcelProcess(file);
        if (log.isInfoEnabled()) {log.info("uploadResult ::: " + uploadResult);}
        if (log.isInfoEnabled()) {log.info("End ExcelUploadAjaxController.empPoolExcelProcess");}
		return uploadResult;
	}
	
	/***
	 * @기능 1. 엑셀 데이터로 인력원장 다건 추가 <br>
	 * 	    2. 엑셀 파일 삭제 
	 * @param file
	 * @return ResponseEntity<String>
	 */
	@PostMapping("/excel/empLedgerExcelUpload.ajax")
	public ResponseEntity<String> empLedgerExcelProcess(@RequestParam("file") MultipartFile file) {
		if (log.isInfoEnabled()) {log.info("Start ExcelUploadAjaxController.empLedgerExcelProcess");}
		ResponseEntity<String> uploadResult = excelService.empLedgerExcelProcess(file);
		if (log.isInfoEnabled()) {log.info("uploadResult ::: " + uploadResult);}
		if (log.isInfoEnabled()) {log.info("End ExcelUploadAjaxController.empLedgerExcelProcess");}
		return uploadResult;
	}
}
