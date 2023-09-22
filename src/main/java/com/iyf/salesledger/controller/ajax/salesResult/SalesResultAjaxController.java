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
import com.iyf.salesledger.service.SalesResultService;

@RestController
public class SalesResultAjaxController {

	@Autowired
	private SalesResultService salesResultService;
	
	@GetMapping("/salesResult.ajax/company/{company}/department/{department}/batch_month/{batch_month}")
	public List<Map<String, Object>> retrieveSalesResultListByCompanyAndDepartmentAndBatchMonth(@PathVariable String company, @PathVariable String department, @PathVariable String batch_month) {
		return salesResultService.listByCompanyAndDepartmentAndBatchMonth(company, department, batch_month);
	}
	
	@PostMapping("/salesResult.ajax/company/{company}/department/{department}/batch_month/{batch_month}")
	public void insertSalesResultByCompanyAndDepartmentAndBatchMonth(@RequestBody SalesResult salesResult) {
		salesResultService.insertByHandwrite(salesResult);
	}
	
	@GetMapping("/salesResult.ajax/sales_result_id/{sales_result_id}")
	public Map<String, Object> retrieveSalesResult(@PathVariable long sales_result_id) {
		return salesResultService.selectOne(sales_result_id);
	}
	
	@DeleteMapping("/salesResult.ajax/sales_result_id/{sales_result_id}")
	public void deleteSalesResult(@PathVariable long sales_result_id) {
		salesResultService.delete(sales_result_id);
	}
	
	@PutMapping("/salesResult.ajax")
	public void updateSalesResult(@RequestBody SalesResult salesResult) {
		salesResultService.update(salesResult);
	}
}
