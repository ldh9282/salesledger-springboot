package com.iyf.salesledger.controller.ajax.salesEsti;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.common.batch.model.SalesEstimationInfra;
import com.iyf.salesledger.service.SalesEstimationInfraService;

@RestController
public class SalesEstimationInfraAjaxController {

	@Autowired
	private SalesEstimationInfraService SalesEstimationInfraService;
	
	@GetMapping("/salesEstimationInfra.ajax/company/{company}/department/{department}/category/{category}/batch_month/{batch_month}")
	public List<Map<String, Object>> retrieveSalesEstimationInfraListByCompanyAndDepartmentAndCategoryAndBatchMonth(@PathVariable String company, @PathVariable String department, @PathVariable String category, @PathVariable String batch_month) {
		return SalesEstimationInfraService.listByCompanyAndDepartmentAndCategoryAndBatchMonth(company, department, category, batch_month);
	}
	
	@PostMapping("/salesEstimationInfra.ajax/company/{company}/department/{department}/category/{category}/batch_month/{batch_month}")
	public void insertSalesEstimationInfraByCompanyAndDepartmentAndBatchMonth(@RequestBody SalesEstimationInfra salesEstimationInfra) {
		SalesEstimationInfraService.insertByHandwrite(salesEstimationInfra);
	}
	
	@GetMapping("/salesEstimationInfra.ajax/sales_estimation_infra_id/{sales_estimation_infra_id}")
	public Map<String, Object> retrieveSalesResult(@PathVariable long sales_estimation_infra_id) {
		return SalesEstimationInfraService.selectOne(sales_estimation_infra_id);
	}
	
	@DeleteMapping("/salesEstimationInfra.ajax/sales_estimation_infra_id/{sales_estimation_infra_id}")
	public void deleteSalesEstimationInfra(@PathVariable long sales_estimation_infra_id) {
		SalesEstimationInfraService.delete(sales_estimation_infra_id);
	}
	
	@PutMapping("/salesEstimationInfra.ajax")
	public void updateSalesEstimationInfra(@RequestBody SalesEstimationInfra salesEstimationInfra) {
		SalesEstimationInfraService.update(salesEstimationInfra);
	}
}
