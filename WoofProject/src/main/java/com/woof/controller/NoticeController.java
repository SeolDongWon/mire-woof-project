package com.woof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woof.domain.Notice;
import com.woof.service.NoticeService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("/getNotice/{noticeNo}")
	public String getNotice(@PathVariable("noticeNo") int noticeNo, Notice dto,Model model) throws Exception {
		dto.setNoticeNo(noticeNo);
		Notice notice=noticeService.getNotice(dto);
		model.addAttribute("notice", notice);
		return "/about/notice"; 
	}

//	@RequestMapping(value = "/board/read/{boardNo}", method = RequestMethod.GET)
//	public String home(@PathVariable("boardNo") int boardNo) {
//		log.info("boardNo : " + boardNo);
//		return "home";
//	}
	
	@RequestMapping("/getNoticeList")
	public String getNoticeList(Model model) throws Exception {
		List<Notice> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		return "about/noticeList"; 
	}

	@RequestMapping("/insertNoticeForm")
	public String insertNoticeForm(Notice notice) throws Exception {
//		noticeService.insertNotice(notice);
		return "admin/notices/insertNotice"; 
	}
	@PostMapping("/insertNotice")
	public String insertNotice(Notice notice) throws Exception {
		log.info("insertNotice");
		noticeService.insertNotice(notice);
		return "/about/noticeList"; 
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
