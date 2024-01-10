package com.woof.mapper;

import java.util.List;

import com.woof.domain.Notice;

public interface NoticeMapper {
	
	public Notice getNotice(Notice notice) throws Exception;

	public List<Notice> getNoticeList() throws Exception;

	public void insertNotice(Notice notice) throws Exception;

	public void modifyNotice(Notice notice) throws Exception;

	public void deleteNotice(Notice notice) throws Exception;
}
