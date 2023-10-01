package com.iyf.salesledger.controller.page.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.iyf.salesledger.common.paging.PagingCreatorDTO;
import com.iyf.salesledger.common.paging.PagingDTO;
import com.iyf.salesledger.common.security.Member;
import com.iyf.salesledger.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class AdminPageController {
	
	@Autowired
	private MemberService memberService;
	
	/***
	 * @기능 memberList.jsp 페이지 호출
	 */
	@PreAuthorize("hasAuthority('통합 관리자')")
	@GetMapping("/admin/memberList")
	public String showMemberListPage(PagingDTO pagingDTO, Model model) {
		if (log.isInfoEnabled()) {log.info("Start AdminPageController.showMemberListPage");}
		if (log.isInfoEnabled()) {log.info("param ::: pagingDTO ::: " + pagingDTO);}
		if (log.isInfoEnabled()) {log.info("do service ::: memberService.selectMemberListPagingByKeyword");}
		List<Member> memberList = memberService.selectMemberListPagingByKeyword(pagingDTO);
		if (log.isInfoEnabled()) {log.info("do service ::: memberService.selectTotalCount");}
		long count = memberService.selectTotalCount(pagingDTO);
		if (log.isInfoEnabled()) {log.info("build PagingCreatorDTO ::: field ::: rowAmountTotal ::: " + count);}
		if (log.isInfoEnabled()) {log.info("build PagingCreatorDTO ::: field ::: pagingDTO ::: " + pagingDTO);}
		PagingCreatorDTO pagingCreatorDTO = new PagingCreatorDTO(count, pagingDTO);
		if (log.isInfoEnabled()) {log.info("build PagingCreatorDTO ::: instance ::: " + pagingCreatorDTO);}
		if (log.isInfoEnabled()) {log.info("model ::: memberList");}
		if (log.isInfoEnabled()) {log.info("model ::: pagingCreator");}
		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingCreator", pagingCreatorDTO);
		if (log.isInfoEnabled()) {log.info("page ::: " + "admin/memberList");}
		if (log.isInfoEnabled()) {log.info("End AdminPageController.showMemberListPage");}
		return "admin/memberList";
	}
	
	/***
	 * @기능 memberDetail.jsp 페이지 호출
	 */
	@PreAuthorize("hasAuthority('통합 관리자')")
	@GetMapping("/admin/memberDetail")
	public String showMemberDetailPage(String username, Model model) {
		if (log.isInfoEnabled()) {log.info("Start AdminPageController.showMemberDetailPage");}
		if (log.isInfoEnabled()) {log.info("param ::: username ::: " + username);}
		if (log.isInfoEnabled()) {log.info("do service ::: memberService.selectOne");}
		Member member = memberService.selectOne(username);
		if (log.isInfoEnabled()) {log.info("model ::: member ::: " + member);}
		model.addAttribute("member", member);
		if (log.isInfoEnabled()) {log.info("page ::: " + "admin/memberDetail");}
		if (log.isInfoEnabled()) {log.info("End AdminPageController.showMemberDetailPage");}
		return "admin/memberDetail";
	}
	
	/***
	 * @기능 salesResultChart.jsp 페이지 호출
	 */
	@PreAuthorize("hasAuthority('통합 관리자')")
	@GetMapping("/admin/salesResultChart")
	public String showSalesResultChartPage() {
		if (log.isInfoEnabled()) {log.info("Start AdminPageController.showSalesResultChartPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "admin/salesResultChart");}
		if (log.isInfoEnabled()) {log.info("End AdminPageController.showSalesResultChartPage");}
		return "admin/salesResultChart";
	}
}
