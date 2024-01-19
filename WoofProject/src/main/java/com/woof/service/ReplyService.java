package com.woof.service;

import java.util.List;

import com.woof.domain.PageRequest;
import com.woof.domain.Reply;

public interface ReplyService {
	
	public Reply getReply(Reply reply) throws Exception;

	public void insertReply(Reply reply) throws Exception;

	public void modifyReply(Reply reply) throws Exception;

	public void deleteReply(Reply reply) throws Exception;
	
	public int countReplyList(PageRequest pageRequest) throws Exception;
	
	public List<Reply> getReplyList(PageRequest pageRequest) throws Exception;
}
