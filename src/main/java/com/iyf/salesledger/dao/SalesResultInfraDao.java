package com.iyf.salesledger.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.iyf.salesledger.common.batch.model.SalesResultInfra;

public interface SalesResultInfraDao {

	List<Map<String, Object>> listByCompanyAndDepartmentAndCategoryAndBatchMonth(@Param("company") String company, @Param("department") String department, @Param("category") String category, @Param("batch_month") String batch_month);

	void insert(SalesResultInfra salesResultInfra);

	Map<String, Object> selectOne(long sales_result_infra_id);

	void delete(long sales_result_infra_id);

	void update(SalesResultInfra salesResultInfra);
}
