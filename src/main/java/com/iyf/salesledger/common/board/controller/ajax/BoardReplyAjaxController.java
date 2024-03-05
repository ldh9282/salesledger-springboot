package com.iyf.salesledger.common.board.controller.ajax;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.iyf.salesledger.common.board.service.BoardReplyService;
import com.iyf.salesledger.common.model.CustomMap;

import lombok.extern.log4j.Log4j2;

@RestController @Log4j2
public class BoardReplyAjaxController {

	@Autowired
	private BoardReplyService boardReplyService;
	
	/***
	 * @기능 boardDetail.jsp 페이지에서 댓글 조회
	 * @param requsetMap
	 * @param request
	 * @return boardReplyList
	 */
	@GetMapping("/boardReply.ajax/board_id/{board_id}")
	public List<CustomMap> getBoardReplyList(@PathVariable long board_id) {
		if (log.isInfoEnabled()) {log.info("Start BoardReplyAjaxController.getBoardReplyList");}
		CustomMap requsetMap = new CustomMap();
		requsetMap.put("board_id", board_id);
		if (log.isInfoEnabled()) {log.info("param ::: requsetMap ::: " + requsetMap);}
		if (log.isInfoEnabled()) {log.info("do service ::: boardReplyService.getBoardReplyList");}
		List<CustomMap> boardReplyList = boardReplyService.getBoardReplyList(requsetMap);
		if (log.isInfoEnabled()) {log.info("boardReplyList ::: " + boardReplyList.size());}
		if (log.isInfoEnabled()) {log.info("End BoardReplyAjaxController.getBoardReplyList");}
		return boardReplyList;
	}
	
	/***
	 * @기능 boardDetail.jsp 페이지에서 댓글 등록
	 * @param requsetMap
	 * @param request
	 * @return 
	 */
	@PostMapping("/boardReply.ajax")
	public void insertBoardReply(@RequestBody CustomMap requsetMap, HttpServletRequest request) {
		if (log.isInfoEnabled()) {log.info("Start BoardReplyAjaxController.insertBoardReply");}
		if (log.isInfoEnabled()) {log.info("param ::: requsetMap ::: " + requsetMap);}
		if (log.isInfoEnabled()) {log.info("do service ::: boardReplyService.insertBoardReply");}
		boardReplyService.insertBoardReply(requsetMap, request);
		if (log.isInfoEnabled()) {log.info("End BoardReplyAjaxController.insertBoardReply");}
	}
	
	/***
	 * @기능 boardDetail.jsp 페이지에서 댓글 삭제
	 * @param reply_id
	 * @param requsetMap
	 * @param request
	 */
	@DeleteMapping("/boardReply.ajax/{reply_id}")
	public void updateBoardReplyDelY(@PathVariable long reply_id, @RequestBody CustomMap requsetMap, HttpServletRequest request) {
		if (log.isInfoEnabled()) {log.info("Start BoardReplyAjaxController.updateBoardReplyDelY");}
		
		if ("1".equals(requsetMap.get("anonymous"))) {
			requsetMap.put("system_modifier", requsetMap.getString("anonymous_name"));
			requsetMap.put("reply_id", reply_id);
		} else {
			requsetMap.put("system_modifier", request.getRemoteUser());
			requsetMap.put("reply_id", reply_id);
		}
		
		if (log.isInfoEnabled()) {log.info("param ::: requsetMap ::: " + requsetMap);}
		if (log.isInfoEnabled()) {log.info("do service ::: boardReplyService.updateBoardReplyDelY");}
		boardReplyService.updateBoardReplyDelY(requsetMap);
		if (log.isInfoEnabled()) {log.info("End BoardReplyAjaxController.updateBoardReplyDelY");}
	}
	
	/***
	 * @기능 boardDetail.jsp 페이지에서 댓글 삭제 비밀번호 검증
	 * @param reply_id
	 * @param password
	 * @return resultMap
	 */
	@GetMapping("/boardReply.ajax/{reply_id}/password/validate")
	public CustomMap validateBoardReplyPassword(@PathVariable long reply_id, @RequestParam String password) {
		if (log.isInfoEnabled()) {log.info("Start BoardReplyAjaxController.validateBoardReplyPassword");}
		CustomMap requsetMap = new CustomMap();
		requsetMap.put("reply_id", reply_id);
		requsetMap.put("password", password);
		if (log.isInfoEnabled()) {log.info("param ::: requsetMap ::: " + requsetMap);}
		if (log.isInfoEnabled()) {log.info("do service ::: boardReplyService.validateBoardReplyPassword");}
		CustomMap resultMap = boardReplyService.validateBoardReplyPassword(requsetMap);
		if (log.isInfoEnabled()) {log.info("End BoardReplyAjaxController.validateBoardReplyPassword");}
		return resultMap;
	}
}
