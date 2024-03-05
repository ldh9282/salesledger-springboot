package com.iyf.salesledger.common.board.controller.page;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.iyf.salesledger.common.board.service.BoardReplyService;
import com.iyf.salesledger.common.board.service.BoardService;
import com.iyf.salesledger.common.model.CustomMap;
import com.iyf.salesledger.common.paging.PagingCreatorDTO;
import com.iyf.salesledger.common.paging.PagingDTO;
import com.iyf.salesledger.common.utils.DateUtils;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private BoardReplyService boardReplyService;
	
	/***
	 * @기능 boardRegister.jsp 페이지 호출
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/board/register")
	public String showBoardRegisterPage() {
		if (log.isInfoEnabled()) {log.info("Start BoardController.showBoardRegisterPage");}
		if (log.isInfoEnabled()) {log.info("page ::: " + "board/boardRegister");}
		if (log.isInfoEnabled()) {log.info("End BoardController.showBoardRegisterPage");}
		return "board/boardRegister";
	}
	/***
	 * @기능 boardModify.jsp 페이지 호출
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/board/modify/{board_id}")
	public String showBoardModifyPage(@PathVariable long board_id, ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start BoardController.showBoardModifyPage");}
		if (log.isInfoEnabled()) {log.info("param ::: board_id ::: " + board_id);}
		if (log.isInfoEnabled()) {log.info("do service ::: boardService.getBoardById");}
		Map<String, Object> board = boardService.getBoardById(board_id);
		modelMap.addAttribute("board", board);
		if (log.isInfoEnabled()) {log.info("page ::: " + "board/boardModify");}
		if (log.isInfoEnabled()) {log.info("End BoardController.showBoardModifyPage");}
		return "board/boardModify";
	}
	/***
	 * @기능 boardDetail.jsp 페이지 호출
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/board/{board_id}")
	public String showBoardDetailPage(@PathVariable long board_id, ModelMap modelMap) {
		if (log.isInfoEnabled()) {log.info("Start BoardController.showBoardDetailPage");}
		if (log.isInfoEnabled()) {log.info("param ::: board_id ::: " + board_id);}
		if (log.isInfoEnabled()) {log.info("do service ::: boardService.getBoardById");}
		CustomMap board = boardService.getBoardById(board_id);
		
		CustomMap requsetMap = new CustomMap();
		requsetMap.put("board_id", board_id);
		List<CustomMap> boardReplyList = boardReplyService.getBoardReplyList(requsetMap);
		
		modelMap.addAttribute("board", board);
		modelMap.addAttribute("boardReplyList", boardReplyList);
		if (log.isInfoEnabled()) {log.info("modelMap ::: board ::: " + board);}
		if (log.isInfoEnabled()) {log.info("modelMap ::: boardReplyList ::: " + boardReplyList.size());}
		if (log.isInfoEnabled()) {log.info("page ::: " + "board/boardDetail");}
		if (log.isInfoEnabled()) {log.info("End BoardController.showBoardDetailPage");}
		return "board/boardDetail";
	}
	
	/***
	 * @기능 boardList.jsp 페이지 호출
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/board/list")
	public String showBoardListPage(PagingDTO pagingDTO, ModelMap modelMap, HttpServletRequest request) throws ParseException {
		if (log.isInfoEnabled()) {log.info("Start BoardController.showBoardListPage");}
		if (log.isInfoEnabled()) {log.info("param ::: pagingDTO ::: " + pagingDTO);}
		if (log.isInfoEnabled()) {log.info("do service ::: boardService.getTotalCountByKeyword");}
		CustomMap requsetMap = new CustomMap();
		requsetMap.put("pagingDTO", pagingDTO);
		requsetMap.put("board_type", request.getParameter("board_type"));
		long count = boardService.getTotalCountByKeyword(requsetMap);
		if (log.isInfoEnabled()) {log.info("do service ::: boardService.getBoardListByKeyword");}
		List<CustomMap> boardList = boardService.getBoardListByKeyword(requsetMap);
		PagingCreatorDTO pagingCreatorDTO = new PagingCreatorDTO(count, pagingDTO);
		if (log.isInfoEnabled()) {log.info("build PagingCreatorDTO ::: instance ::: " + pagingCreatorDTO);}
		modelMap.addAttribute("boardList", boardList);
		modelMap.addAttribute("pagingCreator", pagingCreatorDTO);
		String today = DateUtils.formatObject(new Date(), "yyyy.MM.dd");
		modelMap.addAttribute("today", today);
		modelMap.addAttribute("board_type", request.getParameter("board_type"));
		if (log.isInfoEnabled()) {log.info("modelMap ::: boardList ::: " + boardList.size());}
		if (log.isInfoEnabled()) {log.info("modelMap ::: pagingCreator ::: " + pagingCreatorDTO);}
		if (log.isInfoEnabled()) {log.info("modelMap ::: today ::: " + today);}
		if (log.isInfoEnabled()) {log.info("modelMap ::: board_type ::: " + request.getParameter("board_type"));}
		if (log.isInfoEnabled()) {log.info("page ::: " + "board/boardList");}
		if (log.isInfoEnabled()) {log.info("End BoardController.showBoardListPage");}
		return "board/boardList";
	}
}
