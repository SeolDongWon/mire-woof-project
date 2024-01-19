package com.woof.mapper;

import java.util.List;

import com.woof.domain.Review;

public interface ReviewMapper {

	Review getReview(Review review) throws Exception;

	List<Review> getReviewList() throws Exception;

	void insertPetReview(Review review) throws Exception;

	void modifyReview(Review review) throws Exception;

	void deleteReview(Review review) throws Exception;

	String getReviewPic(Integer reviewNo) throws Exception;

	public List<Review> getMainReviewList() throws Exception;
}
