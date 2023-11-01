package com.iyf.salesledger.controller.page.ibts;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class IBTSCONVERSIONPageController {

	/***
	 * @기능 ibts/conversion/empLedgerList.jsp 인력기초원장 목록페이지
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/conversion/empLedgerList")
	public String showEmpLedgerListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IBTSCONVERSIONPageController.showEmpLedgerListPage");}
		modelMap.addAttribute("company", "IBTS");
		modelMap.addAttribute("company_lower", "ibts");
		modelMap.addAttribute("department", "CONVERSION");
		modelMap.addAttribute("department_lower", "conversion");
		modelMap.addAttribute("department_kr", "컨버전스");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "ibts/conversion/empLedgerList");}
		if (log.isInfoEnabled()) {log.info("End IBTSCONVERSIONPageController.showEmpLedgerListPage");}
		return "ibts/conversion/empLedgerList";
	}

	/***
	 * @기능 ibts/conversion/empLedgerRegister.jsp 인력기초원장 등록팝업페이지 (투입예정버튼 클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/conversion/empLedgerRegister")
	public String showEmpLedgerRegisterPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IBTSCONVERSIONPageController.showEmpLedgerRegisterPage");}
		modelMap.addAttribute("company", "IBTS");
		modelMap.addAttribute("company_lower", "ibts");
		modelMap.addAttribute("department", "CONVERSION");
		modelMap.addAttribute("department_lower", "conversion");
		modelMap.addAttribute("department_kr", "컨버전스");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "ibts/conversion/empLedgerRegister");}
		if (log.isInfoEnabled()) {log.info("End IBTSCONVERSIONPageController.showEmpLedgerRegisterPage");}
		return "ibts/conversion/empLedgerRegister";
	}

	/***
	 * @기능 ibts/conversion/empLedgerDetail.jsp 인력기초원장 상세팝업페이지 (행데이터 더블클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/conversion/empLedgerDetail")
	public String showEmpLedgerDetailPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IBTSCONVERSIONPageController.showEmpLedgerDetailPage");}
		modelMap.addAttribute("company", "IBTS");
		modelMap.addAttribute("company_lower", "ibts");
		modelMap.addAttribute("department", "CONVERSION");
		modelMap.addAttribute("department_lower", "conversion");
		modelMap.addAttribute("department_kr", "컨버전스");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "ibts/conversion/empLedgerDetail");}
		if (log.isInfoEnabled()) {log.info("End IBTSCONVERSIONPageController.showEmpLedgerDetailPage");}
		return "ibts/conversion/empLedgerDetail";
	}

	/***
	 * @기능 ibts/conversion/salesLedgerList.jsp 매출원장 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/conversion/salesLedgerList")
	public String showSalesledgerListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IBTSCONVERSIONPageController.showSalesledgerListPage");}
		modelMap.addAttribute("company", "IBTS");
		modelMap.addAttribute("company_lower", "ibts");
		modelMap.addAttribute("department", "CONVERSION");
		modelMap.addAttribute("department_lower", "conversion");
		modelMap.addAttribute("department_kr", "컨버전스");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "ibts/conversion/salesLedgerList");}
		if (log.isInfoEnabled()) {log.info("End IBTSCONVERSIONPageController.showSalesledgerListPage");}
		return "ibts/conversion/salesLedgerList";
	}
	
	/***
	 * @기능 ibts/conversion/salesLedgerDetail.jsp 매출원장 상세팝업페이지 (행데이터 더블클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/conversion/salesLedgerDetail")
	public String showSalesledgerDetailPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IBTSCONVERSIONPageController.showSalesledgerDetailPage");}
		modelMap.addAttribute("company", "IBTS");
		modelMap.addAttribute("company_lower", "ibts");
		modelMap.addAttribute("department", "CONVERSION");
		modelMap.addAttribute("department_lower", "conversion");
		modelMap.addAttribute("department_kr", "컨버전스");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "ibts/conversion/salesLedgerDetail");}
		if (log.isInfoEnabled()) {log.info("End IBTSCONVERSIONPageController.showSalesledgerDetailPage");}
		return "ibts/conversion/salesLedgerDetail";
	}
	
	/***
	 * @기능 ibts/conversion/salesResultList.jsp 매출실적 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/conversion/salesResultList")
	public String showSalesResultListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IBTSCONVERSIONPageController.showSalesResultListPage");}
		modelMap.addAttribute("company", "IBTS");
		modelMap.addAttribute("company_lower", "ibts");
		modelMap.addAttribute("department", "CONVERSION");
		modelMap.addAttribute("department_lower", "conversion");
		modelMap.addAttribute("department_kr", "컨버전스");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "ibts/conversion/salesResultList");}
		if (log.isInfoEnabled()) {log.info("End IBTSCONVERSIONPageController.showSalesResultListPage");}
		return "ibts/conversion/salesResultList";
	}
	
	/***
	 * @기능 ibts/conversion/salesResultList.jsp 매출실적 수기데이터 등록팝업페이지 (수기데이터 등록버튼 클릭시) <br>
	 *     (수기 데이터: 매출원장에 없는 수기등록 데이터로 배치스케줄러에 의한 추가/삭제되지 않고 매출실적과 통계에 필요시 추가적으로 반영되기 위한 데이터)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/conversion/salesResultRegister")
	public String showSalesResultRegisterPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IBTSCONVERSIONPageController.showSalesResultRegisterPage");}
		modelMap.addAttribute("company", "IBTS");
		modelMap.addAttribute("company_lower", "ibts");
		modelMap.addAttribute("department", "CONVERSION");
		modelMap.addAttribute("department_lower", "conversion");
		modelMap.addAttribute("department_kr", "컨버전스");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "ibts/conversion/salesResultRegister");}
		if (log.isInfoEnabled()) {log.info("End IBTSCONVERSIONPageController.showSalesResultRegisterPage");}
		return "ibts/conversion/salesResultRegister";
	}
	
	/***
	 * @기능 ibts/conversion/salesResultDetail.jsp 매출실적 수기데이터 상세팝업페이지 (행데이터 더블클릭시) <br>
	 * 	   1. 매출원장을 원본으로 하는 매출실적은 직접 수정불가하며 <br>
	 * 	   2. 수기등록 데이터만 매출실적상세에서 직접 수정가능함
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/conversion/salesResultDetail")
	public String showSalesResultDetailPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IBTSCONVERSIONPageController.showSalesResultDetailPage");}
		modelMap.addAttribute("company", "IBTS");
		modelMap.addAttribute("company_lower", "ibts");
		modelMap.addAttribute("department", "CONVERSION");
		modelMap.addAttribute("department_lower", "conversion");
		modelMap.addAttribute("department_kr", "컨버전스");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "ibts/conversion/salesResultDetail");}
		if (log.isInfoEnabled()) {log.info("End IBTSCONVERSIONPageController.showSalesResultDetailPage");}
		return "ibts/conversion/salesResultDetail";
	}
	
	/***
	 * @기능 ibts/conversion/salesEstimationList.jsp 매출추정 목록페이지 (기본이 다음달 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/conversion/salesEstimationList")
	public String showSalesEstimationListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IBTSCONVERSIONPageController.showSalesEstimationListPage");}
		modelMap.addAttribute("company", "IBTS");
		modelMap.addAttribute("company_lower", "ibts");
		modelMap.addAttribute("department", "CONVERSION");
		modelMap.addAttribute("department_lower", "conversion");
		modelMap.addAttribute("department_kr", "컨버전스");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "ibts/conversion/salesEstimationList");}
		if (log.isInfoEnabled()) {log.info("End IBTSCONVERSIONPageController.showSalesEstimationListPage");}
		return "ibts/conversion/salesEstimationList";
	}

}
