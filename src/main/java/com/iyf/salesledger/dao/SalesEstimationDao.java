package com.iyf.salesledger.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SalesEstimationDao {

	List<Map<String, Object>> listByCompanyAndDepartmentAndBatchMonth(@Param("company") String company, @Param("department") String department, @Param("batch_month") String batch_month);

}
