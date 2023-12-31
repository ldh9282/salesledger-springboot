package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.common.batch.model.SalesEstimationInfra;
import com.iyf.salesledger.dao.SalesEstimationInfraDao;

@Service
public class SalesEstimationInfraService {

	@Autowired
	private SalesEstimationInfraDao salesEstimationInfraDao;

	public List<Map<String, Object>> listByCompanyAndDepartmentAndCategoryAndBatchMonth(String company, String department, String category, String batch_month) {
		return salesEstimationInfraDao.listByCompanyAndDepartmentAndCategoryAndBatchMonth(company, department, category, batch_month);
	}

	public void insertByHandwrite(SalesEstimationInfra salesEstimationInfra) {
		salesEstimationInfra.setHandwrite("Y");
		salesEstimationInfraDao.insert(salesEstimationInfra);
	}

	public Map<String, Object> selectOne(long sales_estimation_infra_id) {
		return salesEstimationInfraDao.selectOne(sales_estimation_infra_id);
	}

	public void delete(long sales_estimation_infra_id) {
		salesEstimationInfraDao.delete(sales_estimation_infra_id);
	}

	public void update(SalesEstimationInfra salesEstimationInfra) {
		salesEstimationInfraDao.update(salesEstimationInfra);
	}
}
