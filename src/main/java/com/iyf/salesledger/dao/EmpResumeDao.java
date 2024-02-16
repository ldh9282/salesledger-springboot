package com.iyf.salesledger.dao;

import java.util.Map;

public interface EmpResumeDao {

	void insertEmpResume(Map<String, Object> paraMap);

	Map<String, Object> getEmpResumeByEmpPoolId(long emp_pool_id);
}
