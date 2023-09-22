package com.iyf.salesledger.controller.ajax.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.service.ChartService;

import lombok.extern.log4j.Log4j2;

@RestController @Log4j2
public class AdminChartAjaxController {

	@Autowired
	private ChartService chartService;
	
	@GetMapping("/admin/salesThisYearResultByCompanyAndDepartment.ajax/company/{company}/department/{department}")
	public List<Map<String, Object>> retrieveSalesThisYearResultByCompany(@PathVariable String company, @PathVariable String department) {
		if (log.isInfoEnabled()) {log.info("Start AdminChartAjaxController.retrieveSalesThisYearResultByCompany");}
		if (log.isInfoEnabled()) {log.info("param ::: company ::: " + company);}
		if (log.isInfoEnabled()) {log.info("param ::: department ::: " + department);}
		if (log.isInfoEnabled()) {log.info("do service ::: chartService.salesThisYearResultListByCompanyAndDepartment");}
		List<Map<String, Object>> salesThistYearResult = chartService.salesThisYearResultListByCompanyAndDepartment(company, department);
		if (log.isInfoEnabled()) {log.info("return ::: salesThistYearResult");}
		if (log.isInfoEnabled()) {log.info("End AdminChartAjaxController.retrieveSalesThisYearResultByCompany");}
		return salesThistYearResult;
	}
}
