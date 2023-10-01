package com.iyf.salesledger.common.security;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.service.MemberService;

import lombok.extern.log4j.Log4j2;

@RestController @Log4j2
public class MemberAjaxController {
	
	@Autowired
	private MemberService memberService;
	
	/***
	 * @기능 회원 조회
	 * @param username 회원 아이디
	 * @return member 회원 단건
	 */
	@GetMapping("/member.ajax/username/{username}")
	public Member retrieveMemberByUsername(@PathVariable String username, HttpServletRequest request) {
		if (log.isInfoEnabled()) {log.info("Start MemberAjaxController.retrieveMemberByUsername");}
		if (log.isInfoEnabled()) {log.info("request ::: remote ip ::: " + request.getRemoteAddr());}
		if (log.isInfoEnabled()) {log.info("param ::: username ::: " + username);}
		if (log.isInfoEnabled()) {log.info("do service ::: memberService.selectOne");}
		Member member = memberService.selectOne(username);
		if (log.isInfoEnabled()) {log.info("return ::: member ::: " + member);}
		if (log.isInfoEnabled()) {log.info("End MemberAjaxController.retrieveMemberByUsername");}
		return member;
	}
	
}
