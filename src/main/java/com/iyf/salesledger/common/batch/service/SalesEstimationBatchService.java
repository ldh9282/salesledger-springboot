package com.iyf.salesledger.common.batch.service;

public interface SalesEstimationBatchService {

	void monthlySalesBatchByCompanyAndDepartment(String company, String department);
	
	void manualSalesBatchByCompanyAndDepartment(String company, String department, String batch_month);
}
