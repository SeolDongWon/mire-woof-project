package com.woof.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woof.domain.Account;
import com.woof.domain.Cart;
import com.woof.domain.OrderHistory;
import com.woof.domain.OrderItem;
import com.woof.service.AccountService;
import com.woof.service.CartService;
import com.woof.service.OrderHistoryService;
import com.woof.service.OrderItemService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/orderHistory")
public class OrderHistoryController {
	
	@Autowired
	private OrderHistoryService orderHistoryService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired 
	private OrderItemService orderItemService; 
	
	@Autowired
	private CartService cartService; 
	
	@PostMapping("/getOrderHistory")
	public void getOrderHistory() throws Exception {
		log.info("/getOrderHistory POST");
	}
	
	@GetMapping("/getOrderHistoryList")
	public String getOrderHistoryList(Model model, Principal principal) throws Exception {
		log.info("/getOrderHistoryList GET");
		String username = principal.getName();
		List<OrderHistory> orderHistoryList = orderHistoryService.getOrderHistoryList(username);
		log.info("/getOrderHistoryList GET orderHistoryList: " + orderHistoryList);
		model.addAttribute("orderHistoryList", orderHistoryList);
		return "account/myCart/myOrderHistoryList";
	}
	
	@PostMapping("/addToOrderHistory")
	public String addToOrderHistory(@RequestParam("itemNo") List<String> itemNoList, OrderHistory orderHistory, Principal principal, Account account) throws Exception {
		log.info("/addToOrderHistory POST: " + orderHistory.toString());
		String username = principal.getName();
		account.setUsername(username);
		orderHistory.setUsername(username);
		log.info("account: " + account.toString());
		account = accountService.getAccount(account);
		log.info("account: " + account.toString());
		String address = account.getAddress();
		orderHistory.setAddress(address);
		log.info("/addToOrderHistory POST orderHistory: " + orderHistory.toString() + ", itemNoList: " + itemNoList.toString());
		
		orderHistoryService.addToOrderHistory(orderHistory);
		
		int orderHistoryNo = orderHistoryService.getOrderHistoryNo();
		
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		List<Cart> cartList = cartService.getOrder(itemNoList, username);
		for(Cart cart : cartList) {
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderHistoryNo(orderHistoryNo);
			orderItem.setItemNo(cart.getItemNo());
			orderItem.setItemName(cart.getItemName());
			orderItem.setItemQuantity(cart.getItemQuantity());
			orderItem.setItemPrice(cart.getItemPrice());
			orderItem.setItemMainPic(cart.getItemMainPic());
			orderItemList.add(orderItem);
		}
		
		log.info("/addToOrderHistory POST orderItemList: " + orderItemList.toString());
		
		orderItemService.addToOrderItem(orderItemList);
		
		List<String> selectedItems = new ArrayList<String>();
		for(OrderItem item : orderItemList) {
			selectedItems.add(String.valueOf(item.getItemNo()));
		}
		cartService.removeChecked(selectedItems, username);
		return "redirect:/orderHistory/getOrderHistoryList";
	}
}
