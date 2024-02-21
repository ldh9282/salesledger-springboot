package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.dao.SalesCostStatusDao;

@Service
public class SalesCostStatusService {

	@Autowired
	private SalesCostStatusDao salesCostStatusDao;
	
	public List<Map<String, Object>> getSalesCostStatuslist(Map<String, Object> requestMap) {
		return salesCostStatusDao.getSalesCostStatuslist(requestMap);
	}
	public List<Map<String, Object>> getSalesCostStatusHistorylist(Map<String, Object> requestMap) {
		return salesCostStatusDao.getSalesCostStatusHistorylist(requestMap);
	}
}
