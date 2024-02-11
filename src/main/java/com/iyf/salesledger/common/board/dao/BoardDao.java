package com.iyf.salesledger.common.board.dao;

import java.util.List;
import java.util.Map;

import com.iyf.salesledger.common.paging.PagingDTO;

public interface BoardDao {

	void insertBoard(Map<String, Object> paraMap);
	
	Map<String, Object> getBoardById(long board_id);

	void updateBoard(Map<String, Object> paraMap);

	List<Map<String, Object>> getBoardListByKeyword(Map<String, Object> paraMap);
	
	long getTotalCountByKeyword(Map<String, Object> paraMap);

	void updateBoardDelY(Map<String, Object> paraMap);

	void deleteBoard(Map<String, Object> paraMap);
}
