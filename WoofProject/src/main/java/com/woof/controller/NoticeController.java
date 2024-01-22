package com.woof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.MergedAnnotations.Search;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woof.domain.Notice;
import com.woof.domain.PageRequest;
import com.woof.domain.Pagination;
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

	@GetMapping("/getNotice")
	public String getNotice(Notice notice, Model model) throws Exception {
		log.info("getNotice");
		noticeService.addNoticeViewCount(notice);
		model.addAttribute(noticeService.getNotice(notice));
		return "about/notice";
	}

	@GetMapping("/getNoticeList")
	public String getNoticeList(Model model, PageRequest pageRequest,Pagination pagination) throws Exception {
		log.info("getNoticeList");
		
		if (pageRequest.getCondition() == null) {
			pageRequest.setCondition("TITLE");
		}
		if (pageRequest.getKeyword() == null) {
			pageRequest.setKeyword("");
		}

		// 검색정보 Null Check
		switch (pageRequest.getCondition()) {
		case "TITLE": {
			pageRequest.setKeywordTitle(pageRequest.getKeyword());
			pageRequest.setKeywordDesc("");
			break;
		}
		case "CONTENT": {
			pageRequest.setKeywordDesc(pageRequest.getKeyword());
			pageRequest.setKeywordTitle("");
			break;
		}
		}
		log.info("pageRequest1 : "+pageRequest.toString());
		log.info("pagination1 : "+pagination.toString());
		pagination.setPageRequest(pageRequest);
		log.info("pageRequest2 : "+pageRequest.toString());
		log.info("pagination2 : "+pagination.toString());
		
		pagination.setTotalCount(noticeService.countNoticeList(pageRequest));
		
		log.info("pageRequest3 : "+pageRequest.toString());
		log.info("pagination3 : "+pagination.toString());
		
		
		model.addAttribute("pagination", pagination);
		
		
		List<Notice> noticeList = noticeService.getNoticeList(pageRequest);
		model.addAttribute("noticeList", noticeList);
		
		return "about/noticeList";
	}

	//공지사항 작성화면
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/insertNoticeForm")
	public String insertNoticeForm(Notice notice) throws Exception {
		return "admin/notices/insertNotice";
	}
	
	//공지사항 작성
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/insertNotice")
	public String insertNotice(Notice notice) throws Exception {
		log.info("insertNotice");

		noticeService.insertNotice(notice);

//		// 샘플작성
//		String title = notice.getNoticeTitle();
//		String desc = notice.getNoticeDesc();
//		for (int i = 0; i < 30; i++) {
//			notice.setNoticeTitle(title + i);
//			notice.setNoticeDesc(desc + i);
//			noticeService.insertNotice(notice);
//		}
//		//샘플작성

		return "redirect:/notice/getNoticeList";
	}
	
	//공지사항 수정화면
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/modifyNoticeForm")
	public String modifyNoticeForm(Notice notice, Model model) throws Exception {
		model.addAttribute(noticeService.getNotice(notice));
		return "admin/notices/modifyNotice";
	}
	
	//공지사항 수정
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/modifyNotice")
	public String modifyNotice(Notice notice) throws Exception {
		log.info("modifyNotice");

		noticeService.modifyNotice(notice);

		return "redirect:/notice/getNoticeList";
	}
	
	//공지사항 삭제
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/deleteNotice")
	public String deleteNotice(Notice notice) throws Exception {
		noticeService.deleteNotice(notice);
		return "redirect:/notice/getNoticeList";
	}
	
	//시설소개
	@GetMapping("/getAbout")
	public String getAbout(Model model, Search search) throws Exception {
		log.info("getAbout");
		return "about/about";
	}
	
	//오시는길
	@GetMapping("/getLocation")
	public String getLocation(Model model, Search search) throws Exception {
		log.info("getAbout");
		model.addAttribute("kakaoMapAppkey", kakaoMapAppkey);
		return "about/location";
	}	
}
