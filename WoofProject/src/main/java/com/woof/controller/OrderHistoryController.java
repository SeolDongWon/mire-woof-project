package com.woof.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
	
	// ADMIN function - view order history details from service inquiry via AJAX
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/getOrderHistory")
	public String getOrderHistory(String orderHistoryNo, Model model) throws Exception {
		OrderHistory orderHistory = new OrderHistory();
		orderHistory = orderHistoryService.getOrderHistory(orderHistoryNo);
		log.info("/getOrderHistory GET orderHistory: " + orderHistory.toString());
		model.addAttribute("orderHistory", orderHistory);
		return "account/myCart/getOrderHistory";
	}
	
	// USER function - get list of user order history
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/getOrderHistoryList")
	public String getOrderHistoryList(Model model, Principal principal) throws Exception {
		log.info("/getOrderHistoryList GET");
		String username = principal.getName();
		List<OrderHistory> orderHistoryList = orderHistoryService.getOrderHistoryList(username);
		model.addAttribute("orderHistoryList", orderHistoryList);
		return "account/myCart/myOrderHistoryList";
	}
	
	// USER function - called when an order is made from myOrder.jsp; insert orderHistory, insert list of orderItems, delete items from cart
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/addToOrderHistory")
	public String addToOrderHistory(@RequestParam("itemNo") List<String> itemNoList, OrderHistory orderHistory, Principal principal) throws Exception {
		log.info("/addToOrderHistory POST: " + orderHistory.toString());
		String username = principal.getName();
		
		// retrieve address details from Account to add to orderHistory
		Account account = new Account();
		account.setUsername(username);
		orderHistory.setUsername(username);
		account = accountService.getAccount(account);
		String address = account.getAddress();
		orderHistory.setAddress(address);
		
		// insert new orderHistory
		orderHistoryService.addToOrderHistory(orderHistory);
		// get MAX orderHistoryNo (from orderHistory just inserted)
		int orderHistoryNo = orderHistoryService.getOrderHistoryNo();
		
		// create orderItemList using info from inserted orderHistory
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		List<Cart> cartList = cartService.getOrder(itemNoList, username);
		for(Cart cart : cartList) {
			// iterate over cartList to create orderItem to add to orderItemList
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderHistoryNo(orderHistoryNo);
			orderItem.setItemNo(cart.getItemNo());
			orderItem.setItemName(cart.getItemName());
			orderItem.setItemQuantity(cart.getItemQuantity());
			orderItem.setItemPrice(cart.getItemPrice());
			orderItem.setItemMainPic(cart.getItemMainPic());
			orderItemList.add(orderItem);
		}
		
		// add orderItemList to database
		orderItemService.addToOrderItem(orderItemList);
		
		// iterate over newly added orderItemList to insert primary keys into selectedItems to delete items from cart 
		List<String> selectedItems = new ArrayList<String>();
		for(OrderItem item : orderItemList) {
			selectedItems.add(String.valueOf(item.getItemNo()));
		}
		cartService.removeChecked(selectedItems, username);
		return "redirect:/orderHistory/getOrderHistoryList";
	}
}
