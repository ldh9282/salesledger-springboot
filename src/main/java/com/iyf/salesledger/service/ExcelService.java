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
import com.iyf.salesledger.common.utils.DateUtils;
import com.iyf.salesledger.common.utils.ObjectUtils;
import com.iyf.salesledger.common.utils.StringUtils;
import com.iyf.salesledger.model.EmpLedger;
import com.iyf.salesledger.model.EmpPool;

import lombok.extern.log4j.Log4j2;

@Service @Log4j2
public class ExcelService {

	@Autowired
	private ExcelUtils excelUtils;
	
	@Autowired
	private EmpPoolService empPoolService;
	
	@Autowired
	private EmpLedgerService empLedgerService;
	
	@Transactional
    public ResponseEntity<String> empPoolExcelProcess(MultipartFile file) {
    	
    	Map<String, Object> excelMap = excelUtils.convertExceltoMap(file);
    	String sheetName = (String) excelMap.get("sheetName");
    	List<String> headers = (List<String>) excelMap.get("headerList");
        List<Map<String, Object>> dataList = (List<Map<String, Object>>) excelMap.get("dataList");
        
        int headerIndex = 1;
        int rowIndex = headerIndex + 1;
        try {
        	
	        for (Map<String, Object> map : dataList) {
				String name = (String) map.get("이름"); // 필수값
				String phonenumber = (String) map.get("전화번호") == null ? null : ((String) map.get("전화번호")).replaceAll("-", ""); // 필수값
				String sourcing_manager = (String) map.get("소싱담당자");
				Date birthdate = DateUtils.parseObject(map.get("생년월일"));
				String email = (String) map.get("이메일");
				String address = (String) map.get("주소");
				String education = StringUtils.defaultIfNullOrEmpty((String) map.get("학력"), "미기입");
				String school_name = (String) map.get("학교명");
				String major = (String) map.get("학과");
				String career_years = (String) map.get("경력");
				String career_field = (String) map.get("분야");
				String career_level = StringUtils.defaultIfNullOrEmpty((String) map.get("등급"), "미기입");
				int hope_purchase_unit = ((Double) map.get("희망단가")).intValue();
				
				// 1. 필수값 체크
				if (ObjectUtils.isAnyValueNullOrEmpty(name, phonenumber)) {
					if (log.isInfoEnabled()) {log.info("ExcelService.empPoolExcelProcess ::: ObjectUtils.isAnyValueNullOrEmpty ::: true");}
					if (log.isInfoEnabled()) {log.info("ExcelService.empPoolExcelProcess ::: TransactionAspectSupport.currentTransactionStatus.setRollbackOnly");}
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인력풀 엑셀 데이터 추가가 실패하였습니다.\n\n에러원인: 필수값을 미기입했습니다.\n\n이름 또는 전화번호를 기입해주세요.\n\n추적: (이름: " + name + ", 전화번호: " + (String) map.get("전화번호") + ", 행번호: " + rowIndex + ")");
				}
				
				// 2. 인력 중복 체크
				EmpPool findOne = empPoolService.findByNameAndPhoneNumber(name, phonenumber);
				
				if (findOne != null) {
					if (log.isInfoEnabled()) {log.info("ExcelService.empPoolExcelProcess ::: findOne ::: " + findOne);}
					if (log.isInfoEnabled()) {log.info("ExcelService.empPoolExcelProcess ::: TransactionAspectSupport.currentTransactionStatus.setRollbackOnly");}
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인력풀 엑셀 데이터 추가가 실패하였습니다.\n\n에러원인: 이미 등록된 인력이 포함되어 있습니다.\n\n추적: (이름: " + name + ", 전화번호: " + (String) map.get("전화번호") + ", 행번호: " + rowIndex + ")");
				}
			
				EmpPool empPool = new EmpPool();
				empPool.setSourcing_manager(sourcing_manager);
				empPool.setName(name);
				empPool.setPhonenumber(phonenumber);
				empPool.setBirthdate(birthdate);
				empPool.setEmail(email);
				empPool.setAddress(address);
				empPool.setEducation(education);
				empPool.setSchool_name(school_name);
				empPool.setMajor(major);
				empPool.setCareer_years(career_years);
				empPool.setCareer_field(career_field);
				empPool.setCareer_level(career_level);
				empPool.setHope_purchase_unit(hope_purchase_unit);
				
				// 3. 인력등록
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

	@Transactional
	public ResponseEntity<String> empLedgerExcelProcess(MultipartFile file) {
		
    	Map<String, Object> excelMap = excelUtils.convertExceltoMap(file);
    	String sheetName = (String) excelMap.get("sheetName");
    	List<String> headers = (List<String>) excelMap.get("headerList");
        List<Map<String, Object>> dataList = (List<Map<String, Object>>) excelMap.get("dataList");
        
        int headerIndex = 1;
        int rowIndex = headerIndex + 1;
        
	    try {
	        for (Map<String, Object> map : dataList) {
	        	// ****** 인력풀 ******
	        	String name = (String) map.get("이름"); // 필수값
				String phonenumber = (String) map.get("전화번호") == null ? null : ((String) map.get("전화번호")).replaceAll("-", ""); // 필수값
				
				// ****** 인력원장 ******
				String progress = (String) map.get("진행"); // 필수값
				String progress_reason = (String) map.get("진행사유");
				String company = (String) map.get("소속"); // 필수값
				String department = "컨버전스".equals((String) map.get("사업부서")) ? "CONVERSION" : (String) map.get("사업부서"); // 필수값
				String site = (String) map.get("사이트"); // 필수값
				String client = (String) map.get("진행업체"); // 필수값
				String project_name = (String) map.get("프로젝트명"); // 필수값
				String brief = (String) map.get("적요란");
				Date assign_date = DateUtils.parseObject(map.get("투입일")); // 필수값
				Date end_date = DateUtils.parseObject(map.get("종료일")); // 필수값
				Date resign_date = DateUtils.parseObject(map.get("철수날짜")); // 필수값
				double sales_mm = ((Double) map.get("매출MM")).doubleValue(); // 필수값
				double purchase_mm = ((Double) map.get("매입MM")).doubleValue(); // 필수값
				long sales_unit = ((Double) map.get("매출단가")).longValue(); // 필수값
				long purchase_unit = ((Double) map.get("매출단가")).longValue(); // 필수값
				Date resume_submit_date = DateUtils.parseObject(map.get("이력서제출"));
				Date i_contract_date = DateUtils.parseObject(map.get("개인계약일"));
				Date c_contract_date = DateUtils.parseObject(map.get("업체계약일"));
				
				// 1. 필수값 체크
				if (ObjectUtils.isAnyValueNullOrEmpty(
						name, phonenumber, progress, company, department, site, client, project_name,
						assign_date, end_date, resign_date, sales_mm, purchase_mm, sales_unit, purchase_unit)) {
					if (log.isInfoEnabled()) {log.info("ExcelService.empLedgerExcelProcess ::: ObjectUtils.isAnyValueNullOrEmpty ::: true");}
					if (log.isInfoEnabled()) {log.info("ExcelService.empLedgerExcelProcess ::: TransactionAspectSupport.currentTransactionStatus.setRollbackOnly");}
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인력원장 엑셀 데이터 추가가 실패하였습니다.\n\n에러원인: 필수값을 미기입했습니다.\n\n필수값 목록: (진행, 소속, 사업부서, 사이트, 진행업체, 프로젝트명, 이름, 전화번호, 투입일, 종료일, 철수날짜, 매출MM, 매입MM, 매출단가, 매입단가)\n\n추적: (이름: " + name + ", 전화번호: " + (String) map.get("전화번호") + ", 행번호: " + rowIndex + ")");
					
				}
				
				// 2. 인력풀 조회 체크
				EmpPool findOne = empPoolService.findByNameAndPhoneNumber(name, phonenumber);
				
				if (findOne == null) {
					if (log.isInfoEnabled()) {log.info("ExcelService.empLedgerExcelProcess ::: findOne ::: not exist");}
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인력원장 엑셀 데이터 추가가 실패하였습니다.\n\n에러원인: 해당인력은 인력풀에 존재하지 않습니다.\n\n추적: (이름: " + name + ", 전화번호: " + (String) map.get("전화번호") + ", 행번호: " + rowIndex + ")");
				}
				
				
				EmpLedger empLedger = new EmpLedger();
				empLedger.setEmp_pool_id(findOne.getEmp_pool_id());
				empLedger.setCompany(company);
				empLedger.setDepartment(department);
				empLedger.setSite(site);
				empLedger.setClient(client);
				empLedger.setProject_name(project_name);
				empLedger.setBrief(brief);
				empLedger.setAssign_date(assign_date);
				empLedger.setEnd_date(end_date);
				empLedger.setResign_date(resign_date);
				empLedger.setSales_mm(sales_mm);
				empLedger.setPurchase_mm(purchase_mm);
				empLedger.setSales_unit(sales_unit);
				empLedger.setPurchase_unit(purchase_unit);
				empLedger.setResume_submit_date(resume_submit_date);
				empLedger.setI_contract_date(i_contract_date);
				empLedger.setC_contract_date(c_contract_date);
				
				// 3. 인력원장 투입예정 등록
				ResponseEntity<String> result = empLedgerService.insertByProgress(empLedger);
				
				// 4. 이미 등록된 프로젝트인지 체크
				if (HttpStatus.BAD_REQUEST.equals(result.getStatusCode())) {
					if (log.isInfoEnabled()) {log.info("ExcelService.empLedgerExcelProcess ::: 이미 투입예정 혹은 투입된 프로젝트입니다.");}
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인력원장 엑셀 데이터 추가가 실패하였습니다.\n\n에러원인: 해당프로젝트에 이미 투입예정 혹은 투입되어있습니다.\n\n추적: (이름: " + name + ", 전화번호: " + (String) map.get("전화번호") + ", 행번호: " + rowIndex + ")");
				}
				
				
				rowIndex++;
	        }
	    } catch (ParseException e) {
	    	if (log.isInfoEnabled()) {log.info("ExcelService.empLedgerExcelProcess ::: Exception");}
        	e.printStackTrace();
        	if (log.isInfoEnabled()) {log.info("ExcelService.empLedgerExcelProcess ::: TransactionAspectSupport.currentTransactionStatus.setRollbackOnly");}
        	TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        	return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인력원장 엑셀 데이터 추가가 실패하였습니다.\n\n에러원인: " + e.getMessage());
	    } catch (Exception e) {
	    	if (log.isInfoEnabled()) {log.info("ExcelService.empLedgerExcelProcess ::: Exception");}
        	e.printStackTrace();
        	if (log.isInfoEnabled()) {log.info("ExcelService.empLedgerExcelProcess ::: TransactionAspectSupport.currentTransactionStatus.setRollbackOnly");}
        	TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        	return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인력원장 엑셀 데이터 추가가 실패하였습니다.\n\n에러원인: " + e.getMessage());
		}
        
	    return ResponseEntity.status(HttpStatus.OK).body("인력원장 엑셀 데이터 추가가 성공적으로 수행되었습니다.");
	}
}
