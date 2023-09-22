package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.common.batch.model.SalesResultInfra;
import com.iyf.salesledger.dao.SalesResultInfraDao;

@Service
public class SalesResultInfraServiceImpl implements SalesResultInfraService {

	@Autowired
	private SalesResultInfraDao salesResultInfraDao;
	
	@Override
	public List<Map<String, Object>> listByCompanyAndDepartmentAndCategoryAndBatchMonth(String company, String department, String category, String batch_month) {
		return salesResultInfraDao.listByCompanyAndDepartmentAndCategoryAndBatchMonth(company, department, category, batch_month);
	}

	@Override
	public void insertByHandwrite(SalesResultInfra salesResultInfra) {
		salesResultInfra.setHandwrite("Y");
		salesResultInfraDao.insert(salesResultInfra);
	}

	@Override
	public Map<String, Object> selectOne(long sales_result_infra_id) {
		return salesResultInfraDao.selectOne(sales_result_infra_id);
	}

	@Override
	public void delete(long sales_result_infra_id) {
		salesResultInfraDao.delete(sales_result_infra_id);
	}

	@Override
	public void update(SalesResultInfra salesResultInfra) {
		salesResultInfraDao.update(salesResultInfra);
	}

}
