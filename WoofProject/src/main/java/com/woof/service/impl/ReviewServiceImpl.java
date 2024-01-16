package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woof.domain.Review;
import com.woof.mapper.ReviewMapper;
import com.woof.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public Review getReview(Review review) throws Exception {
		return mapper.getReview(review);
	}
	
	@Override
	public List<Review> getReviewList() throws Exception {
		return mapper.getReviewList();
	}
	
	@Override
	public void insertReview(Review review) throws Exception {
		mapper.insertReview(review);
		
	}


	



}
