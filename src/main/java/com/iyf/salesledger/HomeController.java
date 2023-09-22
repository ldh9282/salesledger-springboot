package com.iyf.salesledger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.iyf.salesledger.common.security.Member;
import com.iyf.salesledger.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class HomeController {

	@Autowired
	private MemberService memberService;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/")	
	public String showHomePage() {
		if (log.isInfoEnabled()) {log.info("Start HomeController.showHomePage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "home");}
		if (log.isInfoEnabled()) {log.info("End HomeController.showHomePage");}
		return "home";
	}
	
	@GetMapping("/login")
	public String showLoginPage() {
		if (log.isInfoEnabled()) {log.info("Start HomeController.showLoginPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "login");}
		if (log.isInfoEnabled()) {log.info("End HomeController.showLoginPage");}
		return "login";
	}
	
	@GetMapping("/register")
	public String showRegisterPage() {
		if (log.isInfoEnabled()) {log.info("Start HomeController.showRegisterPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "register");}
		if (log.isInfoEnabled()) {log.info("End HomeController.showRegisterPage");}
		return "register";
	}
	
	@PostMapping("/register")
	public String register(Member member) {
		if (log.isInfoEnabled()) {log.info("Start HomeController.register");}
		if (log.isInfoEnabled()) {log.info("param ::: member ::: " + member);}
		if (log.isInfoEnabled()) {log.info("do service ::: memberService.insert");}
		memberService.insert(member);
		if (log.isInfoEnabled()) {log.info("End HomeController.register");}
		if (log.isInfoEnabled()) {log.info("redirect ::: " + "redirect:/login");}
		return "redirect:/login";
	}
}
