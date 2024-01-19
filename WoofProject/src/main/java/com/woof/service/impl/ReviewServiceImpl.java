package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woof.domain.PageRequest;
import com.woof.domain.Pagination;
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
	public List<Review> getReviewList(PageRequest pageRequest) throws Exception {
		return mapper.getReviewList(pageRequest);
	}

	@Override
	public void insertPetReview(Review review) throws Exception {
		mapper.insertPetReview(review);

	}

	@Override
	public void modifyReview(Review review) throws Exception {
		mapper.modifyReview(review);

	}

	@Override
	public void deleteReview(Review review) throws Exception {
		mapper.deleteReview(review);

	}

	@Override
	public String getReviewPic(Integer reviewNo) throws Exception {
		return mapper.getReviewPic(reviewNo);
	}
	
	@Override
	public List<Review> getMainReviewList() throws Exception {
		return mapper.getMainReviewList();
	}

	@Override
	public int countReviewList(PageRequest pageRequest) {
		
		return mapper.countReviewList(pageRequest);
	}

}
