package com.iyf.salesledger.controller.page.iycnc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iyf.salesledger.service.SalesCostStatusService;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class IYCNCITOPageController {
	
	@Autowired
	private SalesCostStatusService salesCostStatusService;

	/***
	 * @기능 iycnc/ito/empLedgerList.jsp 인력기초원장 목록페이지
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/ito/empLedgerList")
	public String showEmpLedgerListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCITOPageController.showEmpLedgerListPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/ito/empLedgerList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCITOPageController.showEmpLedgerListPage");}
		return "iycnc/ito/empLedgerList";
	}

	/***
	 * @기능 iycnc/ito/empLedgerRegister.jsp 인력기초원장 등록팝업페이지 (투입예정버튼 클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/ito/empLedgerRegister")
	public String showEmpLedgerRegisterPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCITOPageController.showEmpLedgerRegisterPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/ito/empLedgerRegister");}
		if (log.isInfoEnabled()) {log.info("End IYCNCITOPageController.showEmpLedgerRegisterPage");}
		return "iycnc/ito/empLedgerRegister";
	}

	/***
	 * @기능 iycnc/ito/empLedgerDetail.jsp 인력기초원장 상세팝업페이지 (행데이터 더블클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/ito/empLedgerDetail")
	public String showEmpLedgerDetailPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCITOPageController.showEmpLedgerDetailPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/ito/empLedgerDetail");}
		if (log.isInfoEnabled()) {log.info("End IYCNCITOPageController.showEmpLedgerDetailPage");}
		return "iycnc/ito/empLedgerDetail";
	}

	/***
	 * @기능 iycnc/ito/salesLedgerList.jsp 매출원장 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/ito/salesLedgerList")
	public String showSalesledgerListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCITOPageController.showSalesledgerListPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/ito/salesLedgerList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCITOPageController.showSalesledgerListPage");}
		return "iycnc/ito/salesLedgerList";
	}
	
	/***
	 * @기능 iycnc/ito/salesLedgerDetail.jsp 매출원장 상세팝업페이지 (행데이터 더블클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/ito/salesLedgerDetail")
	public String showSalesledgerDetailPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCITOPageController.showSalesledgerDetailPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/ito/salesLedgerDetail");}
		if (log.isInfoEnabled()) {log.info("End IYCNCITOPageController.showSalesledgerDetailPage");}
		return "iycnc/ito/salesLedgerDetail";
	}
	
	/***
	 * @기능 iycnc/ito/salesResultList.jsp 매출실적 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/ito/salesResultList")
	public String showSalesResultListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCITOPageController.showSalesResultListPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/ito/salesResultList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCITOPageController.showSalesResultListPage");}
		return "iycnc/ito/salesResultList";
	}
	
	/***
	 * @기능 iycnc/ito/salesResultList.jsp 매출실적 수기데이터 등록팝업페이지 (수기데이터 등록버튼 클릭시) <br>
	 *     (수기 데이터: 매출원장에 없는 수기등록 데이터로 배치스케줄러에 의한 추가/삭제되지 않고 매출실적과 통계에 필요시 추가적으로 반영되기 위한 데이터)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/ito/salesResultRegister")
	public String showSalesResultRegisterPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCITOPageController.showSalesResultRegisterPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/ito/salesResultRegister");}
		if (log.isInfoEnabled()) {log.info("End IYCNCITOPageController.showSalesResultRegisterPage");}
		return "iycnc/ito/salesResultRegister";
	}
	
	/***
	 * @기능 iycnc/ito/salesResultDetail.jsp 매출실적 수기데이터 상세팝업페이지 (행데이터 더블클릭시) <br>
	 * 	   1. 매출원장을 원본으로 하는 매출실적은 직접 수정불가하며 <br>
	 * 	   2. 수기등록 데이터만 매출실적상세에서 직접 수정가능함
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/ito/salesResultDetail")
	public String showSalesResultDetailPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCITOPageController.showSalesResultDetailPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/ito/salesResultDetail");}
		if (log.isInfoEnabled()) {log.info("End IYCNCITOPageController.showSalesResultDetailPage");}
		return "iycnc/ito/salesResultDetail";
	}
	
	/***
	 * @기능 iycnc/ito/salesEstimationList.jsp 매출추정 목록페이지 (기본이 다음달 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/ito/salesEstimationList")
	public String showSalesEstimationListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCITOPageController.showSalesEstimationListPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/ito/salesEstimationList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCITOPageController.showSalesEstimationListPage");}
		return "iycnc/ito/salesEstimationList";
	}
	
    /***
	 * @기능 iycnc/ito/salesCostStatusList.jsp 매출원가현황 목록페이지
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/ito/salesCostStatusList")
	public String salesCostStatusListPage(ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCITOPageController.salesCostStatusListpPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/ito/salesCostStatusList");}
		if (log.isInfoEnabled()) {log.info("End IYCNCITOPageController.salesCostStatusListpPage");}
		return "iycnc/ito/salesCostStatusList";
	}

    /***
	 * @기능 iycnc/ito/salesCostStatusDetail.jsp 매출원가현황 목록페이지
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')")
	@GetMapping("/iycnc/ito/salesCostStatusDetail")
	public String salesCostStatusDetailPage(@RequestParam long emp_id, ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start IYCNCITOPageController.salesCostStatusDetailPage");}
		modelMap.addAttribute("company", "IYCNC");
		modelMap.addAttribute("company_lower", "iycnc");
		modelMap.addAttribute("department", "ITO");
		modelMap.addAttribute("department_lower", "ito");
		modelMap.addAttribute("department_kr", "ITO");
		
		Map<String, Object> requestMap = new HashMap<>();
		requestMap.put("emp_id", emp_id);
		Map<String, Object> salesCostStatus = salesCostStatusService.getSalesCostStatus(requestMap);
		modelMap.addAttribute("salesCostStatus", salesCostStatus);
		
		if (log.isInfoEnabled()) {log.info("modelMap ::: " + modelMap);}
		if (log.isInfoEnabled()) {log.info("page ::: " + "iycnc/ito/salesCostStatusDetail");}
		if (log.isInfoEnabled()) {log.info("End IYCNCITOPageController.salesCostStatusDetailPage");}
		return "iycnc/ito/salesCostStatusDetail";
	}
}
