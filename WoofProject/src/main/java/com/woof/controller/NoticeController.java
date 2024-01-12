package com.woof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woof.domain.Notice;
import com.woof.domain.Search;
import com.woof.service.NoticeService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@Value("${kakaomap.appkey}")
	private String kakaoMapAppkey;

	@RequestMapping("/getNotice/{noticeNo}")
	public String getNotice(@PathVariable("noticeNo") int noticeNo, Notice dto, Model model) throws Exception {
		log.info("getNotice");
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
	public String getNoticeList(Model model, Search search) throws Exception {
		log.info("getNoticeList");
		return "about/noticeList";
	}

	@PutMapping(value = "/getNoticeListAjaxPut")
	public ResponseEntity<List> getNoticeListAjaxPut(@RequestBody Search search) throws Exception {
		log.info("getNoticeListAjaxPut");

		if (search.getKeyword() == null) {
			search.setKeyword("");
		}

		// 검색정보 Null Check
		switch (search.getCondition()) {
		case "TITLE": {
			search.setKeywordTitle(search.getKeyword());
			search.setKeywordDesc("");
			break;
		}
		case "CONTENT": {
			search.setKeywordDesc(search.getKeyword());
			search.setKeywordTitle("");
			break;
		}
		}

		List<Notice> noticeList = noticeService.getNoticeList(search);
		ResponseEntity<List> entity = null;
		if (noticeList.size() != 0) {
			entity = new ResponseEntity<List>(noticeList, HttpStatus.OK);
		}
		return entity;
	}



	@RequestMapping("/insertNoticeForm")
	public String insertNoticeForm(Notice notice) throws Exception {
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
	
	
	@RequestMapping("/modifyNoticeForm/{noticeNo}")
	public String modifyNoticeForm(@PathVariable("noticeNo") int noticeNo, Notice dto, Model model) throws Exception {
		dto.setNoticeNo(noticeNo);
		noticeService.addNoticeViewCount(dto);
		Notice notice = noticeService.getNotice(dto);
		model.addAttribute("notice", notice);
		return "admin/notices/modifyNotice";
	}
	
	@PostMapping("/modifyNotice")
	public String modifyNotice(Notice notice) throws Exception {
		log.info("modifyNotice");

		noticeService.modifyNotice(notice);

		return "redirect:/notice/getNoticeList";
	}
	
	

	@RequestMapping("/deleteNotice")
	public String deleteNotice(Notice notice) throws Exception {
		noticeService.deleteNotice(notice);
		return "redirect:/notice/getNoticeList";
	}
	
	@RequestMapping("/getAbout")
	public String getAbout(Model model, Search search) throws Exception {
		log.info("getAbout");
		return "about/about";
	}
	
	@RequestMapping("/getLocation")
	public String getLocation(Model model, Search search) throws Exception {
		log.info("getAbout");
		model.addAttribute("kakaoMapAppkey", kakaoMapAppkey);
		return "about/location";
	}
	
	
}
