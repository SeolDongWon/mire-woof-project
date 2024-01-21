package com.woof.controller;

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
import com.woof.service.PetService;
import com.woof.service.ReviewService;

import lombok.extern.java.Log;

@Log
@Controller
public class HomeController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private PetService petService;
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/")
	public String home(Locale locale, Model model, Account account) throws Exception {

		List<Item> itemList = itemService.getMainItemList();
		model.addAttribute("itemList", itemList);
		log.info("itemList : " + itemList.toString());
		
		List<Pet> petList = petService.getMainPetList();
		model.addAttribute("petList", petList);
		log.info("petList : " + petList.toString());
		
		List<Notice> noticeList = noticeService.getMainNoticeList();
		model.addAttribute("noticeList", noticeList);
		log.info("noticeList : " + noticeList.toString());
		
		List<Review> reviewList = reviewService.getMainReviewList();
		model.addAttribute("reviewList", reviewList);
		log.info("PetReviewList : " + reviewList.toString());
		
		return "homewoof";
	}
}
