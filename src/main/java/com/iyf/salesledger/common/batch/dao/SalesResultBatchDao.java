package com.iyf.salesledger.common.batch.dao;

import org.apache.ibatis.annotations.Param;

public interface SalesResultBatchDao {

	void delete(@Param("company") String company, @Param("department") String department);

	void insert(@Param("company") String company, @Param("department") String department);

}
