package com.iyf.salesledger.common.board.dao;

import java.util.List;
import java.util.Map;

public interface BoardReplyDao {

	void insertBoardReply(Map<String, Object> paraMap);
	
	List<Map<String, Object>> getBoardReplyList(Map<String, Object> paraMap);
	
	void updateBoardReplyDelY(Map<String, Object> paraMap);

	void deleteBoardReply(Map<String, Object> paraMap);
	
	Map<String, Object> getBoardReplyPassword(Map<String, Object> paraMap);
}
