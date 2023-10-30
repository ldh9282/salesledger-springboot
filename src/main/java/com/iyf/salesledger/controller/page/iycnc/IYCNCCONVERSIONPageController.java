package com.iyf.salesledger.controller.page.iycnc;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class IYCNCCONVERSIONPageController {

	/***
	 * @기능 iycnc/conversion/empLedgerList.jsp 인력기초원장 목록페이지
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/conversion/empLedgerList")
	public String showEmpLedgerListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCCONVERSIONPageController.showEmpLedgerListPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "CONVERSION");
		modelMap.addAttribute("department_lower", "conversion");
		modelMap.addAttribute("department_kr", "컨버전스");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/conversion/empLedgerList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCCONVERSIONPageController.showEmpLedgerListPage");}
		return "iycnc/conversion/empLedgerList";
	}

	/***
	 * @기능 iycnc/conversion/empLedgerRegister.jsp 인력기초원장 등록팝업페이지 (투입예정버튼 클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/conversion/empLedgerRegister")
	public String showEmpLedgerRegisterPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCCONVERSIONPageController.showEmpLedgerRegisterPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "CONVERSION");
		modelMap.addAttribute("department_lower", "conversion");
		modelMap.addAttribute("department_kr", "컨버전스");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/conversion/empLedgerRegister");}
		if (log.isInfoEnabled()) {log.info("End IYCNCCONVERSIONPageController.showEmpLedgerRegisterPage");}
		return "iycnc/conversion/empLedgerRegister";
	}

	/***
	 * @기능 iycnc/conversion/empLedgerDetail.jsp 인력기초원장 상세팝업페이지 (행데이터 더블클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/conversion/empLedgerDetail")
	public String showEmpLedgerDetailPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCCONVERSIONPageController.showEmpLedgerDetailPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("department", "CONVERSION");
		modelMap.addAttribute("department_kr", "컨버전스");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/conversion/empLedgerDetail");}
		if (log.isInfoEnabled()) {log.info("End IYCNCCONVERSIONPageController.showEmpLedgerDetailPage");}
		return "iycnc/conversion/empLedgerDetail";
	}

	/***
	 * @기능 iycnc/conversion/salesLedgerList.jsp 매출원장 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/conversion/salesLedgerList")
	public String showSalesledgerListPage() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCCONVERSIONPageController.showSalesledgerListPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/conversion/salesLedgerList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCCONVERSIONPageController.showSalesledgerListPage");}
		return "iycnc/conversion/salesLedgerList";
	}
	
	/***
	 * @기능 iycnc/conversion/salesLedgerDetail.jsp 매출원장 상세팝업페이지 (행데이터 더블클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/conversion/salesLedgerDetail")
	public String showSalesledgerDetailPage() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCCONVERSIONPageController.showSalesledgerDetailPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/conversion/salesLedgerDetail");}
		if (log.isInfoEnabled()) {log.info("End IYCNCCONVERSIONPageController.showSalesledgerDetailPage");}
		return "iycnc/conversion/salesLedgerDetail";
	}
	
	/***
	 * @기능 iycnc/conversion/salesResultList.jsp 매출실적 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/conversion/salesResultList")
	public String showSalesResultListPage() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCCONVERSIONPageController.showSalesResultListPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/conversion/salesResultList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCCONVERSIONPageController.showSalesResultListPage");}
		return "iycnc/conversion/salesResultList";
	}
	
	/***
	 * @기능 iycnc/conversion/salesResultList.jsp 매출실적 수기데이터 등록팝업페이지 (수기데이터 등록버튼 클릭시) <br>
	 *     (수기 데이터: 매출원장에 없는 수기등록 데이터로 배치스케줄러에 의한 추가/삭제되지 않고 매출실적과 통계에 필요시 추가적으로 반영되기 위한 데이터)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/conversion/salesResultRegister")
	public String showSalesResultRegisterPage() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCCONVERSIONPageController.showSalesResultRegisterPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/conversion/salesResultRegister");}
		if (log.isInfoEnabled()) {log.info("End IYCNCCONVERSIONPageController.showSalesResultRegisterPage");}
		return "iycnc/conversion/salesResultRegister";
	}
	
	/***
	 * @기능 iycnc/conversion/salesResultDetail.jsp 매출실적 수기데이터 상세팝업페이지 (행데이터 더블클릭시) <br>
	 * 	   1. 매출원장을 원본으로 하는 매출실적은 직접 수정불가하며 <br>
	 * 	   2. 수기등록 데이터만 매출실적상세에서 직접 수정가능함
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/conversion/salesResultDetail")
	public String showSalesResultDetailPage() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCCONVERSIONPageController.showSalesResultDetailPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/conversion/salesResultDetail");}
		if (log.isInfoEnabled()) {log.info("End IYCNCCONVERSIONPageController.showSalesResultDetailPage");}
		return "iycnc/conversion/salesResultDetail";
	}
	
	/***
	 * @기능 iycnc/conversion/salesEstimationList.jsp 매출추정 목록페이지 (기본이 다음달 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/conversion/salesEstimationList")
	public String showSalesEstimationListPage() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCCONVERSIONPageController.showSalesEstimationListPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/conversion/salesEstimationList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCCONVERSIONPageController.showSalesEstimationListPage");}
		return "iycnc/conversion/salesEstimationList";
	}

}
