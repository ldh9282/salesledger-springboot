package com.iyf.salesledger.controller.page.empPool;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.iyf.salesledger.service.EmpPoolService;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class EmpPoolPageController {

	@Autowired
	private EmpPoolService empPoolService;
	
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
	 * @기능 empPoolProgressDetail.jsp 페이지 호출
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/empPoolProgressDetail")
	public String showEmpPoolProgressDetailPage(long emp_pool_id, Model model) {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolPageController.showEmpPoolProgressDetailPage");}
		if (log.isInfoEnabled()) {log.info("param ::: emp_pool_id ::: " + emp_pool_id);}
		if (log.isInfoEnabled()) {log.info("do service ::: empPoolService.selectEmpPoolProgressDetail1");}
		List<Map<String, Object>> empPoolProgressDetail1 = empPoolService.selectEmpPoolProgressDetail1(emp_pool_id);
		if (log.isInfoEnabled()) {log.info("param ::: emp_pool_id ::: " + emp_pool_id);}
		if (log.isInfoEnabled()) {log.info("do service ::: empPoolService.selectEmpPoolProgressDetail2");}
		List<Map<String, Object>> empPoolProgressDetail2 = empPoolService.selectEmpPoolProgressDetail2(emp_pool_id);
		if (log.isInfoEnabled()) {log.info("model ::: empPoolProgressDetail1");}
		if (log.isInfoEnabled()) {log.info("model ::: empPoolProgressDetail2");}
		model.addAttribute("empPoolProgressDetail1", empPoolProgressDetail1);
		model.addAttribute("empPoolProgressDetail2", empPoolProgressDetail2);
		if (log.isInfoEnabled()) {log.info("page ::: " + "empPool/empPoolProgressDetail");}
		if (log.isInfoEnabled()) {log.info("End EmpPoolPageController.showEmpPoolProgressDetailPage");}
		return "empPool/empPoolProgressDetail";
	}
	
	
}
