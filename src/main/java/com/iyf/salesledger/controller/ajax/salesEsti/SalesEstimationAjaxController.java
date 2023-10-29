package com.iyf.salesledger.controller.ajax.salesEsti;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.common.batch.service.SalesEstimationBatchService;
import com.iyf.salesledger.service.SalesEstimationService;

import lombok.extern.log4j.Log4j2;

@RestController @Log4j2
public class SalesEstimationAjaxController {

	@Autowired
	private SalesEstimationService salesEstimationService;
	
	@Autowired
	private SalesEstimationBatchService salesEstimationBatchService;
	
	/***
	 * @기능 salesEstimationList.jsp 페이지에서 매출추정 목록 조회
	 * @param company 회사(IYCNC, IBTS, IYS)
	 * @param department 부서(ITO, IDC, CONVERSION)
	 * @param batch_month 배치년월 yyyymm
	 */
	@GetMapping("/salesEstimation.ajax/company/{company}/department/{department}/batch_month/{batch_month}")
	public List<Map<String, Object>> retrieveSalesEstimationListByCompanyAndDepartmentAndBatchMonth(@PathVariable String company, @PathVariable String department, @PathVariable String batch_month) {
		if (log.isInfoEnabled()) {log.info("Start SalesEstimationAjaxController.retrieveSalesEstimationListByCompanyAndDepartmentAndBatchMonth");}
		if (log.isInfoEnabled()) {log.info("param ::: company ::: " + company);}
		if (log.isInfoEnabled()) {log.info("param ::: department ::: " + department);}
		if (log.isInfoEnabled()) {log.info("param ::: batch_month ::: " + batch_month);}
		if (log.isInfoEnabled()) {log.info("do service ::: salesEstimationService.listByCompanyAndDepartmentAndBatchMonth");}
		List<Map<String, Object>> salesEstiList = salesEstimationService.listByCompanyAndDepartmentAndBatchMonth(company, department, batch_month);
		if (log.isInfoEnabled()) {log.info("End SalesEstimationAjaxController.retrieveSalesEstimationListByCompanyAndDepartmentAndBatchMonth");}
		return salesEstiList;
	}
	
	
	/***
	 * @기능 salesEstimationList.jsp 페이지에서 매출추정 수동배치
	 * @param company 회사(IYCNC, IBTS, IYS)
	 * @param department 부서(ITO, IDC, CONVERSION)
	 * @param batch_month 배치년월 yyyymm
	 */
	@PostMapping("/salesEstimation.ajax/company/{company}/department/{department}/batch_month/{batch_month}")
	public void manualSalesEstiBatchByIBTSAndITO(@PathVariable String company, @PathVariable String department, @PathVariable String batch_month) {
		if (log.isInfoEnabled()) {log.info("Start SalesEstimationAjaxController.manualSalesEstiBatchByIBTSAndITO");}
		if (log.isInfoEnabled()) {log.info("param ::: company ::: " + company);}
		if (log.isInfoEnabled()) {log.info("param ::: department ::: " + department);}
		if (log.isInfoEnabled()) {log.info("param ::: batch_month ::: " + batch_month);}
		if (log.isInfoEnabled()) {log.info("do service ::: salesEstimationBatchService.manualSalesBatchByCompanyAndDepartment");}
		salesEstimationBatchService.manualSalesBatchByCompanyAndDepartment(company, department, batch_month);
		if (log.isInfoEnabled()) {log.info("End SalesEstimationAjaxController.manualSalesEstiBatchByIBTSAndITO");}
	}
}
