package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

import com.iyf.salesledger.model.EmpLedger;
import com.iyf.salesledger.model.EmpPool;
import com.iyf.salesledger.model.SalesLedger;

public interface SalesLedgerService {

	List<SalesLedger> list();
	
	List<Map<String, Object>> listByCompanyAndDepartment(String company, String department);
	
	SalesLedger selectOne(long sales_id);

	void insert(SalesLedger salesLedger);
	
	void update(SalesLedger salesLedger);
	
	void delete(long sales_id);
	
	void patchDel(long sales_id, String del);

	void update(SalesLedger salesLedger, EmpLedger empLedger, EmpPool empPool);
}
