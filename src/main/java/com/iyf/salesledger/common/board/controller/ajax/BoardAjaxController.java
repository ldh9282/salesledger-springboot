package com.iyf.salesledger.common.board.controller.ajax;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.common.board.model.Board;
import com.iyf.salesledger.common.board.service.BoardService;
import com.iyf.salesledger.model.EmpPool;

import lombok.extern.log4j.Log4j2;

@RestController @Log4j2
public class BoardAjaxController {

	@Autowired
	private BoardService boardService;
	/***
	 * @기능 boardRegister.jsp 페이지에서 등록
	 * @param requsetMap
	 * @param request
	 * @return 
	 */
	@PostMapping("/board.ajax")
	public void insertBoard(@RequestBody Map<String, Object> requsetMap, HttpServletRequest request) {
		if (log.isInfoEnabled()) {log.info("Start BoardAjaxController.insertBoard");}
		requsetMap.put("system_creator", request.getRemoteUser());
		requsetMap.put("system_modifier", request.getRemoteUser());
		if (log.isInfoEnabled()) {log.info("param ::: requsetMap ::: " + requsetMap);}
		if (log.isInfoEnabled()) {log.info("do service ::: boardService.insert");}
		boardService.insertBoard(requsetMap);
		if (log.isInfoEnabled()) {log.info("End BoardAjaxController.insertBoard");}
	}
	/***
	 * @기능 boardModify.jsp 페이지에서 수정
	 * @param board_id
	 * @param requsetMap
	 * @param request
	 * @return 
	 */
	@PutMapping("/board.ajax/{board_id}")
	public void updateBoard(@PathVariable long board_id, @RequestBody Map<String, Object> requsetMap, HttpServletRequest request) {
		if (log.isInfoEnabled()) {log.info("Start BoardAjaxController.updateBoard");}
		requsetMap.put("board_id", board_id);
		requsetMap.put("system_modifier", request.getRemoteUser());
		if (log.isInfoEnabled()) {log.info("param ::: requsetMap ::: " + requsetMap);}
		if (log.isInfoEnabled()) {log.info("do service ::: boardService.updateBoard");}
		boardService.updateBoard(requsetMap);
		if (log.isInfoEnabled()) {log.info("End BoardAjaxController.updateBoard");}
	}
	/***
	 * @기능 boardDetail.jsp 페이지에서 삭제
	 * @param board_id
	 * @param requsetMap
	 * @param request
	 * @return 
	 */
	@DeleteMapping("/board.ajax/{board_id}")
	public void deleteBoard(@PathVariable long board_id, HttpServletRequest request) {
		if (log.isInfoEnabled()) {log.info("Start BoardAjaxController.deleteBoard");}
		Map<String, Object> requsetMap = new HashMap<>();
		requsetMap.put("board_id", board_id);
		requsetMap.put("system_modifier", request.getRemoteUser());
		if (log.isInfoEnabled()) {log.info("param ::: requsetMap ::: " + requsetMap);}
		if (log.isInfoEnabled()) {log.info("do service ::: boardService.deleteBoard");}
//		boardService.updateBoardDelY(requsetMap);
		boardService.deleteBoard(requsetMap);
		if (log.isInfoEnabled()) {log.info("End BoardAjaxController.deleteBoard");}
	}
}
