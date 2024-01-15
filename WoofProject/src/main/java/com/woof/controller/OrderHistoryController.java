package com.woof.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woof.service.OrderHistoryService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/orderHistory")
public class OrderHistoryController {
	
	@Autowired
	private OrderHistoryService orderHistoryService;
	
	@PostMapping("/getOrderHistory")
	public void getOrderHistory() {
		log.info("/getOrderHistory POST");
	}
	
	@PostMapping("/getOrderHistoryList")
	public String getOrderHistoryList() {
		log.info("/getOrderHistoryList POST");
		return null;
	}
	
	@PostMapping("addToOrderHistory")
	public String addToOrderHistory() {
		log.info("addToOrderHistory POST");
		return null;
	}
}
