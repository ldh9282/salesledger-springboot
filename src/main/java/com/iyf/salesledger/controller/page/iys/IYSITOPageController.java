package com.iyf.salesledger.controller.page.iys;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class IYSITOPageController {

	/***
	 * @기능 iys/ito/empLedgerList.jsp 인력기초원장 목록페이지
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/empLedgerList")
	public String showEmpLedgerListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYSITOPageController.showEmpLedgerListPage");}
		modelMap.addAttribute("company", "IYS");
		modelMap.addAttribute("company_lower", "iys");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iys/ito/empLedgerList");}
		if (log.isInfoEnabled()) {log.info("End IYSITOPageController.showEmpLedgerListPage");}
		return "iys/ito/empLedgerList";
	}

	/***
	 * @기능 iys/ito/empLedgerRegister.jsp 인력기초원장 등록팝업페이지 (투입예정버튼 클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/empLedgerRegister")
	public String showEmpLedgerRegisterPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYSITOPageController.showEmpLedgerRegisterPage");}
		modelMap.addAttribute("company", "IYS");
		modelMap.addAttribute("company_lower", "iys");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iys/ito/empLedgerRegister");}
		if (log.isInfoEnabled()) {log.info("End IYSITOPageController.showEmpLedgerRegisterPage");}
		return "iys/ito/empLedgerRegister";
	}

	/***
	 * @기능 iys/ito/salesLedgerDetail.jsp 인력기초원장 상세팝업페이지 (행데이터 더블클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/empLedgerDetail")
	public String showEmpLedgerDetailPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYSITOPageController.showEmpLedgerDetailPage");}
		modelMap.addAttribute("company", "IYS");
		modelMap.addAttribute("company_lower", "iys");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iys/ito/empLedgerDetail");}
		if (log.isInfoEnabled()) {log.info("End IYSITOPageController.showEmpLedgerDetailPage");}
		return "iys/ito/empLedgerDetail";
	}

	/***
	 * @기능 iys/ito/salesLedgerList.jsp 매출원장 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/salesLedgerList")
	public String showSalesledgerListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYSITOPageController.showSalesledgerListPage");}
		modelMap.addAttribute("company", "IYS");
		modelMap.addAttribute("company_lower", "iys");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iys/ito/salesLedgerList");}
		if (log.isInfoEnabled()) {log.info("End IYSITOPageController.showSalesledgerListPage");}
		return "iys/ito/salesLedgerList";
	}
	
	/***
	 * @기능 iys/ito/salesLedgerDetail.jsp 매출원장 상세팝업페이지 (행데이터 더블클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/salesLedgerDetail")
	public String showSalesledgerDetailPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYSITOPageController.showSalesledgerDetailPage");}
		modelMap.addAttribute("company", "IYS");
		modelMap.addAttribute("company_lower", "iys");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iys/ito/salesLedgerDetail");}
		if (log.isInfoEnabled()) {log.info("End IYSITOPageController.showSalesledgerDetailPage");}
		return "iys/ito/salesLedgerDetail";
	}
	
	/***
	 * @기능 iys/ito/salesResultList.jsp 매출실적 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/salesResultList")
	public String showSalesResultListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYSITOPageController.showSalesResultListPage");}
		modelMap.addAttribute("company", "IYS");
		modelMap.addAttribute("company_lower", "iys");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iys/ito/salesResultList");}
		if (log.isInfoEnabled()) {log.info("End IYSITOPageController.showSalesResultListPage");}
		return "iys/ito/salesResultList";
	}
	
	/***
	 * @기능 iys/ito/salesResultRegister.jsp 매출실적 수기데이터 등록팝업페이지 (수기데이터 등록버튼 클릭시) <br>
	 *     (수기 데이터: 매출원장에 없는 수기등록 데이터로 배치스케줄러에 의한 추가/삭제되지 않고 매출실적과 통계에 필요시 추가적으로 반영되기 위한 데이터)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/salesResultRegister")
	public String showSalesResultRegisterPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYSITOPageController.showSalesResultRegisterPage");}
		modelMap.addAttribute("company", "IYS");
		modelMap.addAttribute("company_lower", "iys");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iys/ito/salesResultRegister");}
		if (log.isInfoEnabled()) {log.info("End IYSITOPageController.showSalesResultRegisterPage");}
		return "iys/ito/salesResultRegister";
	}
	
	/***
	 * @기능 iys/ito/salesResultDetail.jsp 매출실적 수기데이터 상세팝업페이지 (행데이터 더블클릭시) <br>
	 * 	   1. 매출원장을 원본으로 하는 매출실적은 직접 수정불가하며 <br>
	 * 	   2. 수기등록 데이터만 매출실적상세에서 직접 수정가능함
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/salesResultDetail")
	public String showSalesResultDetailPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYSITOPageController.showSalesResultDetailPage");}
		modelMap.addAttribute("company", "IYS");
		modelMap.addAttribute("company_lower", "iys");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iys/ito/salesResultDetail");}
		if (log.isInfoEnabled()) {log.info("End IYSITOPageController.showSalesResultDetailPage");}
		return "iys/ito/salesResultDetail";
	}
	
	/***
	 * @기능 iys/ito/salesEstimationList.jsp 매출추정 목록페이지 (기본이 다음달 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/salesEstimationList")
	public String showSalesEstimationListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYSITOPageController.showSalesEstimationListPage");}
		modelMap.addAttribute("company", "IYS");
		modelMap.addAttribute("company_lower", "iys");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iys/ito/salesEstimationList");}
		if (log.isInfoEnabled()) {log.info("End IYSITOPageController.showSalesEstimationListPage");}
		return "iys/ito/salesEstimationList";
	}

}
