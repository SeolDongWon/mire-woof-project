package com.woof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woof.domain.OrderItem;
import com.woof.service.OrderItemService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/orderItem")
public class OrderItemController {

	@Autowired
	private OrderItemService orderItemService;
	
	// ADMIN and USER function - get details of items in an orderHistory
	@GetMapping("/getOrderItemList")
	public String getOrderItemList(@RequestParam("orderHistoryNo") int orderHistoryNo, Model model) throws Exception {
		log.info("/getOrderItemList GET orderHistoryNo: " + orderHistoryNo);
		List<OrderItem> orderItemList = orderItemService.getOrderItemList(orderHistoryNo);
		model.addAttribute("orderNo", orderHistoryNo);
		model.addAttribute("orderItemList", orderItemList);
		return "account/myCart/myOrderItemList";
	}
}
