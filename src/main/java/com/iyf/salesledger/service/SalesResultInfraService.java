package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.common.batch.model.SalesResultInfra;
import com.iyf.salesledger.dao.SalesResultInfraDao;

@Service
public class SalesResultInfraService {

	@Autowired
	private SalesResultInfraDao salesResultInfraDao;
	
	public List<Map<String, Object>> listByCompanyAndDepartmentAndCategoryAndBatchMonth(String company, String department, String category, String batch_month) {
		return salesResultInfraDao.listByCompanyAndDepartmentAndCategoryAndBatchMonth(company, department, category, batch_month);
	}

	public void insertByHandwrite(SalesResultInfra salesResultInfra) {
		// 매출 원장에 존재하지 않는 데이터를 수기로 추가하기 위한 기능
		// 매출 실적에 수기로 추가한 데이터는 배치에 의해 삭제 및 추가되지 않음
		// handwrite 컬럼이 Y 가 수기 데이터, handwrite 컬럼이 N 이면 배치 데이터
		salesResultInfra.setHandwrite("Y");
		salesResultInfraDao.insert(salesResultInfra);
	}

	public Map<String, Object> selectOne(long sales_result_infra_id) {
		return salesResultInfraDao.selectOne(sales_result_infra_id);
	}

	public void delete(long sales_result_infra_id) {
		salesResultInfraDao.delete(sales_result_infra_id);
	}

	public void update(SalesResultInfra salesResultInfra) {
		salesResultInfraDao.update(salesResultInfra);
	}

}
