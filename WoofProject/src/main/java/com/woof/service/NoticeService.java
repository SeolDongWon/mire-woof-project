package com.woof.service;

import java.util.List;

import com.woof.domain.Item;
import com.woof.domain.Notice;
import com.woof.domain.PageRequest;
import com.woof.domain.Pet;
import com.woof.domain.Review;

public interface NoticeService {

	public Notice getNotice(Notice notice) throws Exception;

	public void insertNotice(Notice notice) throws Exception;

	public void modifyNotice(Notice notice) throws Exception;

	public void deleteNotice(Notice notice) throws Exception;

	public void addNoticeViewCount(Notice notice) throws Exception;

	public int countNoticeList(PageRequest pageRequest) throws Exception;

	public List<Notice> getNoticeList(PageRequest pageRequest) throws Exception;
	
	public List<Notice> getMainNoticeList() throws Exception;
	
	public List<Pet> getMainPetList() throws Exception;
	
	public List<Review> getMainPetReviewList() throws Exception;
	
	public List<Item> getMainItemList() throws Exception;
}
