package com.iyf.salesledger.controller.page.empPool;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class EmpPoolPageController {

	/***
	 * @기능 empPoolList.jsp 페이지 호출
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/empPoolList")
	public String showEmpPoolListPage() {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolPageController.showEmpPoolListPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "empPool/empPoolList");}
		if (log.isInfoEnabled()) {log.info("End EmpPoolPageController.showEmpPoolListPage");}
		return "empPool/empPoolList";
	}
	
	/***
	 * @기능 empPoolRegister.jsp 페이지 호출
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/empPoolRegister")
	public String showEmpPoolRegisterPage() {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolPageController.showEmpPoolRegisterPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "empPool/empPoolRegister");}
		if (log.isInfoEnabled()) {log.info("End EmpPoolPageController.showEmpPoolRegisterPage");}
		return "empPool/empPoolRegister";
	}
	
	/***
	 * @기능 empPoolDetail.jsp 페이지 호출
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/empPoolDetail")
	public String showEmpPoolDetailPage() {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolPageController.showEmpPoolDetailPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "empPool/empPoolDetail");}
		if (log.isInfoEnabled()) {log.info("End EmpPoolPageController.showEmpPoolDetailPage");}
		return "empPool/empPoolDetail";
	}
	
	/***
	 * @기능 empPoolDetail.jsp 페이지 호출
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/empPoolProgressDetail")
	public String showEmpPoolProgressDetailPage() {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolPageController.showEmpPoolProgressDetailPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "empPool/empPoolProgressDetail");}
		if (log.isInfoEnabled()) {log.info("End EmpPoolPageController.showEmpPoolProgressDetailPage");}
		return "empPool/empPoolProgressDetail";
	}
	
}
