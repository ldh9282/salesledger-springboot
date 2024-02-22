package com.iyf.salesledger.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.iyf.salesledger.model.EmpPool;

public interface EmpPoolDao {

	EmpPool selectOne(long emp_pool_id);
	
	EmpPool findByNameAndPhoneNumber(@Param("name") String name, @Param("phonenumber") String phonenumber);
	
	List<EmpPool> list();
	
	void update(EmpPool empPool);
	
	void delete(long emp_pool_id);
	
	long insert(EmpPool empPool);

	int selectCntProjectAssign(long emp_pool_id);
	
	List<Map<String, Object>> selectEmpPoolProgressDetail1(long emp_pool_id);
	
	List<Map<String, Object>> selectEmpPoolProgressDetail2(long emp_pool_id);

	long getEmpPoolSeq();
	
	void updateEmpPool(Map<String, Object> paramMap);
}
