package com.woof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woof.domain.Notice;
import com.woof.domain.PageRequest;
import com.woof.domain.Pagination;
import com.woof.domain.Service;
import com.woof.service.ServiceService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/service")
public class ServiceController {

	@Autowired
	private ServiceService serviceService;

	@RequestMapping("/insertServiceForm")
	public String insertServiceForm(Service service) throws Exception {
		log.info("insertServiceForm");
		return "service/insertService";
	}

	@RequestMapping("/insertService")
	public String insertService(Service service) throws Exception {
		log.info("insertService");

//		serviceService.insertService(service);
//
//		// 샘플작성
//		String desc = service.getServiceDesc();
//		for (int i = 0; i < 30; i++) {
//			service.setServiceDesc(desc + i);
//			serviceService.insertService(service);
//		}

		return "redirect:/service/getServiceList";
	}

	// 공지사항 수정화면
	@RequestMapping("/modifyNoticeForm/{noticeNo}")
	public String modifyNoticeForm(@PathVariable("noticeNo") int noticeNo, Notice dto, Model model) throws Exception {
		dto.setNoticeNo(noticeNo);
		noticeService.addNoticeViewCount(dto);
		Notice notice = noticeService.getNotice(dto);
		model.addAttribute("notice", notice);
		return "admin/notices/modifyNotice";
	}

	// 공지사항 수정
	@PostMapping("/modifyNotice")
	public String modifyNotice(Notice notice) throws Exception {
		log.info("modifyNotice");

		noticeService.modifyNotice(notice);

		return "redirect:/notice/getNoticeList";
	}

	// 공지사항 삭제
	@RequestMapping("/deleteNotice")
	public String deleteNotice(Notice notice) throws Exception {
		noticeService.deleteNotice(notice);
		return "redirect:/notice/getNoticeList";
	}

	@RequestMapping("/getServiceList")
	public String getServiceList(Model model, PageRequest pageRequest, Pagination pagination) throws Exception {
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
		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(serviceService.countServiceList(pageRequest));
		model.addAttribute("pagination", pagination);
		List<Service> serviceList = serviceService.getServiceList(pageRequest);
		
		model.addAttribute("serviceList", serviceList);
		log.info("serviceList : "+serviceList.toString());
		return "service/serviceList";
	}

	@RequestMapping("/getFAQList")
	public String getFAQList(Service service) {
		return "service/FAQ";
	}

}
