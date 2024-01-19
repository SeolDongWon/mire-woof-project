package com.woof.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.MergedAnnotations.Search;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woof.domain.Account;
import com.woof.domain.Notice;
import com.woof.domain.PageRequest;
import com.woof.domain.Pagination;
import com.woof.domain.Reply;
import com.woof.service.ReplyService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	private ReplyService replyService;

	@RequestMapping(value = "/getReplyList")
	public String getReplyList(Model model, PageRequest pageRequest, Pagination pagination, Principal principal,
			Account account) throws Exception {
		log.info("getServiceList");


		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(replyService.countReplyList(pageRequest));
		model.addAttribute("pagination", pagination);
		
		List<Reply> replyList = replyService.getReplyList(pageRequest);
		model.addAttribute("replyList", replyList);
		
		if (null != principal) {
			account.setUsername(principal.getName());
			log.info(principal.getName());
			model.addAttribute(account);
		}
		
		return "reply/replyList";
	}
	
	@RequestMapping(value = "/insertReply")
	public String insertReply(Reply reply) throws Exception {
		log.info("insertReply");
		log.info("reply : " + reply.toString());
		replyService.insertReply(reply);

		// 샘플작성
//		String desc = reply.getReply();
//		for (int i = 0; i < 30; i++) {
//			reply.setReply(desc + i);
//			replyService.insertReply(reply);
//		}
		
		return "redirect:/reply/getReplyList";
	}
	
	@PutMapping(value = "/getReplyListAjax")
	public ResponseEntity<List> getReplyListAjax(PageRequest pageRequest) throws Exception {
		log.info("getNoticeListAjaxPut");


		List<Reply> replyList = replyService.getReplyList(pageRequest);
		ResponseEntity<List> entity = null;
		if (replyList.size() != 0) {
			entity = new ResponseEntity<List>(replyList, HttpStatus.OK);
		}
		return entity;
	}

}
