package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

public interface ChartService {

	List<Map<String, Object>> salesThisYearResultListByCompanyAndDepartment(String company, String department);
}
