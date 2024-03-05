package com.iyf.salesledger;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.iyf.salesledger.common.board.service.BoardService;
import com.iyf.salesledger.common.model.CustomMap;

@SpringBootTest
public class BoardTests {

	@Autowired
	private BoardService boardService;
	
	@Test
	void test01() {
		for (int i = 0; i < 100; i++) {
			CustomMap requestMap = new CustomMap();
			
			requestMap.put("board_type", "02");
			requestMap.put("board_title", "qqqq" + i);
			requestMap.put("board_content", "<p>qqqq</p>");
			requestMap.put("del", "N");
			requestMap.put("system_creator", "user" + i);
			requestMap.put("system_modifier", "user" + i);
			
			boardService.insertBoard(requestMap);
		}
	}
}
