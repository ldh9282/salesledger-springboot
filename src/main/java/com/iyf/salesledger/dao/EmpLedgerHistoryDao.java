package com.iyf.salesledger.dao;

import java.util.Map;

import com.iyf.salesledger.model.EmpLedger;

public interface EmpLedgerHistoryDao {

	void insert(EmpLedger empLedger);
	
	void insertHistory(Map<String, Object> paramMap);

	void updateHistory(Map<String, Object> paramMap);
}
