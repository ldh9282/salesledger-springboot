package com.iyf.salesledger.controller.ajax.salesLedger;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.common.batch.service.empLedger.EmpLedgerBatchService;
import com.iyf.salesledger.common.utils.DateUtils;
import com.iyf.salesledger.service.SalesCostStatusService;

@RestController
public class SalesCostStatusAjaxController {

	@Autowired
	private SalesCostStatusService salesCostStatusService;
	
	@Autowired
	private EmpLedgerBatchService empLedgerBatchService;
	@GetMapping("/salesCostStatus.ajax/company/{company}/department/{department}/batch_month/{batch_month}")
	public List<Map<String, Object>> retrieveSalesCostListByCompanyAndDepartment(@PathVariable String company, @PathVariable String department, @PathVariable String batch_month) throws ParseException {
		Map<String, Object> requestMap = new HashMap<>();
		requestMap.put("company", company);
		requestMap.put("department", department);
		requestMap.put("batch_month", batch_month);
		
		if (batch_month.equals(DateUtils.formatObject(new Date() , "yyyyMM"))) {
			return salesCostStatusService.getSalesCostStatuslist(requestMap);
		} else {
			return salesCostStatusService.getSalesCostStatusHistorylist(requestMap);
		}
	}
	
	@PostMapping("/salesCostStatus.ajax/company/{company}/department/{department}/batch_month/{batch_month}")
	public void manualMMUpdateBatch(@PathVariable String company, @PathVariable String department, @PathVariable String batch_month) throws ParseException {
		Map<String, Object> requestMap = new HashMap<>();
		requestMap.put("company", company);
		requestMap.put("department", department);
		requestMap.put("batch_month", batch_month);
		
		if (batch_month.equals(DateUtils.formatObject(new Date() , "yyyyMM"))) {
			empLedgerBatchService.updateMonthlyMM(requestMap);
		} else {
			empLedgerBatchService.updateHistoryMonthlyMM(requestMap);
		}
	}
}
