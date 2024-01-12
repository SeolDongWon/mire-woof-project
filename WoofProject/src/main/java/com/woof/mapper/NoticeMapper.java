package com.woof.mapper;

import java.util.List;

import com.woof.domain.Notice;
import com.woof.domain.Search;

public interface NoticeMapper {
	
	public Notice getNotice(Notice notice) throws Exception;

	public List<Notice> getNoticeList(Search noticeSearch) throws Exception;

	public void insertNotice(Notice notice) throws Exception;

	public void modifyNotice(Notice notice) throws Exception;

	public void deleteNotice(Notice notice) throws Exception;

	public void addNoticeViewCount(Notice notice) throws Exception;
}
