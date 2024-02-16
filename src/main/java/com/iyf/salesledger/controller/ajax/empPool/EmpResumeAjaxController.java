package com.iyf.salesledger.controller.ajax.empPool;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.service.EmpResumeService;

import lombok.extern.log4j.Log4j2;

@RestController @Log4j2
public class EmpResumeAjaxController {

	@Autowired
	private EmpResumeService empResumeService;
	/***
	 * @기능 empPoolRegister.jsp 페이지에서 인력 이력서 위치정보 등록
	 * @param empPool 인력풀 단건
	 * @return 
	 */
	@PostMapping("/empResume.ajax")
	public void insertEmpResume(@RequestBody Map<String, Object> requsetMap, HttpServletRequest request) {
		if (log.isInfoEnabled()) {log.info("Start EmpResumeAjaxController.insertEmpResume");}
		if (log.isInfoEnabled()) {log.info("param ::: " + requsetMap.get("emp_pool_id"));}
		if (log.isInfoEnabled()) {log.info("param ::: " + requsetMap.get("file_name"));}
		if (log.isInfoEnabled()) {log.info("param ::: " + requsetMap.get("file_path"));}
		requsetMap.put("emp_pool_id", Long.valueOf((String) requsetMap.get("emp_pool_id")));
		requsetMap.put("system_creator", request.getRemoteUser());
		requsetMap.put("system_modifier", request.getRemoteUser());
		if (log.isInfoEnabled()) {log.info("do service ::: empPoolService.insert");}
		empResumeService.insertEmpResume(requsetMap);
		if (log.isInfoEnabled()) {log.info("End EmpResumeAjaxController.insertEmpResume");}
	}
}
