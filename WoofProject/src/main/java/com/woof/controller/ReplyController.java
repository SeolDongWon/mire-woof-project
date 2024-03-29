package com.woof.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woof.domain.Account;
import com.woof.domain.PageRequest;
import com.woof.domain.Pagination;
import com.woof.domain.Reply;
import com.woof.domain.Review;
import com.woof.service.ReplyService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	private ReplyService replyService;

	@GetMapping("/getReplyList")
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

	@GetMapping("/insertReplyForm")
	public String insertReplyForm(Model model, Principal principal, Account account, Review review) throws Exception {
		log.info("insertReplyForm");

		if (null != principal) {
			account.setUsername(principal.getName());
			log.info(principal.getName());
			model.addAttribute(account);
		}

		return "reply/insertReply";
	}

//	@PostMapping("/insertReply")
//	public String insertReply(Reply reply) throws Exception {
//		log.info("insertReply");
//		log.info("reply : " + reply.toString());
//		replyService.insertReply(reply);
//
//		// 샘플작성
//		String desc = reply.getReply();
//		for (int i = 0; i < 30; i++) {
//			reply.setReply(desc + i);
//			replyService.insertReply(reply);
//		}
//
//		return "redirect:/reply/getReplyList";
//	}

	@PutMapping("/insertReply")
	public ResponseEntity<List> insertReply(@RequestBody Reply reply, PageRequest pageRequest) throws Exception {
		log.info("insertReply");
//		log.info("reply : " + reply.toString());

		if (reply.getReply() != null && !reply.getReply().equals("")) {
//			log.info("reply : " + reply.toString());

			replyService.insertReply(reply);
			
//////////////////샘플 작성			
//			String desc = reply.getReply();
//			for(int i=0;i<30;i++) {
//				reply.setReply(desc+i);
//				replyService.insertReply(reply);	
//			}
		}

		List<Reply> replyList = replyService.getReplyList(pageRequest);
		ResponseEntity<List> entity = null;
		if (replyList.size() != 0) {
			entity = new ResponseEntity<List>(replyList, HttpStatus.OK);
		}
		return entity;
	}

	@PutMapping("/getReplyList")
	public ResponseEntity<List> getReplyList(@RequestBody PageRequest pageRequest, Pagination pagination)
			throws Exception {
		log.info("getReplyList");

		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(replyService.countReplyList(pageRequest));

//		log.info("pagination3 : " + pagination.toString());
//		log.info("pageRequest3 : " + pageRequest.toString());

		List<Reply> replyList = replyService.getReplyList(pageRequest);
		ResponseEntity<List> entity = null;
		if (replyList.size() != 0) {
			entity = new ResponseEntity<List>(replyList, HttpStatus.OK);
			log.info("replyList : " + replyList.toString());
		}
		return entity;
	}

	@PutMapping("/getReplyPage")
	public ResponseEntity<List> getReplyPage(@RequestBody PageRequest pageRequest, Pagination pagination)
			throws Exception {
		log.info("getReplyPage");
//		log.info("pageRequest1 : " + pageRequest.toString());

		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(replyService.countReplyList(pageRequest));
//		log.info("pagination3 : " + pagination.toString());
//		log.info("pageRequest3 : " + pageRequest.toString());
		List<Pagination> pageList = new ArrayList<Pagination>();
		pageList.add(pagination);

		ResponseEntity<List> entity = new ResponseEntity<List>(pageList, HttpStatus.OK);
		return entity;
	}

	@PutMapping("/deleteReply")
	public ResponseEntity<List> deleteReply(@RequestBody Reply reply) throws Exception {
		replyService.deleteReply(reply);
		ResponseEntity<List> entity = null;
		return entity;
	}

	// ======================================임시 리뷰
	// 컨트롤러==========================================

//	@RequestMapping("/getItemReviewList")
//	public String getitemReviewList(Model model, PageRequest pageRequest, Pagination pagination, Principal principal,
//			Account account) throws Exception {
//		log.info("getitemReviewList");
//
//		return "reply/itemReviewList";
//	}
	
//	@RequestMapping("/insertItemReviewForm")
//	public String insertItemReviewForm(Model model, Principal principal, Account account) throws Exception {
//		log.info("insertItemReviewForm");
//		if (null != principal) {
//			account.setUsername(principal.getName());
//			log.info(principal.getName());
//			model.addAttribute(account);
//		}
//
//		return "reply/insertItemReview";
//	}
	
//	@PostMapping("/insertItemReview")
//	public String insertItemReview() {
//		log.info("insertItemReview");
//		
//		
//		return "redirect:/reply/getItemReviewList";
//	}

}
