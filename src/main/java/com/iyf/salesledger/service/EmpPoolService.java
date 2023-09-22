package com.iyf.salesledger.service;

import java.util.List;

import com.iyf.salesledger.model.EmpPool;

public interface EmpPoolService {

	EmpPool selectOne(long emp_pool_id);
	
	EmpPool findByNameAndPhoneNumber(String name, String phonenumber);
	
	List<EmpPool> list();
	
	void update(EmpPool empPool);
	
	void delete(long emp_pool_id);

	void insert(EmpPool empPool);
	
	void patchDel(long emp_pool_id, String del);

	void patchProjectAssign(long emp_pool_id, int project_assign);
	
	
}
