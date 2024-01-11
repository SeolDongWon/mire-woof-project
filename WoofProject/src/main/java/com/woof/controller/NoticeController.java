package com.woof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woof.domain.Notice;
import com.woof.domain.NoticeSearch;
import com.woof.service.NoticeService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@RequestMapping("/getNotice/{noticeNo}")
	public String getNotice(@PathVariable("noticeNo") int noticeNo, Notice dto, Model model) throws Exception {
		dto.setNoticeNo(noticeNo);
		noticeService.addNoticeViewCount(dto);
		Notice notice = noticeService.getNotice(dto);
		model.addAttribute("notice", notice);
		return "/about/notice";
	}

//	@RequestMapping(value = "/board/read/{boardNo}", method = RequestMethod.GET)
//	public String home(@PathVariable("boardNo") int boardNo) {
//		log.info("boardNo : " + boardNo);
//		return "home";
//	}

	@RequestMapping("/getNoticeList")
	public String getNoticeList(Model model, NoticeSearch noticeSearch) throws Exception {
		log.info("1 getSearchCondition : " + noticeSearch.getSearchCondition());
		log.info("2 getSearchKeyword : " + noticeSearch.getSearchKeyword());
		log.info("3 getSearchKeywordTitle : " + noticeSearch.getSearchKeywordTitle());
		log.info("4 getSearchKeywordDesc : " + noticeSearch.getSearchKeywordDesc());

		if (noticeSearch.getSearchCondition() == null) {
			noticeSearch.setSearchCondition("TITLE");
		}
		if (noticeSearch.getSearchKeyword() == null) {
			noticeSearch.setSearchKeyword("");
		}

		log.info("5 getSearchKeyword : " + noticeSearch.getSearchKeyword());
		// 검색정보 Null Check
		switch (noticeSearch.getSearchCondition()) {
		case "TITLE": {
			noticeSearch.setSearchKeywordTitle(noticeSearch.getSearchKeyword());
			noticeSearch.setSearchKeywordDesc("");
			break;
		}
		case "CONTENT": {
			noticeSearch.setSearchKeywordDesc(noticeSearch.getSearchKeyword());
			noticeSearch.setSearchKeywordTitle("");
			break;
		}
		}

//		if (noticeSearch.getSearchCondition() == null) {
//			noticeSearch.setSearchCondition("TITLE");
//		}
//		if (noticeSearch.getSearchKeyword() == null) {
//			noticeSearch.setSearchKeyword("");
//		}
		log.info("6 getSearchCondition : " + noticeSearch.getSearchCondition());
		log.info("7 getSearchKeywordTitle : " + noticeSearch.getSearchKeywordTitle());
		log.info("8 getSearchKeywordDesc : " + noticeSearch.getSearchKeywordDesc());

		List<Notice> noticeList = noticeService.getNoticeList(noticeSearch);
		model.addAttribute("noticeList", noticeList);
		return "about/noticeList";
	}


	@PutMapping(value = "/getNoticeListAjaxPut")
	public ResponseEntity<List> getNoticeListAjaxPut(@RequestBody NoticeSearch noticeSearch) throws Exception {
		log.info("getNoticeListAjaxPut");
		log.info(noticeSearch.toString());

		if (noticeSearch.getSearchKeyword() == null) {
			noticeSearch.setSearchKeyword("");
		}

		// 검색정보 Null Check
		switch (noticeSearch.getSearchCondition()) {
		case "TITLE": {
			noticeSearch.setSearchKeywordTitle(noticeSearch.getSearchKeyword());
			noticeSearch.setSearchKeywordDesc("");
			break;
		}
		case "CONTENT": {
			noticeSearch.setSearchKeywordDesc(noticeSearch.getSearchKeyword());
			noticeSearch.setSearchKeywordTitle("");
			break;
		}
		}
		log.info(noticeSearch.toString());

		List<Notice> noticeList = noticeService.getNoticeList(noticeSearch);
		log.info("***noticeList:"+noticeList.get(0).toString());
//		if(noticeList.get(0).getNoticeRegDate().getClass() != String.class) {
		log.info("***noticeList:"+noticeList.get(0).getNoticeRegDate());
//		if(noticeList.get(0).getNoticeRegDate()) {
//		}
		ResponseEntity<List> entity = new ResponseEntity<List>(noticeList, HttpStatus.OK);
		log.info("***entity:"+entity.getBody().get(0));
		log.info(entity.toString());
		return entity;
	}
	
//	@PutMapping(value="/getNoticeListAjaxPutPara")
	@GetMapping("/getNoticeListAjaxPutPara")
//	public String getNoticeListAjaxPutPara(
			public ResponseEntity<List> getNoticeListAjaxPutPara(
			@RequestParam ("searchCondition") 
			String searchCondition,
			@RequestParam ("searchKeyword") 
			String searchKeyword,
			NoticeSearch noticeSearch) throws Exception {
		log.info("getNoticeListAjaxPutPara");
		log.info(noticeSearch.toString());
		log.info("searchCondition:"+searchCondition);
		log.info("searchKeyword:"+searchKeyword);

		if (noticeSearch.getSearchKeyword() == null) {
			noticeSearch.setSearchKeyword("");
		}

		// 검색정보 Null Check
		switch (noticeSearch.getSearchCondition()) {
		case "TITLE": {
			noticeSearch.setSearchKeywordTitle(noticeSearch.getSearchKeyword());
			noticeSearch.setSearchKeywordDesc("");
			break;
		}
		case "CONTENT": {
			noticeSearch.setSearchKeywordDesc(noticeSearch.getSearchKeyword());
			noticeSearch.setSearchKeywordTitle("");
			break;
		}
		}
		log.info(noticeSearch.toString());

		List<Notice> noticeList = noticeService.getNoticeList(noticeSearch);
		log.info("***noticeList:"+noticeList.get(0).toString());

		ResponseEntity<List> entity = new ResponseEntity<List>(noticeList, HttpStatus.OK);
		log.info(entity.toString());
		return entity;
//		return "para";
	}

//	@GetMapping(value="/board/{boardNo}")
//	public ResponseEntity<Board> boardSelect(@PathVariable("boardNo") int boardNo) {
//		log.info("boardSelect : "+ boardNo +" ");
//		Board board = new Board();
//		board.setBoardNo(20);
//		board.setTitle("ajaxGetTest");
//		board.setWriter("seol1");
//		board.setContent("good");
//		board.setRegDate(new Date());
//		
//		ResponseEntity<Board> entity = new ResponseEntity<Board>(board,HttpStatus.OK);
//		return entity;
//	}

	@RequestMapping("/insertNoticeForm")
	public String insertNoticeForm(Notice notice) throws Exception {
//		noticeService.insertNotice(notice);
		return "admin/notices/insertNotice";
	}

	@PostMapping("/insertNotice")
	public String insertNotice(Notice notice) throws Exception {
		log.info("insertNotice");

		noticeService.insertNotice(notice);

		// 샘플작성
		String title = notice.getNoticeTitle();
		String desc = notice.getNoticeDesc();
		for (int i = 0; i < 30; i++) {
			notice.setNoticeTitle(title + i);
			notice.setNoticeDesc(desc + i);
			noticeService.insertNotice(notice);
		}

		return "redirect:/notice/getNoticeList";
	}

	@RequestMapping("/modifyNotice")
	public String modifyNotice(Notice notice) throws Exception {
		noticeService.modifyNotice(notice);
		return "/about/noticeList";
	}

	@RequestMapping("/deleteNotice")
	public String deleteNotice(Notice notice) throws Exception {
		noticeService.deleteNotice(notice);
		return "/about/noticeList";
	}
}
