package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iyf.salesledger.dao.EmpPoolDao;
import com.iyf.salesledger.model.EmpPool;

@Service
public class EmpPoolService {

	@Autowired
	private EmpPoolDao empPoolDao;
	
	public EmpPool selectOne(long emp_pool_id) {
		return empPoolDao.selectOne(emp_pool_id);
	}
	
	public EmpPool findByNameAndPhoneNumber(String name, String phonenumber) {
		return empPoolDao.findByNameAndPhoneNumber(name, phonenumber);
	}
	
	public List<EmpPool> list() {
		return empPoolDao.list();
	}
	
	public void update(EmpPool empPool) {
		empPoolDao.update(empPool);
	}
	
	public void delete(long emp_pool_id) {
		empPoolDao.delete(emp_pool_id);
	}
	
	// empPoolRegister.jsp 페이지에서 등록
	public void insert(EmpPool empPool) {
		empPoolDao.insert(empPool);
		
	}

	// empPoolDetail.jsp 페이지에서 del 필드 수정
	public void patchDel(long emp_pool_id, String del) {
		EmpPool empPool = empPoolDao.selectOne(emp_pool_id);
		empPool.setDel(del);
		
		empPoolDao.update(empPool);
		
	}

	public void patchProjectAssign(long emp_pool_id, int project_assign) {
		EmpPool empPool = empPoolDao.selectOne(emp_pool_id);
		empPool.setProject_assign(project_assign);
		
		empPoolDao.update(empPool);
	}

	public List<Map<String, Object>> selectEmpPoolProgressDetail1(long emp_pool_id) {
		List<Map<String, Object>> empPoolProgressDetail1 = empPoolDao.selectEmpPoolProgressDetail1(emp_pool_id);
		return empPoolProgressDetail1;
	}

	public List<Map<String, Object>> selectEmpPoolProgressDetail2(long emp_pool_id) {
		List<Map<String, Object>> empPoolProgressDetail2 = empPoolDao.selectEmpPoolProgressDetail2(emp_pool_id);
		return empPoolProgressDetail2;
	}



	
	

}
