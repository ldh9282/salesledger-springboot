package com.iyf.salesledger.common.board.dao;

import java.util.List;

import com.iyf.salesledger.common.model.CustomMap;

public interface BoardReplyDao {

	void insertBoardReply(CustomMap paraMap);
	
	List<CustomMap> getBoardReplyList(CustomMap paraMap);
	
	void updateBoardReplyDelY(CustomMap paraMap);

	void deleteBoardReply(CustomMap paraMap);
	
	CustomMap getBoardReplyPassword(CustomMap paraMap);
}
