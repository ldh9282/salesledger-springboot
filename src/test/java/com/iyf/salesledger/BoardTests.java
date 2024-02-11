package com.iyf.salesledger;

import java.util.HashMap;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.iyf.salesledger.common.board.service.BoardService;

@SpringBootTest
public class BoardTests {

	@Autowired
	private BoardService boardService;
	
	@Test
	void test01() {
		for (int i = 0; i < 100; i++) {
			Map<String, Object> requestMap = new HashMap<>();
			
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
