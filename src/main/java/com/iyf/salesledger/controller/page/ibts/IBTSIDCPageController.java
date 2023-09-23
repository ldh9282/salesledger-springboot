package com.iyf.salesledger.controller.page.ibts;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IBTSIDCPageController {

	/***
	 * @기능 ibts/idc/empLedgerList.jsp 인력기초원장 목록페이지
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/idc/empLedgerList")
	public String showEmpListPage() {
		return "ibts/idc/empLedgerList";
	}

	/***
	 * @기능 ibts/idc/empLedgerRegister.jsp 인력기초원장 등록팝업페이지 (투입예정버튼 클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/idc/empLedgerRegister")
	public String showEmpLedgerRegisterPage() {
		return "ibts/idc/empLedgerRegister";
	}

	/***
	 * @기능 ibts/idc/empLedgerDetail.jsp 인력기초원장 상세팝업페이지 (행데이터 더블클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/idc/empLedgerDetail")
	public String showEmpLedgerDetailPage() {
		return "ibts/idc/empLedgerDetail";
	}

	/***
	 * @기능 ibts/idc/salesLedgerList.jsp 매출원장 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/idc/salesLedgerList")
	public String showSalesledgerListPage() {
		return "ibts/idc/salesLedgerList";
	}
	
	/***
	 * @기능 ibts/idc/salesLedgerDetail.jsp 매출원장 상세팝업페이지 (행데이터 더블클릭시)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/idc/salesLedgerDetail")
	public String showSalesledgerDetailPage() {
		return "ibts/idc/salesLedgerDetail";
	}
	
	/***
	 * @기능 ibts/idc/salesResultList.jsp 매출실적 목록페이지 (기본이 금월 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/idc/salesResultList")
	public String showSalesResultListPage() {
		return "ibts/idc/salesResultList";
	}
	
	/***
	 * @기능 ibts/idc/salesResultRegister.jsp 매출실적 수기데이터 등록팝업페이지 (수기데이터 등록버튼 클릭시) <br>
	 *     (수기 데이터: 매출원장에 없는 수기등록 데이터로 배치스케줄러에 의한 추가/삭제되지 않고 매출실적과 통계에 필요시 추가적으로 반영되기 위한 데이터)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/idc/salesResultRegister")
	public String showSalesResultRegisterPage() {
		return "ibts/idc/salesResultRegister";
	}
	
	/***
	 * @기능 ibts/idc/salesResultDetail.jsp 매출실적 수기데이터 상세팝업페이지 (행데이터 더블클릭시) <br>
	 * 	   1. 매출원장을 원본으로 하는 매출실적은 직접 수정불가하며 <br>
	 * 	   2. 수기등록 데이터만 매출실적상세에서 직접 수정가능함
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/idc/salesResultDetail")
	public String showSalesResultDetailPage() {
		return "ibts/idc/salesResultDetail";
	}
	
	/***
	 * @기능 ibts/idc/salesEstimationList.jsp 매출추정 목록페이지 (기본이 다음달 데이터조회, 검색으로 해당년월 데이터조회가능)
	 */
	@PreAuthorize("hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')")
	@GetMapping("/ibts/idc/salesEstimationList")
	public String showSalesEstimationListPage() {
		return "ibts/idc/salesEstimationList";
	}

}
