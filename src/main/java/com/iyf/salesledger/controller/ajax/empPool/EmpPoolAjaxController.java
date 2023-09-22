package com.iyf.salesledger.controller.ajax.empPool;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.model.EmpPool;
import com.iyf.salesledger.service.EmpPoolService;

import lombok.extern.log4j.Log4j2;

@RestController @Log4j2
public class EmpPoolAjaxController {

	@Autowired
	private EmpPoolService empPoolService;
	
	/***
	 * @기능 empPoolList.jsp 페이지에서 목록 조회
	 * @param
	 * @return empPools 인력풀 목록
	 */
	@GetMapping("/empPool.ajax")
	public List<EmpPool> retrieveEmpPoolList() {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolAjaxController.retrieveEmpPoolList");}
		if (log.isInfoEnabled()) {log.info("do service ::: empPoolService.list");}
		List<EmpPool> empPools = empPoolService.list();
		if (log.isInfoEnabled()) {log.info("End EmpPoolAjaxController.retrieveEmpPoolList");}
		return empPools;
	}
	
	/***
	 * @기능 empPoolRegister.jsp 페이지에서 등록
	 * @param empPool 인력풀 단건
	 * @return 
	 */
	@PostMapping("/empPool.ajax")
	public void insertEmpPool(@RequestBody EmpPool empPool) {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolAjaxController.insertEmpPool");}
		if (log.isInfoEnabled()) {log.info("param ::: empPool ::: " + empPool);}
		if (log.isInfoEnabled()) {log.info("do service ::: empPoolService.insert");}
		empPoolService.insert(empPool);
		if (log.isInfoEnabled()) {log.info("End EmpPoolAjaxController.insertEmpPool");}
	}
	
	/***
	 * @기능 empPoolDetail.jsp 페이지에서 상세조회
	 * @param emp_pool_id 인력풀 id
	 * @return empPool 인력풀 단건
	 */
	@GetMapping("/empPool.ajax/{emp_pool_id}")
	public EmpPool retrieveEmpPool(@PathVariable long emp_pool_id) {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolAjaxController.retrieveEmpPool");}
		if (log.isInfoEnabled()) {log.info("param ::: emp_pool_id ::: " + emp_pool_id);}
		if (log.isInfoEnabled()) {log.info("do service ::: empPoolService.selectOne");}
		EmpPool empPool = empPoolService.selectOne(emp_pool_id);
		if (log.isInfoEnabled()) {log.info("return ::: empPool ::: " + empPool);}
		if (log.isInfoEnabled()) {log.info("End EmpPoolAjaxController.retrieveEmpPool");}
		return empPool;
	}
	
	/***
	 * @기능 empPoolDetail.jsp 페이지에서 수정
	 * @param empPool 인력풀 단건
	 * @return
	 */
	@PutMapping("/empPool.ajax")
	public void updateEmpPool(@RequestBody EmpPool empPool) {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolAjaxController.updateEmpPool");}
		if (log.isInfoEnabled()) {log.info("param ::: empPool ::: " + empPool);}
		if (log.isInfoEnabled()) {log.info("do service ::: empPoolService.update");}
		empPoolService.update(empPool);
		if (log.isInfoEnabled()) {log.info("End EmpPoolAjaxController.updateEmpPool");}
	}
	
	/***
	 * @기능 empPoolDetail.jsp 페이지에서 삭제 (미사용)
	 * @param emp_pool_id 인력풀 id
	 * @return
	 */
	@Deprecated
	@DeleteMapping("/empPool.ajax/{emp_pool_id}")
	public void deleteEmpPool(@PathVariable long emp_pool_id) {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolAjaxController.deleteEmpPool");}
		if (log.isInfoEnabled()) {log.info("param ::: emp_pool_id ::: " + emp_pool_id);}
		if (log.isInfoEnabled()) {log.info("do service ::: empPoolService.delete");}
		empPoolService.delete(emp_pool_id);
		if (log.isInfoEnabled()) {log.info("End EmpPoolAjaxController.deleteEmpPool");}
	}
	
	/***
	 * @기능 empPoolDetail.jsp 페이지에서 해당 인력의 프로젝트 진행수 수정 (현재 투입된 프로젝트 개수 수정)
	 * @param emp_pool_id 인력풀 id
	 * @param project_assign 프로젝트 진행수
	 * @return
	 */
	@PatchMapping("/empPool.ajax/{emp_pool_id}/project_assign/{project_assign}")
	public void patchProjectAssign(@PathVariable long emp_pool_id, @PathVariable int project_assign) {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolAjaxController.patchProjectAssign");}
		if (log.isInfoEnabled()) {log.info("param ::: emp_pool_id ::: " + emp_pool_id);}
		if (log.isInfoEnabled()) {log.info("param ::: project_assign ::: " + project_assign);}
		if (log.isInfoEnabled()) {log.info("do service ::: empPoolService.patchProjectAssign");}
		empPoolService.patchProjectAssign(emp_pool_id, project_assign);
		if (log.isInfoEnabled()) {log.info("End EmpPoolAjaxController.patchProjectAssign");}
	}
	
	/***
	 * @기능 empPoolDetail.jsp 페이지에서 삭제시 del 컬럼 Y로 수정
	 * @param emp_pool_id 인력풀 id
	 * @param del 삭제여부
	 * @return
	 */
	@PatchMapping("/empPool.ajax/{emp_pool_id}/del/{del}")
	public void patchDel(@PathVariable long emp_pool_id, @PathVariable String del) {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolAjaxController.patchDel");}
		if (log.isInfoEnabled()) {log.info("param ::: emp_pool_id ::: " + emp_pool_id);}
		if (log.isInfoEnabled()) {log.info("param ::: del ::: " + del);}
		if (log.isInfoEnabled()) {log.info("do service ::: empPoolService.patchDel");}
		empPoolService.patchDel(emp_pool_id, del);
		if (log.isInfoEnabled()) {log.info("End EmpPoolAjaxController.patchDel");}
	}
	
	
	/***
	 * @기능 empLedgerRegister.jsp 페이지에서 성명과 전화번호로 empPool 조회
	 * @param name 성명
	 * @param phonenumber 전화번호
	 * @return empPool 인력풀 단건
	 */
	@GetMapping("/empPool.ajax/name/{name}/phonenumber/{phonenumber}")
	public EmpPool retrieveEmpPoolByNameAndPhoneNumber(@PathVariable String name, @PathVariable String phonenumber) {
		if (log.isInfoEnabled()) {log.info("Start EmpPoolAjaxController.retrieveEmpPoolByNameAndPhoneNumber");}
		if (log.isInfoEnabled()) {log.info("param ::: name ::: " + name);}
		if (log.isInfoEnabled()) {log.info("param ::: phonenumber ::: " + phonenumber);}
		if (log.isInfoEnabled()) {log.info("do service ::: empPoolService.retrieveEmpPoolByNameAndPhoneNumber");}
		EmpPool empPool = empPoolService.findByNameAndPhoneNumber(name, phonenumber);
		if (log.isInfoEnabled()) {log.info("End EmpPoolAjaxController.retrieveEmpPoolByNameAndPhoneNumber");}
		return empPool;
	}
	
}
