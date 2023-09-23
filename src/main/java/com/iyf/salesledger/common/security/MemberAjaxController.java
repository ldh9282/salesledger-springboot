package com.iyf.salesledger.common.security;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.service.MemberService;

import lombok.extern.log4j.Log4j2;

@RestController @Log4j2
public class MemberAjaxController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/member.ajax/username/{username}")
	public Member retrieveMemberByUsername(@PathVariable String username) {
		if (log.isInfoEnabled()) {log.info("Start MemberAjaxController.retrieveMemberByUsername");}
		if (log.isInfoEnabled()) {log.info("param ::: username ::: " + username);}
		if (log.isInfoEnabled()) {log.info("do service ::: memberService.selectOne");}
		Member member = memberService.selectOne(username);
		if (log.isInfoEnabled()) {log.info("return ::: member ::: " + member);}
		if (log.isInfoEnabled()) {log.info("End MemberAjaxController.retrieveMemberByUsername");}
		return member;
	}
	
}
