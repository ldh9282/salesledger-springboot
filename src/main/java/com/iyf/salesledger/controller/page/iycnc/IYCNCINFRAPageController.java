package com.iyf.salesledger.controller.page.iycnc;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class IYCNCINFRAPageController {

	/***
	 * @기능 iycnc/infra/{category}/salesResultInfraList.jsp 매출실적 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 * @카테고리 maintenance, merchandise, support
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/infra/{category}/salesResultInfraList")
	public String showSalesResultListPage(@PathVariable String category) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCINFRAPageController.showSalesResultListPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/infra/" + category + "/salesResultInfraList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCINFRAPageController.showSalesResultListPage");}
		return "iycnc/infra/" + category + "/salesResultInfraList";
	}
	
	/***
	 * @기능 iycnc/infra/{category}/salesResultInfraRegister.jsp 매출실적 수기데이터 등록팝업페이지 (수기데이터 등록버튼 클릭시) <br>
	 *     (수기 데이터: 인프라는 매출원장이 따로 없으며 배치스케줄러가 실행되지 않고, 수기데이터만 등록함)
	 * @카테고리 maintenance, merchandise, support
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/infra/{category}/salesResultInfraRegister")
	public String showSalesResultRegisterPage(@PathVariable String category) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCINFRAPageController.showSalesResultRegisterPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/infra/" + category + "/salesResultInfraRegister");}
		if (log.isInfoEnabled()) {log.info("End IYCNCINFRAPageController.showSalesResultRegisterPage");}
		return "iycnc/infra/" + category + "/salesResultInfraRegister";
	}
	
	/***
	 * @기능 iycnc/infra/{category}/salesResultInfraDetail.jsp 매출실적 수기데이터 상세팝업페이지 (행데이터 더블클릭시) <br>
	 *     (수기 데이터: 인프라는 매출원장이 따로 없으며 배치스케줄러가 실행되지 않고, 수기데이터만 등록함)
	 * @카테고리 maintenance, merchandise, support
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/infra/{category}/salesResultInfraDetail")
	public String showSalesResultDetailPage(@PathVariable String category) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCINFRAPageController.showSalesResultDetailPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/infra/" + category + "/salesResultInfraDetail");}
		if (log.isInfoEnabled()) {log.info("End IYCNCINFRAPageController.showSalesResultDetailPage");}
		return "iycnc/infra/" + category + "/salesResultInfraDetail";
	}
	
	/***
	 * @기능 iycnc/infra/{category}/salesEstimationInfraList.jsp 매출추정 목록페이지 (기본이 다음달 데이터조회, 검색으로 해당년월 데이터조회가능)
	 * @카테고리 maintenance, merchandise, support
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/infra/{category}/salesEstimationInfraList")
	public String showSalesEstimationListPage(@PathVariable String category) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCINFRAPageController.showSalesEstimationListPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/infra/" + category + "/salesEstimationInfraList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCINFRAPageController.showSalesEstimationListPage");}
		return "iycnc/infra/" + category + "/salesEstimationInfraList";
	}
	
	/***
	 * @기능 iycnc/infra/{category}/salesEstimationInfraRegister.jsp 매출추정 수기데이터 등록팝업페이지 (수기데이터 등록버튼 클릭시) <br>
	 *     (수기 데이터: 인프라는 매출원장이 따로 없으며 배치스케줄러가 실행되지 않고, 수기데이터만 등록함)
	 * @카테고리 maintenance, merchandise, support
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/infra/{category}/salesEstimationInfraRegister")
	public String showSalesEstimationRegisterPage(@PathVariable String category) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCINFRAPageController.showSalesEstimationRegisterPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/infra/" + category + "/salesEstimationInfraRegister");}
		if (log.isInfoEnabled()) {log.info("End IYCNCINFRAPageController.showSalesEstimationRegisterPage");}
		return "iycnc/infra/" + category + "/salesEstimationInfraRegister";
	}
	
	/***
	 * @기능 iycnc/infra/{category}/salesEstimationInfraDetail.jsp 매출추정 수기데이터 상세팝업페이지 (행데이터 더블클릭시) <br>
	 *     (수기 데이터: 인프라는 매출원장이 따로 없으며 배치스케줄러가 실행되지 않고, 수기데이터만 등록함)
	 * @카테고리 maintenance, merchandise, support
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/infra/{category}/salesEstimationInfraDetail")
	public String showSalesEstimationDetailPage(@PathVariable String category) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCINFRAPageController.showSalesEstimationDetailPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/infra/" + category + "/salesEstimationInfraDetail");}
		if (log.isInfoEnabled()) {log.info("End IYCNCINFRAPageController.showSalesEstimationDetailPage");}
		return "iycnc/infra/" + category + "/salesEstimationInfraDetail";
	}
	

}
