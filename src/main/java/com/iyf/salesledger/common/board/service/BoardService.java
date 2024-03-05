package com.iyf.salesledger.common.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iyf.salesledger.common.board.dao.BoardDao;
import com.iyf.salesledger.common.model.CustomMap;

import lombok.extern.log4j.Log4j2;

@Service @Log4j2
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	
	public void insertBoard(CustomMap paraMap) {
		boardDao.insertBoard(paraMap);
	}
	
	public CustomMap getBoardById(long board_id) {
		return boardDao.getBoardById(board_id);
	}

	public void updateBoard(CustomMap requsetMap) {
		boardDao.updateBoard(requsetMap);
	}

	public List<CustomMap> getBoardListByKeyword(CustomMap requsetMap) {
		return boardDao.getBoardListByKeyword(requsetMap);
	}
	
	public long getTotalCountByKeyword(CustomMap requsetMap) {
		return boardDao.getTotalCountByKeyword(requsetMap);
	}

	public void updateBoardDelY(CustomMap requsetMap) {
		boardDao.updateBoardDelY(requsetMap);
		
	}

	public void deleteBoard(CustomMap requsetMap) {
		boardDao.deleteBoard(requsetMap);		
	}
	
}
