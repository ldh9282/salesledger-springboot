package com.iyf.salesledger.controller.ajax.salesEsti;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.service.SalesEstimationService;

@RestController
public class SalesEstimationAjaxController {

	@Autowired
	private SalesEstimationService salesEstimationService;
	
	@GetMapping("/salesEstimation.ajax/company/{company}/department/{department}/batch_month/{batch_month}")
	public List<Map<String, Object>> retrieveSalesEstimationListByCompanyAndDepartmentAndBatchMonth(@PathVariable String company, @PathVariable String department, @PathVariable String batch_month) {
		return salesEstimationService.listByCompanyAndDepartmentAndBatchMonth(company, department, batch_month);
	}
	
}
