package com.iyf.salesledger.controller.ajax.salesLedger;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.iyf.salesledger.model.EmpLedger;
import com.iyf.salesledger.model.EmpPool;
import com.iyf.salesledger.model.SalesLedger;
import com.iyf.salesledger.service.SalesLedgerService;

@RestController
public class SalesLedgerAjaxController {


	@Autowired
	private SalesLedgerService salesLedgerService;
	
	
	@GetMapping("/salesLedger.ajax/company/{company}/department/{department}")
	public List<Map<String, Object>> retrieveSalesLedgerListByCompanyAndDepartment(@PathVariable String company, @PathVariable String department) {
		return salesLedgerService.listByCompanyAndDepartment(company, department);
	}
	
	@GetMapping("/salesLedger.ajax/{sales_id}")
	public SalesLedger retrieveSalesLedger(@PathVariable long sales_id) {
		return salesLedgerService.selectOne(sales_id);
	}
	
	// 상세페이지에서 수정버튼 클릭시
	@PutMapping("/salesLedger.ajax")
	public void update(@RequestBody Map<String, Object> requestBodyMap) {
		Gson gson = new Gson();
		SalesLedger salesLedger = gson.fromJson(gson.toJson(requestBodyMap.get("salesLedger")), SalesLedger.class);
		EmpLedger empLedger = gson.fromJson(gson.toJson(requestBodyMap.get("empLedger")), EmpLedger.class);
		EmpPool empPool= gson.fromJson(gson.toJson(requestBodyMap.get("empPool")), EmpPool.class);
		
		salesLedgerService.update(salesLedger, empLedger, empPool);
	}
}
