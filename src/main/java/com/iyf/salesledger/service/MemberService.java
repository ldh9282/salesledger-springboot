package com.iyf.salesledger.service;

import java.util.List;

import com.iyf.salesledger.common.paging.PagingDTO;
import com.iyf.salesledger.common.security.Member;
import com.iyf.salesledger.common.security.MemberAuthority;

public interface MemberService {
	Member selectOne(String username);
	
	void insert(Member member);
	
	List<Member> selectMemberListPagingByKeyword(PagingDTO pagingDTO);
	
	long selectTotalCount(PagingDTO pagingDTO);
	
	void update(Member member, MemberAuthority memberAuthority);
	
	void delete(String username);
}
