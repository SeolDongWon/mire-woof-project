package com.woof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woof.domain.Cart;
import com.woof.service.CartService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/account/myCart")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@RequestMapping("/addToCart")
	public void addToCart(Cart cart) throws Exception {
		cartService.addToCart(null);
	}
	
	@GetMapping("/myCart")
	public String getCart(Cart cart, Model model) throws Exception {
		log.info("/myCart GET");
		// for test
		List<Cart> cartList = cartService.getCart(cart);
		log.info("cartList: " + cartList.toString());
		model.addAttribute("cartList", cartList);
		return "account/myCart/myCart";
	}
		
	@PostMapping("/getOrder")
	public String getOrder(@RequestParam("selectedItems") List<String> selectedItems, Cart cart, Model model) throws Exception {
		log.info("/getOrder POST selectedItems: " + selectedItems.toString());
//		String username = cart.getUsername();
		List<Cart> cartList = cartService.getOrder(selectedItems/*, username*/);
		model.addAttribute("cartList", cartList);
		log.info("/getOrder cartList: " + cartList);
		return "account/myCart/myOrder";
	}
	
	@PostMapping("/removeChecked")
	public ResponseEntity<String> removeChecked(@RequestBody List<String> selectedItems, Cart cart) throws Exception {
		log.info("/removeChecked POST selectedItems: " + selectedItems);
		cartService.removeChecked(selectedItems/*, username*/);
		return ResponseEntity.ok("Items removed successfully");
	}

	@PostMapping("/removeFromCart")
	public ResponseEntity<String> removeFromCart(@RequestBody String itemNo) throws Exception {
		log.info("/removeFromCart POST itemNo: " + itemNo);
		String itemNo_ = itemNo.replaceAll("\"", "");
		log.info("/removeFromCart POST itemNo_: " + itemNo_);
		cartService.removeFromCart(itemNo_);
		return ResponseEntity.ok("Item removed successfully");
	}
	
//	@RequestMapping("/changeCheckStatus")
//	public void changeCheckStatus(Cart cart) throws Exception {
//		cartService.changeCheckStatus(cart);
//	}
	
	@RequestMapping("/modifyQuantity")
	public void modifyQuantity(Cart cart) throws Exception {
		cartService.modifyQuantity(cart);
	}
}
