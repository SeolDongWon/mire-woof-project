package com.woof.mapper;

import java.util.List;

import com.woof.domain.PageRequest;
import com.woof.domain.Pagination;
import com.woof.domain.Review;

public interface ReviewMapper {

	Review getReview(Review review) throws Exception;

	List<Review> getReviewList(PageRequest pageRequest) throws Exception;
	List<Review> getItemReviewList(PageRequest pageRequest) throws Exception;

	void insertPetReview(Review review) throws Exception;

	void modifyReview(Review review) throws Exception;

	void deleteReview(Review review) throws Exception;

	String getReviewPic(Integer reviewNo) throws Exception;

	// 게시글 전체 건수를 반환
	int countReviewList(PageRequest pageRequest);
	
	int countItemReviewList(PageRequest pageRequest);
	
	public List<Review> getMainReviewList() throws Exception;
	
}
