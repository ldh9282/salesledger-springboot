package com.iyf.salesledger.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.dao.MemberDao;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberDao memberDao;

//	@Autowired
//	private SqlSessionTemplate sst;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member member = memberDao.selectOne(username);
//		Member member = sst.selectOne("com.iyf.salesledger.dao.MemberDao.selectOne", username);
		if (member == null) {
			throw new UsernameNotFoundException(username);
		}
		if (member.getEnabled().equals("0")) {
			throw new DisabledException(member.getUsername() + " is disabled" );
		}
		return new CustomUser(member);
	}

}
