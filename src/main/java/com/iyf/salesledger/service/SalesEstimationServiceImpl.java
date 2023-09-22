package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.dao.SalesEstimationDao;

@Service
public class SalesEstimationServiceImpl implements SalesEstimationService {

	@Autowired
	private SalesEstimationDao salesEstimationDao;
	@Override
	public List<Map<String, Object>> listByCompanyAndDepartmentAndBatchMonth(String company, String department, String batch_month) {
		return salesEstimationDao.listByCompanyAndDepartmentAndBatchMonth(company, department, batch_month);
	}

}
