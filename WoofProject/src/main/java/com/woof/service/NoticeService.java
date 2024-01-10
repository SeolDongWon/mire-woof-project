package com.woof.service;

import java.util.List;

import com.woof.domain.Notice;

public interface NoticeService {

	public Notice getNotice(Notice notice) throws Exception;

	public List<Notice> getNoticeList() throws Exception;
	
	public void insertNotice(Notice notice) throws Exception;
	
	public void modifyNotice(Notice notice) throws Exception;
	
	public void deleteNotice(Notice notice) throws Exception;
	
	
}
