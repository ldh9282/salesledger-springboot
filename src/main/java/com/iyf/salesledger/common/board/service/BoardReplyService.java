package com.iyf.salesledger.common.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.common.board.dao.BoardReplyDao;
import com.iyf.salesledger.common.model.CustomMap;
import com.iyf.salesledger.common.security.SecurityUtils;

import lombok.extern.log4j.Log4j2;

@Service @Log4j2
public class BoardReplyService {

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private BoardReplyDao boardReplyDao;
	
	public List<CustomMap> getBoardReplyList(CustomMap requsetMap) {
		
		return boardReplyDao.getBoardReplyList(requsetMap);
	}
	
	public void insertBoardReply(CustomMap requsetMap, HttpServletRequest request) {
		requsetMap.put("board_id", requsetMap.getLong("board_id"));
		requsetMap.put("reply_content", requsetMap.getString("reply_content"));
		
		if ("1".equals(requsetMap.getString("ref_reply"))) {
			requsetMap.put("ref_reply_id", requsetMap.getLong("ref_reply_id"));
		} else {
			requsetMap.put("ref_reply_id", null);
		}
		
		if ("1".equals(requsetMap.getString("anonymous"))) {
			requsetMap.put("system_creator", requsetMap.getString("anonymous_name"));
			requsetMap.put("system_modifier", requsetMap.getString("anonymous_name"));
			requsetMap.put("anonymous_name", requsetMap.getString("anonymous_name"));
			requsetMap.put("anonymous_password", requsetMap.getString("anonymous_password"));
		} else {
			requsetMap.put("system_creator", request.getRemoteUser());
			requsetMap.put("system_modifier", request.getRemoteUser());
		}
		
		boardReplyDao.insertBoardReply(requsetMap);
	}
	
	public void updateBoardReplyDelY(CustomMap requsetMap) {
		boardReplyDao.updateBoardReplyDelY(requsetMap);
	}
	
	public CustomMap validateBoardReplyPassword(CustomMap requsetMap) {
		
		CustomMap resultMap = new CustomMap();
		
		List<String> currentUserAuthorities = SecurityUtils.getCurrentUserAuthorities();
		
		boolean isAdmin = false;
		
		for (String authority : currentUserAuthorities) {
			if ("통합 관리자".equals(authority)) {
				resultMap.put("valid", "1");
				isAdmin = true;
				if (log.isInfoEnabled()) {log.info("validateBoardReplyPassword ::: isAdmin ::: " + isAdmin);}
			}
		}
		
		if (!isAdmin) {
			CustomMap boardReplyPassword = boardReplyDao.getBoardReplyPassword(requsetMap);
			
			if ("1".equals(boardReplyPassword.getString("anonymous"))) {
				if (requsetMap.getString("password").equals(boardReplyPassword.getString("password"))) {
					resultMap.put("valid", "1");
				} else {
					resultMap.put("valid", "0");
				}
			} else {
				String rawPassword = requsetMap.getString("password");
				String encodedPassword = boardReplyPassword.getString("password");
				
				if (passwordEncoder.matches(rawPassword, encodedPassword)) {
					resultMap.put("valid", "1");
				} else {
					resultMap.put("valid", "0");
				}
			}
		}
		
		
		
		return resultMap;
	}
}
