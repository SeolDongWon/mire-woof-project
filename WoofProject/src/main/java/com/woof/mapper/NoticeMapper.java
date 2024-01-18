package com.woof.mapper;

import java.util.List;

import com.woof.domain.Item;
import com.woof.domain.Notice;
import com.woof.domain.PageRequest;
import com.woof.domain.Pet;
import com.woof.domain.Review;

public interface NoticeMapper {

	public Notice getNotice(Notice notice) throws Exception;

//	public List<Notice> getNoticeList(Search noticeSearch) throws Exception;
	
	public List<Notice> getNoticeList(PageRequest pageRequest) throws Exception;

	public void insertNotice(Notice notice) throws Exception;

	public void modifyNotice(Notice notice) throws Exception;

	public void deleteNotice(Notice notice) throws Exception;

	public void addNoticeViewCount(Notice notice) throws Exception;

	// 게시글 전체 건수를 반환한다.
	public int countNoticeList(PageRequest pageRequest) throws Exception;
	
	public List<Notice> getNoticePageList(PageRequest pageRequest) throws Exception;
	
	public List<Notice> getMainNoticeList() throws Exception;
	
}
