package com.iyf.salesledger.common.batch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iyf.salesledger.common.batch.dao.SalesResultBatchDao;

@Service
public class SalesResultBatchService {

	@Autowired
	private SalesResultBatchDao salesResultBatchDao; 
	
	@Transactional
	public void monthlySalesBatchByCompanyAndDepartment(String company, String department) {
		salesResultBatchDao.delete(company, department);
		salesResultBatchDao.insert(company, department);
	}
}
