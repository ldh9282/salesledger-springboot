package com.iyf.salesledger.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.iyf.salesledger.common.batch.model.SalesResult;

public interface SalesResultDao {

	List<Map<String, Object>> listByCompanyAndDepartmentAndBatchMonth(@Param("company") String company, @Param("department") String department, @Param("batch_month") String batch_month);

	void insert(SalesResult salesResult);

	Map<String, Object> selectOne(long sales_result_id);

	void delete(long sales_result_id);

	void update(SalesResult salesResult);
}
