package com.iyf.salesledger.service;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.iyf.salesledger.common.security.SecurityUtils;
import com.iyf.salesledger.common.utils.DateUtils;
import com.iyf.salesledger.dao.EmpLedgerDao;
import com.iyf.salesledger.dao.EmpLedgerHistoryDao;
import com.iyf.salesledger.dao.EmpPoolDao;
import com.iyf.salesledger.dao.SalesCostStatusDao;

@Service
public class SalesCostStatusService {

	@Autowired
	private SalesCostStatusDao salesCostStatusDao;
	
	@Autowired
	private EmpLedgerDao empLedgerDao;
	
	@Autowired
	private EmpLedgerHistoryDao empLedgerHistoryDao;
	
	@Autowired
	private EmpPoolDao empPoolDao;
	
	public List<Map<String, Object>> getSalesCostStatuslist(Map<String, Object> requestMap) {
		return salesCostStatusDao.getSalesCostStatuslist(requestMap);
	}
	public List<Map<String, Object>> getSalesCostStatusHistorylist(Map<String, Object> requestMap) {
		return salesCostStatusDao.getSalesCostStatusHistorylist(requestMap);
	}
	
	public Map<String, Object> getSalesCostStatus(Map<String, Object> requestMap) {
		return salesCostStatusDao.getSalesCostStatus(requestMap);
	}
	
	@Transactional
	public void updateSalesCostStatus(Map<String, Object> requestMap) {
		
		String username = SecurityUtils.getCurrentUsername();
		
		Map<String, Object> paramMap = new HashMap<>();
		
		try {
		
			paramMap.put("emp_id", Long.valueOf((String) requestMap.get("emp_id")));
			paramMap.put("emp_pool_id", Long.valueOf((String) requestMap.get("emp_pool_id")));
			paramMap.put("site", requestMap.get("site"));
			paramMap.put("client", requestMap.get("client"));
			paramMap.put("project_name", requestMap.get("project_name"));
			paramMap.put("sourcing_manager", requestMap.get("sourcing_manager"));
			paramMap.put("purchase_mm", requestMap.get("purchase_mm"));
			paramMap.put("auto_mm", requestMap.get("auto_mm"));
			paramMap.put("name", requestMap.get("name"));
			paramMap.put("career_years", requestMap.get("career_years"));
			paramMap.put("career_field", requestMap.get("career_field"));
			paramMap.put("career_level", requestMap.get("career_level"));
			paramMap.put("assign_date", DateUtils.parseObject(requestMap.get("assign_date")));
			paramMap.put("end_date", DateUtils.parseObject(requestMap.get("end_date")));
			paramMap.put("resign_date", DateUtils.parseObject(requestMap.get("resign_date")));
			paramMap.put("sales_unit", requestMap.get("sales_unit"));
			paramMap.put("sales_mm", requestMap.get("sales_mm"));
			paramMap.put("purchase_unit", requestMap.get("purchase_unit"));
			paramMap.put("brief", requestMap.get("brief"));
			paramMap.put("system_creator", username);
			paramMap.put("system_modifier", username);
		
			empPoolDao.updateEmpPool(paramMap);
			empLedgerDao.updateEmpLedger(paramMap);
			empLedgerHistoryDao.insertHistory(paramMap);
		} catch (ParseException e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
		}
		
		
	}
}
