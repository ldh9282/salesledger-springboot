package com.iyf.salesledger.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import com.iyf.salesledger.common.file.ExcelUtils;
import com.iyf.salesledger.common.utils.ObjectUtils;
import com.iyf.salesledger.common.utils.StringUtils;
import com.iyf.salesledger.model.EmpPool;

import lombok.extern.log4j.Log4j2;

@Service @Log4j2
public class ExcelService {

	@Autowired
	private ExcelUtils excelUtils;
	
	@Autowired
	private EmpPoolService empPoolService;
	
	@Transactional
    public ResponseEntity<String> empPoolExcelProcess(MultipartFile file) {
    	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
    	Map<String, Object> excelMap = excelUtils.convertExceltoMap(file);
    	String sheetName = (String) excelMap.get("sheetName");
    	List<String> headers = (List<String>) excelMap.get("headerList");
        List<Map<String, Object>> dataList = (List<Map<String, Object>>) excelMap.get("dataList");
        
        int headerIndex = 1;
        int rowIndex = headerIndex + 1;
        try {
        	
	        for (Map<String, Object> map : dataList) {
				String name = (String) map.get("이름");
				String phonenumber = (String) map.get("전화번호") == null ? null : ((String) map.get("전화번호")).replaceAll("-", "");
				
				if (ObjectUtils.isAnyValueNullOrEmpty(name, phonenumber)) {
					if (log.isInfoEnabled()) {log.info("ExcelService.empPoolExcelProcess ::: ObjectUtils.isAnyValueNullOrEmpty ::: true ");}
					if (log.isInfoEnabled()) {log.info("ExcelService.empPoolExcelProcess ::: TransactionAspectSupport.currentTransactionStatus.setRollbackOnly");}
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인력풀 엑셀 데이터 추가가 실패하였습니다.\n\n에러원인: 필수값을 미기입했습니다.\n\n이름 또는 전화번호를 기입해주세요.\n\n추적: (이름: " + name + ", 전화번호: " + (String) map.get("전화번호") + ", 행번호: " + rowIndex + ")");
				}
				
				EmpPool findOne = empPoolService.findByNameAndPhoneNumber(name, phonenumber);
				
				if (findOne != null) {
					if (log.isInfoEnabled()) {log.info("ExcelService.empPoolExcelProcess ::: findOne ::: " + findOne);}
					if (log.isInfoEnabled()) {log.info("ExcelService.empPoolExcelProcess ::: TransactionAspectSupport.currentTransactionStatus.setRollbackOnly");}
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인력풀 엑셀 데이터 추가가 실패하였습니다.\n\n에러원인: 이미 등록된 인력이 포함되어 있습니다.\n\n추적: (이름: " + name + ", 전화번호: " + (String) map.get("전화번호") + ", 행번호: " + rowIndex + ")");
				}
			
				EmpPool empPool = new EmpPool();
				empPool.setSourcing_manager((String) map.get("소싱담당자"));
				empPool.setName((String) map.get("이름"));
				empPool.setPhonenumber(phonenumber);
				empPool.setBirthdate(sdf.parse((String) map.get("생년월일")));
				empPool.setEmail((String) map.get("이메일"));
				empPool.setAddress((String) map.get("주소"));
				empPool.setEducation(StringUtils.defaultIfNullOrEmpty((String) map.get("학력"), "미기입"));
				empPool.setSchool_name((String) map.get("학교명"));
				empPool.setMajor((String) map.get("학과"));
				empPool.setCareer_years((String) map.get("경력"));
				empPool.setCareer_field((String) map.get("분야"));
				empPool.setCareer_level(StringUtils.defaultIfNullOrEmpty((String) map.get("등급"), "미기입"));
				empPool.setHope_purchase_unit(((Double) map.get("희망단가")).intValue());
				
				empPoolService.insert(empPool);
				
				rowIndex++;
			}
        } catch (ParseException e) {
        	if (log.isInfoEnabled()) {log.info("ExcelService.empPoolExcelProcess ::: ParseException");}
        	e.printStackTrace();
        	if (log.isInfoEnabled()) {log.info("ExcelService.empPoolExcelProcess ::: TransactionAspectSupport.currentTransactionStatus.setRollbackOnly");}
        	TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        	return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인력풀 엑셀 데이터 추가가 실패하였습니다.\n\n에러원인: " + e.getMessage());
        } catch (Exception e) {
        	if (log.isInfoEnabled()) {log.info("ExcelService.empPoolExcelProcess ::: Exception");}
        	e.printStackTrace();
        	if (log.isInfoEnabled()) {log.info("ExcelService.empPoolExcelProcess ::: TransactionAspectSupport.currentTransactionStatus.setRollbackOnly");}
        	TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        	return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인력풀 엑셀 데이터 추가가 실패하였습니다.\n\n에러원인: " + e.getMessage());
        }
    	return ResponseEntity.status(HttpStatus.OK).body("인력풀 엑셀 데이터 추가가 성공적으로 수행되었습니다.");
    }
}
