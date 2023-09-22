package com.iyf.salesledger.controller.page.iys;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IYSITOPageController {

	// IYS ITO empLedgerList.jsp 인력기초원장 목록페이지 (메인페이지)
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/empLedgerList")
	public String showEmpListPage() {
		return "iys/ito/empLedgerList";
	}

	// IYS ITO empLedgerRegister.jsp 인력기초원장 등록페이지 (팝업페이지; 이름과 전화번호로로 인력풀에서 인력조회, 등록이 곧 투입예정)
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/empLedgerRegister")
	public String showEmpLedgerRegisterPage() {
		return "iys/ito/empLedgerRegister";
	}

	// IYS ITO empLedgerDetail.jsp 인력기초원장 상세페이지 (팝업페이지; 수정, 투입확정, 드랍, 삭제, 강제삭제)
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/empLedgerDetail")
	public String showEmpLedgerDetailPage() {
		return "iys/ito/empLedgerDetail";
	}

	// IYS ITO salesLedgerList.jsp 매출원장 목록페이지 (메인페이지; 투입확정시 데이터 자동추가; 해당월 반영여부)
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/salesLedgerList")
	public String showSalesledgerListPage() {
		return "iys/ito/salesLedgerList";
	}
	
	// IYS ITO salesLedgerDetail.jsp 매출원장 상세페이지 (팝업페이지; 수정만 가능)
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/salesLedgerDetail")
	public String showSalesledgerDetailPage() {
		return "iys/ito/salesLedgerDetail";
	}
	
	// IYS ITO salesResultList.jsp 매출실적 목록페이지 (메인페이지)
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/salesResultList")
	public String showSalesResultListPage() {
		return "iys/ito/salesResultList";
	}
	
	// IYS ITO salesResultList.jsp 매출실적 수기데이터 등록페이지 (수기 데이터는 매출원장에도 없으며 배치에 의해 추가/삭제 반영되지 않고 실적과 차트에만 반영되기 위한 데이터)
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/salesResultRegister")
	public String showSalesResultRegisterPage() {
		return "iys/ito/salesResultRegister";
	}
	
	// IYS ITO salesResultDetail.jsp 매출실적 수기데이터 상세페이지 (팝업페이지; 수기 데이터만 상세페이지에서 수정 및 삭제할 수 있음)
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/salesResultDetail")
	public String showSalesResultDetailPage() {
		return "iys/ito/salesResultDetail";
	}
	
	// IYS ITO salesEstimationList.jsp 매출추정 목록페이지 (메인페이지)
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')")
	@GetMapping("/iys/ito/salesEstimationList")
	public String showSalesEstimationListPage() {
		return "iys/ito/salesEstimationList";
	}

}
