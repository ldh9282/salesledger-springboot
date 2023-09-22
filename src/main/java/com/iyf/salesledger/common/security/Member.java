package com.iyf.salesledger.common.security;

import java.util.List;

import lombok.Data;

@Data
public class Member {

	private String username;
	private String password;
	private List<MemberAuthority> authorities;
	private String name;
	private String company;
	private String enabled;
}
