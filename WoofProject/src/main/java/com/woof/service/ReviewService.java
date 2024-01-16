package com.woof.service;

import java.util.List;

import com.woof.domain.Review;

public interface ReviewService {

	Review getReview(Review review) throws Exception;
	
	void insertReview(Review review) throws Exception;

	public List<Review> getReviewList() throws Exception;

	


}
