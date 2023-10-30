package com.iyf.salesledger.controller.page.iycnc;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class IYCNCIDCPageController {

	/***
	 * @기능 iycnc/idc/empLedgerList.jsp 인력기초원장 목록페이지
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/idc/empLedgerList")
	public String showEmpLedgerListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCIDCPageController.showEmpLedgerListPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "IDC");
		modelMap.addAttribute("department_lower", "idc");
		modelMap.addAttribute("department_kr", "IDC");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/idc/empLedgerList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCIDCPageController.showEmpLedgerListPage");}
		return "iycnc/idc/empLedgerList";
	}

	/***
	 * @기능 iycnc/idc/empLedgerRegister.jsp 인력기초원장 등록팝업페이지 (투입예정버튼 클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/idc/empLedgerRegister")
	public String showEmpLedgerRegisterPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCIDCPageController.showEmpLedgerRegisterPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "IDC");
		modelMap.addAttribute("department_lower", "idc");
		modelMap.addAttribute("department_kr", "IDC");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/idc/empLedgerRegister");}
		if (log.isInfoEnabled()) {log.info("End IYCNCIDCPageController.showEmpLedgerRegisterPage");}
		return "iycnc/idc/empLedgerRegister";
	}

	/***
	 * @기능 iycnc/idc/empLedgerDetail.jsp 인력기초원장 상세팝업페이지 (행데이터 더블클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/idc/empLedgerDetail")
	public String showEmpLedgerDetailPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCIDCPageController.showEmpLedgerDetailPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("department", "IDC");
		modelMap.addAttribute("department_kr", "IDC");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/idc/empLedgerDetail");}
		if (log.isInfoEnabled()) {log.info("End IYCNCIDCPageController.showEmpLedgerDetailPage");}
		return "iycnc/idc/empLedgerDetail";
	}

	/***
	 * @기능 iycnc/idc/salesLedgerList.jsp 매출원장 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/idc/salesLedgerList")
	public String showSalesledgerListPage() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCIDCPageController.showSalesledgerListPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/idc/salesLedgerList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCIDCPageController.showSalesledgerListPage");}
		return "iycnc/idc/salesLedgerList";
	}
	
	/***
	 * @기능 iycnc/idc/salesLedgerDetail.jsp 매출원장 상세팝업페이지 (행데이터 더블클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/idc/salesLedgerDetail")
	public String showSalesledgerDetailPage() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCIDCPageController.showSalesledgerDetailPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/idc/salesLedgerDetail");}
		if (log.isInfoEnabled()) {log.info("End IYCNCIDCPageController.showSalesledgerDetailPage");}
		return "iycnc/idc/salesLedgerDetail";
	}
	
	/***
	 * @기능 iycnc/idc/salesResultList.jsp 매출실적 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/idc/salesResultList")
	public String showSalesResultListPage() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCIDCPageController.showSalesResultListPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/idc/salesResultList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCIDCPageController.showSalesResultListPage");}
		return "iycnc/idc/salesResultList";
	}
	
	/***
	 * @기능 iycnc/idc/salesResultRegister.jsp 매출실적 수기데이터 등록팝업페이지 (수기데이터 등록버튼 클릭시) <br>
	 *     (수기 데이터: 매출원장에 없는 수기등록 데이터로 배치스케줄러에 의한 추가/삭제되지 않고 매출실적과 통계에 필요시 추가적으로 반영되기 위한 데이터)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/idc/salesResultRegister")
	public String showSalesResultRegisterPage() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCIDCPageController.showSalesResultRegisterPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/idc/salesResultRegister");}
		if (log.isInfoEnabled()) {log.info("End IYCNCIDCPageController.showSalesResultRegisterPage");}
		return "iycnc/idc/salesResultRegister";
	}
	
	/***
	 * @기능 iycnc/idc/salesResultDetail.jsp 매출실적 수기데이터 상세팝업페이지 (행데이터 더블클릭시) <br>
	 * 	   1. 매출원장을 원본으로 하는 매출실적은 직접 수정불가하며 <br>
	 * 	   2. 수기등록 데이터만 매출실적상세에서 직접 수정가능함
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/idc/salesResultDetail")
	public String showSalesResultDetailPage() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCIDCPageController.showSalesResultDetailPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/idc/salesResultDetail");}
		if (log.isInfoEnabled()) {log.info("End IYCNCIDCPageController.showSalesResultDetailPage");}
		return "iycnc/idc/salesResultDetail";
	}
	
	/***
	 * @기능 iycnc/idc/salesEstimationList.jsp 매출추정 목록페이지 (기본이 다음달 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/idc/salesEstimationList")
	public String showSalesEstimationListPage() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCIDCPageController.showSalesEstimationListPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/idc/salesEstimationList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCIDCPageController.showSalesEstimationListPage");}
		return "iycnc/idc/salesEstimationList";
	}

}
