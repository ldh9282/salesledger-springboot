package com.iyf.salesledger.dao;

import java.util.List;
import java.util.Map;

public interface SalesCostStatusDao {

	List<Map<String, Object>> getSalesCostStatuslist(Map<String, Object> paramMap);
	
	List<Map<String, Object>> getSalesCostStatusHistorylist(Map<String, Object> paramMap);
	
	Map<String, Object> getSalesCostStatus(Map<String, Object> paramMap);

}
