package com.iyf.salesledger.controller.ajax.empLedger;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.iyf.salesledger.model.EmpLedger;
import com.iyf.salesledger.model.EmpPool;
import com.iyf.salesledger.service.EmpLedgerService;

import lombok.extern.log4j.Log4j2;

@RestController @Log4j2
public class EmpLedgerAjaxController {

	@Autowired
	private EmpLedgerService empLedgerService;
	
	/***
	 * @기능 empLedgerList.jsp 페이지에서 목록 조회 (미사용)
	 * @param 
	 * @return empLedgerList 인력기초원장 목록
	 */
	@Deprecated
	@GetMapping("/empLedger.ajax")
	public List<EmpLedger> retrieveEmpLedgerList() {
		if (log.isInfoEnabled()) {log.info("Start EmpLedgerAjaxController.retrieveEmpLedgerList");}
		if (log.isInfoEnabled()) {log.info("do service ::: empLedgerService.list");}
		List<EmpLedger> empLedgerList = empLedgerService.list();
		if (log.isInfoEnabled()) {log.info("End EmpLedgerAjaxController.retrieveEmpLedgerList");}
		return empLedgerList;
	}
	
	/***
	 * @기능 empLedgerDetail.jsp 페이지에서 상세 조회
	 * @param emp_id 인력기초원장 id
	 * @return empLedger 인력기초원장 단건
	 */
	@GetMapping("/empLedger.ajax/{emp_id}")
	public EmpLedger retrieveEmpLedger(@PathVariable long emp_id) {
		if (log.isInfoEnabled()) {log.info("Start EmpLedgerAjaxController.retrieveEmpLedger");}
		if (log.isInfoEnabled()) {log.info("param ::: emp_id ::: " + emp_id);}
		if (log.isInfoEnabled()) {log.info("do service ::: empLedgerService.selectOne");}
		EmpLedger empLedger = empLedgerService.selectOne(emp_id);
		if (log.isInfoEnabled()) {log.info("return ::: empLedger ::: " + empLedger);}
		if (log.isInfoEnabled()) {log.info("End EmpLedgerAjaxController.retrieveEmpLedger");}
		return empLedger;
	}
	
	/***
	 * @기능 empLedgerList.jsp 페이지에서 목록 조회 (회사와 부서에 맞는 인력기초원장 목록 조회)
	 * @param company 회사(IYCNC, IBTS, IYS)
	 * @param department 부서(ITO, IDC, CONVERSION, INFRA)
	 * @return empLedgerList 회사와 부서에 맞는 인력기초원장 목록
	 */
	@GetMapping("/empLedger.ajax/company/{company}/department/{department}")
	public List<Map<String, Object>> retrieveEmpLedgerListByCompanyAndDepartment(@PathVariable String company, @PathVariable String department) {
		if (log.isInfoEnabled()) {log.info("Start EmpLedgerAjaxController.retrieveEmpLedgerListByCompanyAndDepartment");}
		if (log.isInfoEnabled()) {log.info("param ::: company ::: " + company);}
		if (log.isInfoEnabled()) {log.info("param ::: department ::: " + department);}
		if (log.isInfoEnabled()) {log.info("do service ::: empLedgerService.listByCompanyAndDepartment");}
		List<Map<String, Object>> empLedgerList = empLedgerService.listByCompanyAndDepartment(company, department);
		if (log.isInfoEnabled()) {log.info("End EmpLedgerAjaxController.retrieveEmpLedgerListByCompanyAndDepartment");}
		return empLedgerList;
	}
	
	/***
	 * @기능 empLedgerRegister.jsp 페이지에서 투입예상버튼 클릭시 인력기초원장 등록
	 * @param empLedger 인력기초원장
	 * @return
	 */
	@PostMapping("/empLedger.ajax")
	public ResponseEntity<String> insertByProgress(@RequestBody Map<String, Object> requestBodyMap) {
		if (log.isInfoEnabled()) {log.info("Start EmpLedgerAjaxController.insertByProgress");}
		Gson gson = new Gson();
		EmpLedger empLedger = gson.fromJson(gson.toJson(requestBodyMap.get("empLedger")), EmpLedger.class);
		if (log.isInfoEnabled()) {log.info("param ::: empLedger ::: " + empLedger);}
		if (log.isInfoEnabled()) {log.info("do service ::: empLedgerService.insertByProgress");}
		ResponseEntity<String> response = empLedgerService.insertByProgress(empLedger);
		
		if (log.isInfoEnabled()) {log.info("response ::: " + response);}
		if (log.isInfoEnabled()) {log.info("End EmpLedgerAjaxController.insertByProgress");}
		
		return response;
	}
	
	/***
	 * @기능 empLedgerDetail.jsp 페이지에서 드랍, 투입, 철수 시 인력원장의 진행상태 수정
	 * @param emp_id 인력기초원장 id
	 * @param progress 진행상태
	 * @return
	 */
	@PatchMapping("/empLedger.ajax/{emp_id}/progress")
	public void patchProgress(@RequestBody EmpLedger empLedger) {
		if (log.isInfoEnabled()) {log.info("Start EmpLedgerAjaxController.patchProgress");}
		if (log.isInfoEnabled()) {log.info("do service ::: empLedgerService.patchProgress");}
		empLedgerService.patchProgress(empLedger);
		if (log.isInfoEnabled()) {log.info("End EmpLedgerAjaxController.patchProgress");}
	}
	
	/***
	 * @기능 empLedgerDetail.jsp 페이지에서 인력원장의 진행사유 수정
	 * @param emp_id 인력기초원장 id
	 * @param progress_reason 진행사유
	 * @return
	 */
	@PatchMapping("/empLedger.ajax/{emp_id}/progress_reason/{progress_reason}")
	public void patchProgressReason(@PathVariable long emp_id, @PathVariable(required = false) String progress_reason) {
		if (log.isInfoEnabled()) {log.info("Start EmpLedgerAjaxController.patchProgressReason");}
		if (log.isInfoEnabled()) {log.info("param ::: emp_id ::: " + emp_id);}
		if (log.isInfoEnabled()) {log.info("param ::: progress_reason ::: " + progress_reason);}
		if (log.isInfoEnabled()) {log.info("do service ::: empLedgerService.patchProgressReason");}
		empLedgerService.patchProgressReason(emp_id, progress_reason);
		if (log.isInfoEnabled()) {log.info("End EmpLedgerAjaxController.patchProgressReason");}
	}
	
	/***
	 * @기능 empLedgerDetail.jsp 페이지에서 인력원장 및 인력풀 수정
	 * @param empLedger 인력기초원장
	 * @param empPool 인력풀
	 * @return
	 */
	@PutMapping("/empLedger.ajax")
	public void update(@RequestBody Map<String, Object> requestBodyMap) {
		if (log.isInfoEnabled()) {log.info("Start EmpLedgerAjaxController.update");}
		Gson gson = new Gson();
		EmpLedger empLedger = gson.fromJson(gson.toJson(requestBodyMap.get("empLedger")), EmpLedger.class);
		EmpPool empPool= gson.fromJson(gson.toJson(requestBodyMap.get("empPool")), EmpPool.class);
		if (log.isInfoEnabled()) {log.info("param ::: empLedger ::: " + empLedger);}
		if (log.isInfoEnabled()) {log.info("param ::: empPool ::: " + empPool);}
		if (log.isInfoEnabled()) {log.info("do service ::: empLedgerService.update");}
		empLedgerService.update(empLedger, empPool);
		if (log.isInfoEnabled()) {log.info("End EmpLedgerAjaxController.update");}
	}
	
	/***
	 * @기능 empLedgerDetail.jsp 페이지에서 인력기초원장 삭제시 del 컬럼 Y로 수정 (진행상태가 드랍일 때)
	 * @param emp_id 인력기초원장 id
	 * @param del 삭제여부
	 * @return
	 */
	@PatchMapping("/empLedger.ajax/{emp_id}/del/{del}")
	public void patchDel(@PathVariable long emp_id, @PathVariable String del) {
		if (log.isInfoEnabled()) {log.info("Start EmpLedgerAjaxController.patchDel");}
		if (log.isInfoEnabled()) {log.info("param ::: emp_id ::: " + emp_id);}
		if (log.isInfoEnabled()) {log.info("param ::: del ::: " + del);}
		if (log.isInfoEnabled()) {log.info("do service ::: empLedgerService.patchDel");}
		empLedgerService.patchDel(emp_id, del);
		if (log.isInfoEnabled()) {log.info("End EmpLedgerAjaxController.patchDel");}
	}
	
	/***
	 * @기능 empLedgerDetail.jsp 페이지에서 인력원장 강제삭제시 (진행상태가 투입, 철수일때) <br>
	 * 	    매출원장과 인력기초원장의 del 컬럼 Y로 수정되며 해당 인력의 프로젝트 진행수 수정 <br>
	 * 		강제삭제시 매출원장에 기반한 이번달 매출실적배치와 다음달 매출추정배치에 영향있음
	 * @param emp_id 인력기초원장 id
	 * @param del 삭제여부
	 * @return
	 */
	@PatchMapping("/empLedger.ajax/{emp_id}/ForceDel/{del}")
	public void patchForceDel(@PathVariable long emp_id, @PathVariable String del) {
		if (log.isInfoEnabled()) {log.info("Start EmpLedgerAjaxController.patchForceDel");}
		if (log.isInfoEnabled()) {log.info("param ::: emp_id ::: " + emp_id);}
		if (log.isInfoEnabled()) {log.info("param ::: del ::: " + del);}
		if (log.isInfoEnabled()) {log.info("do service ::: empLedgerService.patchForceDel");}
		empLedgerService.patchForceDel(emp_id, del);
		if (log.isInfoEnabled()) {log.info("End EmpLedgerAjaxController.patchForceDel");}
	}
}
