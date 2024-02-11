package com.iyf.salesledger.common.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.common.board.dao.BoardReplyDao;

@Service
public class BoardReplyService {

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private BoardReplyDao boardReplyDao;
	
	public List<Map<String, Object>> getBoardReplyList(Map<String, Object> requsetMap) {
		
		return boardReplyDao.getBoardReplyList(requsetMap);
	}
	
	public void insertBoardReply(Map<String, Object> requsetMap) {
		boardReplyDao.insertBoardReply(requsetMap);
	}
	
	public void updateBoardReplyDelY(Map<String, Object> requsetMap) {
		boardReplyDao.updateBoardReplyDelY(requsetMap);
	}
	
	public Map<String, Object> validateBoardReplyPassword(Map<String, Object> requsetMap) {
		
		Map<String, Object> resultMap = new HashMap<>();
		
		Map<String, Object> boardReplyPassword = boardReplyDao.getBoardReplyPassword(requsetMap);
		
		if ("1".equals(boardReplyPassword.get("anonymous"))) {
			if (requsetMap.get("password").equals(boardReplyPassword.get("password"))) {
				resultMap.put("valid", "1");
			} else {
				resultMap.put("valid", "0");
			}
		} else {
			String rawPassword = (String) requsetMap.get("password");
			String encodedPassword = (String) boardReplyPassword.get("password");
			
			if (passwordEncoder.matches(rawPassword, encodedPassword)) {
				resultMap.put("valid", "1");
			} else {
				resultMap.put("valid", "0");
			}
		}
		
		return resultMap;
	}
}
