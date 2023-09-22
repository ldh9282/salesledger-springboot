package com.iyf.salesledger.controller.ajax.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.service.ChartService;

@RestController
public class AdminAjaxController {

	@Autowired
	private ChartService chartService;
	
	@GetMapping("/admin/salesThisYearResultByCompanyAndDepartment.ajax/company/{company}/department/{department}")
	public List<Map<String, Object>> retrieveSalesThisYearResultByCompany(@PathVariable String company, @PathVariable String department) {
		return chartService.salesThisYearResultListByCompanyAndDepartment(company, department);
	}
}
