package com.iyf.salesledger.common.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.common.board.dao.BoardDao;
import com.iyf.salesledger.common.paging.PagingDTO;

import lombok.extern.log4j.Log4j2;

@Service @Log4j2
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	
	public void insertBoard(Map<String, Object> paraMap) {
		boardDao.insertBoard(paraMap);
	}
	
	public Map<String, Object> getBoardById(long board_id) {
		return boardDao.getBoardById(board_id);
	}

	public void updateBoard(Map<String, Object> requsetMap) {
		boardDao.updateBoard(requsetMap);
	}

	public List<Map<String, Object>> getBoardListByKeyword(Map<String, Object> requsetMap) {
		return boardDao.getBoardListByKeyword(requsetMap);
	}
	
	public long getTotalCountByKeyword(Map<String, Object> requsetMap) {
		return boardDao.getTotalCountByKeyword(requsetMap);
	}

	public void updateBoardDelY(Map<String, Object> requsetMap) {
		boardDao.updateBoardDelY(requsetMap);
		
	}

	public void deleteBoard(Map<String, Object> requsetMap) {
		boardDao.deleteBoard(requsetMap);		
	}
	
}
