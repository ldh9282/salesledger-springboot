package com.iyf.salesledger.controller.page.iycnc;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class IYCNCINFRAPageController {

	// IYCNC INFRA CATEGORY salesResultList.jsp 매출실적 목록페이지 (메인페이지)
	// CATEGORY : maintenance, merchandise, support
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/infra/{category}/salesResultInfraList")
	public String showSalesResultListPage(@PathVariable String category) {
		return "iycnc/infra/" + category + "/salesResultInfraList";
	}
	
	// IYCNC INFRA CATEGORY salesResultList.jsp 매출실적 수기데이터 등록페이지 (수기 데이터는 매출원장에도 없으며 배치에 의해 추가/삭제 반영되지 않고 실적과 차트에만 반영되기 위한 데이터)
	// CATEGORY : maintenance, merchandise, support
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/infra/{category}/salesResultInfraRegister")
	public String showSalesResultRegisterPage(@PathVariable String category) {
		return "iycnc/infra/" + category + "/salesResultInfraRegister";
	}
	
	// IYCNC INFRA CATEGORY salesResultDetail.jsp 매출실적 수기데이터 상세페이지 (팝업페이지; 수기 데이터만 상세페이지에서 수정 및 삭제할 수 있음)
	// CATEGORY : maintenance, merchandise, support
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/infra/{category}/salesResultInfraDetail")
	public String showSalesResultDetailPage(@PathVariable String category) {
		return "iycnc/infra/" + category + "/salesResultInfraDetail";
	}
	
	// IYCNC INFRA CATEGORY salesEstimationList.jsp 매출실적 목록페이지 (메인페이지)
	// CATEGORY : maintenance, merchandise, support
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/infra/{category}/salesEstimationInfraList")
	public String showSalesEstimationListPage(@PathVariable String category) {
		return "iycnc/infra/" + category + "/salesEstimationInfraList";
	}
	
	// IYCNC INFRA CATEGORY salesEstimationList.jsp 매출실적 수기데이터 등록페이지 (수기 데이터는 매출원장에도 없으며 배치에 의해 추가/삭제 반영되지 않고 실적과 차트에만 반영되기 위한 데이터)
	// CATEGORY : maintenance, merchandise, support
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/infra/{category}/salesEstimationInfraRegister")
	public String showSalesEstimationRegisterPage(@PathVariable String category) {
		return "iycnc/infra/" + category + "/salesEstimationInfraRegister";
	}
	
	// IYCNC INFRA CATEGORY salesEstimationDetail.jsp 매출실적 수기데이터 상세페이지 (팝업페이지; 수기 데이터만 상세페이지에서 수정 및 삭제할 수 있음)
	// CATEGORY : maintenance, merchandise, support
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/infra/{category}/salesEstimationInfraDetail")
	public String showSalesEstimationDetailPage(@PathVariable String category) {
		return "iycnc/infra/" + category + "/salesEstimationInfraDetail";
	}
	

}
