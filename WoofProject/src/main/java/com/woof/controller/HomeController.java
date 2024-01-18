package com.woof.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.woof.domain.Account;
import com.woof.domain.Item;
import com.woof.domain.Notice;
import com.woof.domain.Pet;
import com.woof.domain.Review;
import com.woof.service.ItemService;
import com.woof.service.NoticeService;

@Controller
public class HomeController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/")
	public String home(Locale locale, Model model,Account account) throws Exception {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		
		List<Item> itemList = itemService.getItemList();
		model.addAttribute("itemList", itemList);
		
		List<Pet> petList = noticeService.getMainPetList();
		model.addAttribute("petList", petList);
		
		List<Notice> noticeList = noticeService.getMainNoticeList();
		model.addAttribute("noticeList", noticeList);
		
		List<Review> PetReviewList = noticeService.getMainPetReviewList();
		model.addAttribute("PetReviewList", PetReviewList);

		return "homewoof";
	}
}
