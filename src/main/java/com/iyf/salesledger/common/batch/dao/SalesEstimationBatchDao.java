package com.iyf.salesledger.common.batch.dao;

import org.apache.ibatis.annotations.Param;

public interface SalesEstimationBatchDao {

	void delete(@Param("company") String company, @Param("department") String department);

	void insert(@Param("company") String company, @Param("department") String department);
	
	void deleteManual(@Param("company") String company, @Param("department") String department, @Param("batch_month") String batch_month);
	
	void insertManual(@Param("company") String company, @Param("department") String department, @Param("batch_month") String batch_month);

}
