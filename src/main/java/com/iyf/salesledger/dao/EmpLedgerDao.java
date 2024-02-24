package com.iyf.salesledger.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.iyf.salesledger.model.EmpLedger;

public interface EmpLedgerDao {

	List<EmpLedger> list();
	
	List<Map<String, Object>> listByCompanyAndDepartment(@Param("company") String company, @Param("department") String department);
	
	EmpLedger selectOne(long emp_id);
	
	void insert(EmpLedger empLedger);

	void update(EmpLedger empLedger);
	
	void updateDel(EmpLedger empLedger);

	String selectProjectYn(EmpLedger empLedger);

	void updateProgress(EmpLedger empLedger);
	
	List<Map<String, Object>> getMonthlyMM(Map<String, Object> paramMap);
	
	void updateMonthlyMM(Map<String, Object> paramMap);

	void updateEmpLedger(Map<String, Object> requestMap);
}
