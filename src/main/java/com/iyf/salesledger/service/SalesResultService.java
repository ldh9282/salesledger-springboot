package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.common.batch.model.SalesResult;
import com.iyf.salesledger.dao.SalesResultDao;

@Service
public class SalesResultService {

	@Autowired
	private SalesResultDao salesResultDao; 
	
	public List<Map<String, Object>> listByCompanyAndDepartmentAndBatchMonth(String company, String department, String batch_month) {
		return salesResultDao.listByCompanyAndDepartmentAndBatchMonth(company, department, batch_month);
	}

	public void insertByHandwrite(SalesResult salesResult) {
		// 매출 원장에 존재하지 않는 데이터를 수기로 추가하기 위한 기능
		// 매출 실적에 수기로 추가한 데이터는 배치에 의해 삭제 및 추가되지 않음
		// handwrite 컬럼이 Y 가 수기 데이터, handwrite 컬럼이 N 이면 배치 데이터
		salesResult.setHandwrite("Y");
		salesResultDao.insert(salesResult);
	}

	public Map<String, Object> selectOne(long sales_result_id) {
		return salesResultDao.selectOne(sales_result_id);
	}

	public void delete(long sales_result_id) {
		salesResultDao.delete(sales_result_id);
	}

	public void update(SalesResult salesResult) {
		salesResultDao.update(salesResult);
	}

}
