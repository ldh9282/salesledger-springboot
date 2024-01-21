package com.iyf.salesledger.controller.ajax.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.service.ChartService;

import lombok.extern.log4j.Log4j2;

@RestController @Log4j2
public class AdminChartAjaxController {

	@Autowired
	private ChartService chartService;
	
	/***
	 * @기능 salesResultChart.jsp 페이지에서 매출실적 올해 차트 조회 (사용안함)
	 * @param company 회사 (IYCNC, IBTS, IYS)
	 * @param department 부서 (ITO, CONVERSION, IDC)
	 * @return salesThistYearResult 매출실적 올해 차트
	 */
	@Deprecated
	@GetMapping("/admin/salesThisYearResultByCompanyAndDepartment.ajax/company/{company}/department/{department}")
	public List<Map<String, Object>> retrieveSalesThisYearResultByCompanyAndDepartment(@PathVariable String company, @PathVariable String department) {
		if (log.isInfoEnabled()) {log.info("Start AdminChartAjaxController.retrieveSalesThisYearResultByCompany");}
		if (log.isInfoEnabled()) {log.info("param ::: company ::: " + company);}
		if (log.isInfoEnabled()) {log.info("param ::: department ::: " + department);}
		if (log.isInfoEnabled()) {log.info("do service ::: chartService.salesThisYearResultListByCompanyAndDepartment");}
		List<Map<String, Object>> salesThistYearResult = chartService.salesThisYearResultListByCompanyAndDepartment(company, department);
		if (log.isInfoEnabled()) {log.info("return ::: salesThistYearResult");}
		if (log.isInfoEnabled()) {log.info("End AdminChartAjaxController.retrieveSalesThisYearResultByCompany");}
		return salesThistYearResult;
	}
	
	/***
	 * @기능 salesResultChart.jsp 페이지에서 매출실적 해당년도 차트 조회 (기본값: 올해, 검색시: 해당년도)
	 * @param company 회사 (IYCNC, IBTS, IYS)
	 * @param department 부서 (ITO, CONVERSION, IDC)
	 * @return salesYearResult 매출실적 해당년도 차트
	 */
	@GetMapping("/admin/salesYearResultByCompanyAndDepartmentAndYear.ajax/company/{company}/department/{department}/year/{year}")
	public List<Map<String, Object>> retrieveSalesYearResultByCompanyAndDepartmentAndYear(@PathVariable String company, @PathVariable String department, @PathVariable String year) {
		if (log.isInfoEnabled()) {log.info("Start AdminChartAjaxController.retrieveSalesYearResultByCompanyAndDepartmentAndYear");}
		if (log.isInfoEnabled()) {log.info("param ::: company ::: " + company);}
		if (log.isInfoEnabled()) {log.info("param ::: department ::: " + department);}
		if (log.isInfoEnabled()) {log.info("do service ::: chartService.salesYearResultByCompanyAndDepartmentAndYear");}
		List<Map<String, Object>> salesYearResult = chartService.salesResultListByCompanyAndDepartmentAndYear(company, department, year);
		if (log.isInfoEnabled()) {log.info("return ::: salesYearResult");}
		if (log.isInfoEnabled()) {log.info("End AdminChartAjaxController.retrieveSalesYearResultByCompanyAndDepartmentAndYear");}
		return salesYearResult;
	}
}
