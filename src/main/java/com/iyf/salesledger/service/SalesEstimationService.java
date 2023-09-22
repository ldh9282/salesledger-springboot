package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

import com.iyf.salesledger.common.batch.model.SalesResult;

public interface SalesEstimationService {

	List<Map<String, Object>> listByCompanyAndDepartmentAndBatchMonth(String company, String department, String batch_month);
}
