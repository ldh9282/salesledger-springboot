package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.iyf.salesledger.common.batch.model.SalesResult;
import com.iyf.salesledger.common.batch.model.SalesResultInfra;

public interface SalesResultInfraService {

	List<Map<String, Object>> listByCompanyAndDepartmentAndCategoryAndBatchMonth(@Param("company") String company, @Param("department") String department, @Param("category") String category, @Param("batch_month") String batch_month);
	
	// 매출 원장에 존재하지 않는 데이터를 수기로 추가하기 위한 기능
	// 매출 실적에 수기로 추가한 데이터는 배치에 의해 삭제 및 추가되지 않음
	// handwrite 컬럼이 Y 가 수기 데이터, handwrite 컬럼이 N 이면 배치 데이터
	void insertByHandwrite(SalesResultInfra salesResultInfra);

	Map<String, Object> selectOne(long sales_result_infra_id);

	void delete(long sales_result_infra_id);

	void update(SalesResultInfra salesResultInfra);
}
