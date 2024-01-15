package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woof.domain.Notice;
import com.woof.domain.PageRequest;
import com.woof.mapper.NoticeMapper;
import com.woof.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;

	@Override
	public Notice getNotice(Notice notice) throws Exception {
		return mapper.getNotice(notice);
	}

//	@Override
//	public List<Notice> getNoticeList(Search noticeSearch) throws Exception {
//		return mapper.getNoticeList(noticeSearch);
//	}

	@Transactional
	@Override
	public void insertNotice(Notice notice) throws Exception {
		mapper.insertNotice(notice);
	}

	@Override
	public void modifyNotice(Notice notice) throws Exception {
		mapper.modifyNotice(notice);
	}

	@Override
	public void deleteNotice(Notice notice) throws Exception {
		mapper.deleteNotice(notice);

	}

	@Override
	public void addNoticeViewCount(Notice notice) throws Exception {
		mapper.addNoticeViewCount(notice);
	}

	// 게시글 전체 건수를 반환한다.
	@Override
	public int countNoticeList(PageRequest pageRequest) throws Exception {
		return mapper.countNoticeList(pageRequest);
	}
	
	public List<Notice> getNoticePageList(PageRequest pageRequest) throws Exception{
		return mapper.getNoticePageList(pageRequest);
	}

	@Override
	public List<Notice> getNoticeList(PageRequest pageRequest) throws Exception {
		return mapper.getNoticeList(pageRequest);
	}
}
