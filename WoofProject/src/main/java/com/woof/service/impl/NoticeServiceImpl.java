package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woof.domain.Item;
import com.woof.domain.Notice;
import com.woof.domain.PageRequest;
import com.woof.domain.Pet;
import com.woof.domain.Review;
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

	@Override
	public int countNoticeList(PageRequest pageRequest) throws Exception {
		return mapper.countNoticeList(pageRequest);
	}

	@Override
	public List<Notice> getNoticeList(PageRequest pageRequest) throws Exception {
		return mapper.getNoticeList(pageRequest);
	}

	@Override
	public List<Notice> getMainNoticeList() throws Exception {
		return mapper.getMainNoticeList();
	}

	
}
