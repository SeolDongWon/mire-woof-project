package com.woof.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woof.domain.Review;
import com.woof.service.ReviewService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/review")
@MapperScan(basePackages = "com.woof.mapper")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@GetMapping(value = "/getReview")
	public void insertForm(Review review , Model model)throws Exception{
		log.info("getReview");
	}
	
	@PostMapping(value = "/getReview")
	public String insert(Review review , Model model)throws Exception{
		service.insertReview(review);
		log.info("등록이 완료됨");
		return "/pet/petReviewList";
	}
	
	@RequestMapping(value = "/getReviewList")
	public String getReviewList(Review review , Model model) throws Exception{
		List<Review> reviewList = service.getReviewList();
		model.addAttribute("reviewList", reviewList);
		return "/pet/petReviewList";
	}
	
	
}
