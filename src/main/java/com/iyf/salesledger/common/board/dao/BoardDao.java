package com.iyf.salesledger.common.board.dao;

import java.util.List;

import com.iyf.salesledger.common.model.CustomMap;

public interface BoardDao {

	void insertBoard(CustomMap paraMap);
	
	CustomMap getBoardById(long board_id);

	void updateBoard(CustomMap paraMap);

	List<CustomMap> getBoardListByKeyword(CustomMap paraMap);
	
	long getTotalCountByKeyword(CustomMap paraMap);

	void updateBoardDelY(CustomMap paraMap);

	void deleteBoard(CustomMap paraMap);
}
