package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woof.domain.Notice;
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

	@Override
	public List<Notice> getNoticeList() throws Exception {
		return mapper.getNoticeList();
	}

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

}
