package com.iyf.salesledger.common.batch.service.empLedger;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iyf.salesledger.dao.EmpLedgerDao;
import com.iyf.salesledger.dao.EmpLedgerHistoryDao;
import com.iyf.salesledger.model.EmpLedger;

@Service
public class EmpLedgerBatchService {

	@Autowired
	private EmpLedgerDao empLedgerDao;
	
	@Autowired
	private EmpLedgerHistoryDao empLedgerHistoryDao;
	
	
	@Transactional
	public void updateMonthlyMM(Map<String, Object> requestMap) {
		List<Map<String, Object>> monthlyMMList = empLedgerDao.getMonthlyMM(requestMap);
		
		for (Map<String, Object> item : monthlyMMList) {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("emp_id", item.get("emp_id"));
			paramMap.put("sales_mm", item.get("자동계산mm"));
			paramMap.put("purchase_mm", item.get("자동계산mm"));
			paramMap.put("system_creator", "BATCH");
			paramMap.put("system_modifier", "BATCH");
			
			empLedgerDao.updateMonthlyMM(paramMap);
			
			empLedgerHistoryDao.insertHistory(paramMap);
		}
	}


	public void updateHistoryMonthlyMM(Map<String, Object> requestMap) {
		List<Map<String, Object>> monthlyMMList = empLedgerDao.getMonthlyMM(requestMap);
		
		for (Map<String, Object> item : monthlyMMList) {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("emp_id", item.get("emp_id"));
			paramMap.put("sales_mm", item.get("자동계산mm"));
			paramMap.put("purchase_mm", item.get("자동계산mm"));
			paramMap.put("system_modifier", "BATCH");
			paramMap.put("system_modifier", "BATCH");
			paramMap.put("batch_month", requestMap.get("batch_month"));
			
			
			empLedgerHistoryDao.updateHistory(paramMap);
		}
		
	}
	
}
