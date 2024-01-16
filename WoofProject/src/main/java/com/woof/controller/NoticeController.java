package com.woof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.MergedAnnotations.Search;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
		Notice dto = noticeService.getNotice(notice);
		model.addAttribute("notice", dto);
		return "about/notice";
	}

	@GetMapping("/getNoticeList")
	public String getNoticeList(Model model, PageRequest pageRequest,Pagination pagination) throws Exception {
		log.info("getNoticeList");
		
//		if (pageRequest.getCondition() == null) {
//			pageRequest.setCondition("TITLE");
//		}
		if (pageRequest.getKeyword() == null) {
			pageRequest.setKeyword("");
		}

		// 검색정보 Null Check
//		switch (pageRequest.getCondition()) {
//		case "TITLE": {
//			pageRequest.setKeywordTitle(pageRequest.getKeyword());
//			pageRequest.setKeywordDesc("");
//			break;
//		}
//		case "CONTENT": {
//			pageRequest.setKeywordDesc(pageRequest.getKeyword());
//			pageRequest.setKeywordTitle("");
//			break;
//		}
//		}
		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(noticeService.countNoticeList(pageRequest));
		model.addAttribute("pagination", pagination);
		List<Notice> noticeList = noticeService.getNoticeList(pageRequest);
		model.addAttribute("noticeList", noticeList);
		
		return "about/noticeList";
	}

//	@GetMapping("/getNoticeList")
//	public String getNoticeList(Model model, PageRequest pageRequest) throws Exception {
//		log.info("getNoticeList");
//		log.info("getSizePerPage : "+String.valueOf(pageRequest.getSizePerPage()));
//		pageRequest.setPage(1);
//		log.info("getSizePerPage : "+String.valueOf(pageRequest.getSizePerPage()));
//		return "about/noticeList";
//	}
//	@PutMapping(value = "/getNoticeListAjaxPut")
//	public ResponseEntity<List> getNoticeListAjaxPut(@RequestBody PageRequest pageRequest, Model model ) throws Exception {
//		log.info("getNoticeListAjaxPut");
//
//		if (pageRequest.getKeyword() == null) {
//			pageRequest.setKeyword("");
//		}
//
//		// 검색정보 Null Check
//		switch (pageRequest.getCondition()) {
//		case "TITLE": {
//			pageRequest.setKeywordTitle(pageRequest.getKeyword());
//			pageRequest.setKeywordDesc("");
//			break;
//		}
//		case "CONTENT": {
//			pageRequest.setKeywordDesc(pageRequest.getKeyword());
//			pageRequest.setKeywordTitle("");
//			break;
//		}
//		}
//
//		List<Notice> noticeList = noticeService.getNoticeList(pageRequest);
//		ResponseEntity<List> entity = null;
//		
//		if (noticeList.size() != 0) {
//			entity = new ResponseEntity<List>(noticeList, HttpStatus.OK);
//		}
//		log.info("getSizePerPage : "+String.valueOf(pageRequest.getSizePerPage()));
//		Pagination pagination = new Pagination();
//		pagination.setPageRequest(pageRequest);
//		log.info("getCondition : "+pageRequest.getCondition());
//		log.info("getKeyword : "+pageRequest.getKeyword());
//		pagination.setTotalCount(noticeService.countNoticeList(pageRequest));
//		log.info(pageRequest.toString());
//		log.info(pagination.toString());
////		model.addAttribute("pagination", pagination);
//	
//		return entity;
//	}
	
//	@PutMapping(value = "/getNoticeListAjaxPut")
//	public ResponseEntity<List> getNoticeListAjaxPut(@RequestBody Search search) throws Exception {
//		log.info("getNoticeListAjaxPut");
//
//		if (search.getKeyword() == null) {
//			search.setKeyword("");
//		}
//
//		// 검색정보 Null Check
//		switch (search.getCondition()) {
//		case "TITLE": {
//			search.setKeywordTitle(search.getKeyword());
//			search.setKeywordDesc("");
//			break;
//		}
//		case "CONTENT": {
//			search.setKeywordDesc(search.getKeyword());
//			search.setKeywordTitle("");
//			break;
//		}
//		}
//
//		List<Notice> noticeList = noticeService.getNoticeList(search);
//		ResponseEntity<List> entity = null;
//		if (noticeList.size() != 0) {
//			entity = new ResponseEntity<List>(noticeList, HttpStatus.OK);
//		}
//		return entity;
//	}
	
	//공지사항 작성화면
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping("/insertNoticeForm")
	public String insertNoticeForm(Notice notice) throws Exception {
		return "admin/notices/insertNotice";
	}
	
	//공지사항 작성
	@PreAuthorize("hasRole('ROLE_ADMIN')")
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
	
	//공지사항 수정화면
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping("/modifyNoticeForm/{noticeNo}")
	public String modifyNoticeForm(@PathVariable("noticeNo") int noticeNo, Notice dto, Model model) throws Exception {
		dto.setNoticeNo(noticeNo);
		noticeService.addNoticeViewCount(dto);
		Notice notice = noticeService.getNotice(dto);
		model.addAttribute("notice", notice);
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
	@RequestMapping("/deleteNotice")
	public String deleteNotice(Notice notice) throws Exception {
		noticeService.deleteNotice(notice);
		return "redirect:/notice/getNoticeList";
	}
	
	//시설소개
	@RequestMapping("/getAbout")
	public String getAbout(Model model, Search search) throws Exception {
		log.info("getAbout");
		return "about/about";
	}
	
	//오시는길
	@RequestMapping("/getLocation")
	public String getLocation(Model model, Search search) throws Exception {
		log.info("getAbout");
		model.addAttribute("kakaoMapAppkey", kakaoMapAppkey);
		return "about/location";
	}
}
