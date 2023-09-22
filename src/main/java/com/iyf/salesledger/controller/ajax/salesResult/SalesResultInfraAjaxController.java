package com.iyf.salesledger.controller.ajax.salesResult;

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

import com.iyf.salesledger.common.batch.model.SalesResult;
import com.iyf.salesledger.common.batch.model.SalesResultInfra;
import com.iyf.salesledger.service.SalesResultInfraService;
import com.iyf.salesledger.service.SalesResultService;

@RestController
public class SalesResultInfraAjaxController {

	@Autowired
	private SalesResultInfraService salesResultInfraService;
	
	@GetMapping("/salesResultInfra.ajax/company/{company}/department/{department}/category/{category}/batch_month/{batch_month}")
	public List<Map<String, Object>> retrieveSalesResultListByCompanyAndDepartmentAndCategoryAndBatchMonth(@PathVariable String company, @PathVariable String department, @PathVariable String category, @PathVariable String batch_month) {
		return salesResultInfraService.listByCompanyAndDepartmentAndCategoryAndBatchMonth(company, department, category, batch_month);
	}
	
	@PostMapping("/salesResultInfra.ajax/company/{company}/department/{department}/category/{category}/batch_month/{batch_month}")
	public void insertSalesResultByCompanyAndDepartmentAndBatchMonth(@RequestBody SalesResultInfra salesResultInfra) {
		salesResultInfraService.insertByHandwrite(salesResultInfra);
	}
	
	@GetMapping("/salesResultInfra.ajax/sales_result_infra_id/{sales_result_infra_id}")
	public Map<String, Object> retrieveSalesResult(@PathVariable long sales_result_infra_id) {
		return salesResultInfraService.selectOne(sales_result_infra_id);
	}
	
	@DeleteMapping("/salesResultInfra.ajax/sales_result_infra_id/{sales_result_infra_id}")
	public void deleteSalesResult(@PathVariable long sales_result_infra_id) {
		salesResultInfraService.delete(sales_result_infra_id);
	}
	
	@PutMapping("/salesResultInfra.ajax")
	public void updateSalesResultInfra(@RequestBody SalesResultInfra salesResultInfra) {
		salesResultInfraService.update(salesResultInfra);
	}
}
