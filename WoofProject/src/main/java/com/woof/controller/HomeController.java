package com.woof.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.woof.domain.Notice;
import com.woof.service.NoticeService;

@Controller
public class HomeController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Date date = new Date();

		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "homewoof";
	}
	@RequestMapping(value = "/1", method = RequestMethod.GET)
	public String homeB(Locale locale, Model model, Notice notice) throws Exception {
//		Date date = new Date();
//
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate);
		List<Notice> noticeList = noticeService.getMainPageNoticeList();
		model.addAttribute("noticeList", noticeList);
		return "homewoofBeta";
	}
}
