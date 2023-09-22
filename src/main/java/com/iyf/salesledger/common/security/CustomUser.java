package com.iyf.salesledger.common.security;

import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUser extends User {

	private static final long serialVersionUID = 1L;
	
	
	public CustomUser(Member member) {
		super(member.getUsername(),
				member.getPassword(),
				member.getAuthorities()
				          .stream()  
				          .map(auth -> new SimpleGrantedAuthority(auth.getAuthority())) 
				          .collect(Collectors.toList())  
		);
	}
	
	
	
	
}
