package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woof.domain.PageRequest;
import com.woof.domain.Reply;
import com.woof.mapper.ReplyMapper;
import com.woof.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper mapper; 

	@Override
	public Reply getReply(Reply reply) throws Exception {
		return mapper.getReply(reply);
	}

	@Override
	public void insertReply(Reply reply) throws Exception {
		mapper.insertReply(reply);
	}

	@Override
	public void modifyReply(Reply reply) throws Exception {
		mapper.modifyReply(reply);
	}

	@Override
	public void deleteReply(Reply reply) throws Exception {
		mapper.deleteReply(reply);
	}

	@Override
	public int countReplyList(PageRequest pageRequest) throws Exception {
		return mapper.countReplyList(pageRequest);
	}

	@Override
	public List<Reply> getReplyList(PageRequest pageRequest) throws Exception {
		return mapper.getReplyList(pageRequest);
	}

}
