package com.woof.mapper;

import java.util.List;

import com.woof.domain.Review;

public interface ReviewMapper {

	Review getReview(Review review)throws Exception;
	
	
	void insertReview(Review review)throws Exception;

	List<Review> getReviewList()throws Exception;



}
