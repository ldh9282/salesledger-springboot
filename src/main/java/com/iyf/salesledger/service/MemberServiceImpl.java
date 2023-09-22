package com.iyf.salesledger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iyf.salesledger.common.paging.PagingDTO;
import com.iyf.salesledger.common.security.Member;
import com.iyf.salesledger.common.security.MemberAuthority;
import com.iyf.salesledger.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public Member selectOne(String username) {
		return memberDao.selectOne(username);
	}

	@Override @Transactional
	public void insert(Member member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberDao.insertMember(member);
		MemberAuthority memberAuthority = new MemberAuthority();
		memberAuthority.setUsername(member.getUsername());
		memberAuthority.setAuthority("권한 없음");
		memberDao.insertAuthority(memberAuthority);
	}

	@Override
	public List<Member> selectMemberListPagingByKeyword(PagingDTO pagingDTO) {
		return memberDao.selectMemberListPagingByKeyword(pagingDTO);
	}

	@Override
	public long selectTotalCount(PagingDTO pagingDTO) {
		return memberDao.selectTotalCount(pagingDTO);
	}

	@Override @Transactional
	public void update(Member member, MemberAuthority memberAuthority) {
		memberDao.updateMember(member);
		memberDao.updateAuthority(memberAuthority);
	}

	@Override @Transactional
	public void delete(String username) {
		memberDao.deleteAuthority(username);
		memberDao.deleteMember(username);
	}	
	
	

}
