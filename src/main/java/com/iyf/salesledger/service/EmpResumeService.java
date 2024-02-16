package com.iyf.salesledger.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.dao.EmpResumeDao;

@Service
public class EmpResumeService {
	

	@Autowired
	private EmpResumeDao empResumeDao;
	
	public void insertEmpResume(Map<String, Object> requestMap) {
		empResumeDao.insertEmpResume(requestMap);
	}

	public Map<String, Object> getEmpResumeByEmpPoolId(long emp_pool_id) {
		 return empResumeDao.getEmpResumeByEmpPoolId(emp_pool_id);
	}
}
