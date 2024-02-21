package com.iyf.salesledger.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iyf.salesledger.common.security.SecurityUtils;
import com.iyf.salesledger.dao.EmpLedgerDao;
import com.iyf.salesledger.dao.EmpLedgerHistoryDao;
import com.iyf.salesledger.dao.EmpPoolDao;
import com.iyf.salesledger.dao.SalesLedgerDao;
import com.iyf.salesledger.model.EmpLedger;
import com.iyf.salesledger.model.EmpPool;
import com.iyf.salesledger.model.SalesLedger;

@Service
public class EmpLedgerService {

	@Autowired
	private EmpLedgerDao empLedgerDao;
	
	@Autowired
	private EmpPoolDao empPoolDao;
	
	@Autowired
	private EmpLedgerHistoryDao empLedgerHistoryDao;
	
	@Autowired
	private SalesLedgerDao salesLedgerDao;
	
	public List<EmpLedger> list() {
		
		return empLedgerDao.list();
	}
	
	public List<Map<String, Object>> listByCompanyAndDepartment(String company, String department) {
		return empLedgerDao.listByCompanyAndDepartment(company, department);
	}

	public EmpLedger selectOne(long emp_id) {
		return empLedgerDao.selectOne(emp_id);
	}

	public void insert(EmpLedger empLedger) {
		empLedgerDao.insert(empLedger);
	}
	
	@Transactional
	public ResponseEntity<String> insertByProgress(EmpLedger empLedger) {
		String username = SecurityUtils.getCurrentUsername();
		empLedger.setSystem_creator(username);
		empLedger.setSystem_modifier(username);
		
		empLedger.setProgress("투입예정");
		
		String projectYn = empLedgerDao.selectProjectYn(empLedger);
		
		if ("Y".equals(projectYn)) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("이미 투입예정 혹은 투입된 프로젝트입니다.");
		}
			
		empLedgerDao.insert(empLedger);
		empLedgerHistoryDao.insert(empLedger);
		EmpPool empPool = empPoolDao.selectOne(empLedger.getEmp_id());
		
		if (empPool != null) {
			
			int cntProjectAssign = empPoolDao.selectCntProjectAssign(empPool.getEmp_pool_id());
			empPool.setProject_assign(cntProjectAssign);
			empPoolDao.update(empPool);
		}
		
		return ResponseEntity.status(HttpStatus.OK).body("인력원장 엑셀 데이터 추가가 성공적으로 수행되었습니다.");
		
	}
	
	@Transactional
	public void update(EmpLedger empLedger) {
		String username = SecurityUtils.getCurrentUsername();
		empLedger.setSystem_creator(username);
		empLedger.setSystem_modifier(username);
		empLedgerDao.update(empLedger);
		empLedgerHistoryDao.insert(empLedger);
		
	}

	@Transactional
	public void patchProgress(EmpLedger theEmpLedger) {
		EmpLedger empLedger = empLedgerDao.selectOne(theEmpLedger.getEmp_id());
		EmpPool empPool = empPoolDao.selectOne(empLedger.getEmp_pool_id());
		
		if (empLedger != null) {
			empLedger.setProgress(theEmpLedger.getProgress());
			empLedger.setProgress_reason(theEmpLedger.getProgress_reason());
			
			String username = SecurityUtils.getCurrentUsername();
			empLedger.setSystem_creator(username);
			empLedger.setSystem_modifier(username);
			empLedgerDao.updateProgress(empLedger);
			empLedgerHistoryDao.insert(empLedger);
		}
		
		Map<String, Object> countByEmpId = salesLedgerDao.getCountByEmpId(empLedger.getEmp_id());
		if (empLedger.getProgress().equals("투입") && (Long) countByEmpId.get("count") == 0) {
			SalesLedger salesLedger = new SalesLedger();
			salesLedger.setEmp_id(empLedger.getEmp_id());
			salesLedgerDao.insert(salesLedger);
			
		}
		
		
		empPool.setProject_assign(empPoolDao.selectCntProjectAssign(empPool.getEmp_pool_id()));
		empPoolDao.update(empPool);
	}

	@Deprecated
	public void patchProgressReason(long emp_id, String progress_reason) {
		EmpLedger empLedger = empLedgerDao.selectOne(emp_id);
		
		if (empLedger != null) {
			empLedger.setProgress_reason(progress_reason);
			
			String username = SecurityUtils.getCurrentUsername();
			empLedger.setSystem_creator(username);
			empLedger.setSystem_modifier(username);
			empLedgerDao.update(empLedger);
			empLedgerHistoryDao.insert(empLedger);
		}
	}

	@Transactional
	public void update(EmpLedger empLedger, EmpPool empPool) {
		
		EmpPool theEmpPool = empPoolDao.selectOne(empLedger.getEmp_pool_id());
		
		if (theEmpPool != null) {
			
			empPool.setEmp_pool_id(theEmpPool.getEmp_pool_id());
			empPool.setProject_assign(empPoolDao.selectCntProjectAssign(empPool.getEmp_pool_id()));
			empPoolDao.update(empPool);
		}
		
		Map<String, Object> countByEmpId = salesLedgerDao.getCountByEmpId(empLedger.getEmp_id());
		
		if (empLedger.getProgress().equals("투입") && (Long) countByEmpId.get("count") == 0) {
			SalesLedger salesLedger = new SalesLedger();
			salesLedger.setEmp_id(empLedger.getEmp_id());
			salesLedgerDao.insert(salesLedger);
			
		}
		
		String username = SecurityUtils.getCurrentUsername();
		empLedger.setSystem_creator(username);
		empLedger.setSystem_modifier(username);
		empLedgerDao.update(empLedger);
		empLedgerHistoryDao.insert(empLedger);
		
	}

	@Transactional
	public void patchDel(long emp_id, String del) {
		 EmpLedger empLedger = empLedgerDao.selectOne(emp_id);
		 if (empLedger != null) {
			empLedger.setDel(del);
			
			String username = SecurityUtils.getCurrentUsername();
			empLedger.setSystem_creator(username);
			empLedger.setSystem_modifier(username);
			empLedgerDao.updateDel(empLedger);
			empLedgerHistoryDao.insert(empLedger);
		}
	}
	
	@Transactional
	public void patchForceDel(long emp_id, String del) {
		EmpLedger empLedger = empLedgerDao.selectOne(emp_id);
		SalesLedger salesLedger = salesLedgerDao.findByEmpId(emp_id);
		
		if (empLedger != null) {
			empLedger.setDel(del);
			String username = SecurityUtils.getCurrentUsername();
			empLedger.setSystem_creator(username);
			empLedger.setSystem_modifier(username);
			empLedgerDao.updateDel(empLedger);
			empLedgerHistoryDao.insert(empLedger);
		}
		if (salesLedger != null) {
			salesLedger.setDel(del);
			salesLedgerDao.update(salesLedger);
		}
		
		EmpPool empPool = empPoolDao.selectOne(empLedger.getEmp_pool_id());
		if (empPool != null) {
			empPool.setProject_assign(empPoolDao.selectCntProjectAssign(empPool.getEmp_pool_id()));
			empPoolDao.update(empPool);
		}
		
	}

}
