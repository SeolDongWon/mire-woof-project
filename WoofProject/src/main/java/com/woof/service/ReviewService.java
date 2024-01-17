package com.woof.service;

import java.util.List;

import com.woof.domain.Review;

public interface ReviewService {

	Review getReview(Review review) throws Exception;
	
	void insertPetReview(Review review) throws Exception;

	public List<Review> getReviewList() throws Exception;

	public void modifyReview(Review review) throws Exception;

	void deleteReview(Review review)throws Exception;
	
	// 사진 파일 불러오기
	String getReviewPic(Integer reviewNo)throws Exception;

	


}
