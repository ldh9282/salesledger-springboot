package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.dao.ChartDao;

@Service
public class ChartService {

	@Autowired
	private ChartDao chartDao;
	
	public List<Map<String, Object>> salesThisYearResultListByCompanyAndDepartment(String company, String department) {
		return chartDao.salesThisYearResultListByCompanyAndDepartment(company, department);
	}

}
