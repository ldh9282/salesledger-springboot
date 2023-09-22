package com.iyf.salesledger.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.iyf.salesledger.model.SalesLedger;

public interface SalesLedgerDao {
	
	List<SalesLedger> list();
	
	List<Map<String, Object>> listByCompanyAndDepartment(@Param("company") String company, @Param("department") String department);
	
	SalesLedger selectOne(long sales_id);

	void insert(SalesLedger salesLedger);
	
	void update(SalesLedger salesLedger);
	
	void delete(long sales_id);

	SalesLedger findByEmpId(long emp_id);
	

	
	

}