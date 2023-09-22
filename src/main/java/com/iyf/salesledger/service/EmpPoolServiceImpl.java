package com.iyf.salesledger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iyf.salesledger.dao.EmpPoolDao;
import com.iyf.salesledger.model.EmpPool;

@Service
public class EmpPoolServiceImpl implements EmpPoolService {

	@Autowired
	private EmpPoolDao empPoolDao;
	
	@Override
	public EmpPool selectOne(long emp_pool_id) {
		return empPoolDao.selectOne(emp_pool_id);
	}
	
	@Override
	public EmpPool findByNameAndPhoneNumber(String name, String phonenumber) {
		return empPoolDao.findByNameAndPhoneNumber(name, phonenumber);
	}
	
	@Override
	public List<EmpPool> list() {
		return empPoolDao.list();
	}
	
	@Override
	public void update(EmpPool empPool) {
		empPoolDao.update(empPool);
	}
	
	@Override
	public void delete(long emp_pool_id) {
		empPoolDao.delete(emp_pool_id);
	}
	
	// empPoolRegister.jsp 페이지에서 등록
	@Override
	public void insert(EmpPool empPool) {
		empPoolDao.insert(empPool);
		
	}

	// empPoolDetail.jsp 페이지에서 del 필드 수정
	@Override
	public void patchDel(long emp_pool_id, String del) {
		EmpPool empPool = empPoolDao.selectOne(emp_pool_id);
		empPool.setDel(del);
		
		empPoolDao.update(empPool);
		
	}

	@Override
	public void patchProjectAssign(long emp_pool_id, int project_assign) {
		EmpPool empPool = empPoolDao.selectOne(emp_pool_id);
		empPool.setProject_assign(project_assign);
		
		empPoolDao.update(empPool);
	}



	
	

}
