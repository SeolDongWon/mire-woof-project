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

import com.woof.domain.Account;
import com.woof.domain.Item;
import com.woof.domain.Notice;
import com.woof.domain.Pet;
import com.woof.domain.Review;
import com.woof.service.NoticeService;

import lombok.extern.java.Log;

@Log
@Controller
public class HomeController {
	
	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,Account account) {
		Date date = new Date();

		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "homewoof";
	}
	
	@RequestMapping(value = "/1", method = RequestMethod.GET)
	public String homewoofBeta(Locale locale, Model model,Account account) throws Exception {
//		Date date = new Date();
//
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate);
		List<Pet> petList = noticeService.getMainPetList();
		model.addAttribute("petList", petList);
//		log.info(perList.)
		List<Notice> noticeList = noticeService.getMainNoticeList();
		model.addAttribute("noticeList", noticeList);
		List<Review> PetReviewList = noticeService.getMainPetReviewList();
		model.addAttribute("PetReviewList", PetReviewList);
		List<Item> ItemList = noticeService.getMainItemList();
		model.addAttribute("ItemList", ItemList);
		return "homewoofBeta";
	}
}
