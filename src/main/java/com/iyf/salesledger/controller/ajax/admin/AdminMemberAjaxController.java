package com.iyf.salesledger.controller.ajax.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.iyf.salesledger.common.security.Member;
import com.iyf.salesledger.common.security.MemberAuthority;
import com.iyf.salesledger.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class AdminMemberAjaxController {

	@Autowired
	private MemberService memberService;
	
	/***
	 * @기능 memberDetail.jsp 페이지에서 회원정보 수정
	 * @param memberMap 
	 * @param username 회원 아이디
	 * @param enabled 회원 활성상태
	 * @param auth 회원 권한
	 * @return 
	 */
	@PreAuthorize("hasAuthority('통합 관리자')")
	@PutMapping("/member.ajax")
	public void updateMember(@RequestBody Map<String, String> memberMap) {
		if (log.isInfoEnabled()) {log.info("Start AdminMemberAjaxController.updateMember");}
		if (log.isInfoEnabled()) {log.info("param ::: username ::: " + memberMap.get("username"));}
		if (log.isInfoEnabled()) {log.info("do service ::: memberService.selectOne");}
		Member theMember = memberService.selectOne(memberMap.get("username"));
		theMember.setEnabled(memberMap.get("enabled"));
		MemberAuthority memberAuthority = new MemberAuthority();
		memberAuthority.setUsername(theMember.getUsername());
		memberAuthority.setAuthority(memberMap.get("auth"));
		if (log.isInfoEnabled()) {log.info("param ::: member ::: " + theMember);}
		if (log.isInfoEnabled()) {log.info("param ::: memberAuthority ::: " + memberAuthority);}
		if (log.isInfoEnabled()) {log.info("do service ::: memberService.update");}
		memberService.update(theMember, memberAuthority);
		if (log.isInfoEnabled()) {log.info("End AdminMemberAjaxController.updateMember");}
	}
	
	/***
	 * @기능 memberDetail.jsp 페이지에서 회원정보 삭제
	 * @param username 회원 아이디
	 * @return 
	 */
	@PreAuthorize("hasAuthority('통합 관리자')")
	@DeleteMapping("/member.ajax/username/{username}")
	public void deleteMember(@PathVariable String username) {
		if (log.isInfoEnabled()) {log.info("Start AdminMemberAjaxController.deleteMember");}
		if (log.isInfoEnabled()) {log.info("param ::: username ::: " + username);}
		if (log.isInfoEnabled()) {log.info("do service ::: memberService.delete");}
		memberService.delete(username);
		if (log.isInfoEnabled()) {log.info("End AdminMemberAjaxController.deleteMember");}
	}
}
