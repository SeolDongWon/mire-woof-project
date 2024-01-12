package com.woof.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woof.domain.Cart;
import com.woof.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@RequestMapping("/addToCart")
	public void addToCart(Cart cart) throws Exception {
		cartService.addToCart(null);
	}
	
	@RequestMapping("/getCart")
	public void getCart(Cart cart, Model model) throws Exception {
		List<Cart> cartList = cartService.getCart(cart);
		model.addAttribute("cartList", cartList);
	}
		
	@RequestMapping("/getOrder")
	public void getOrder(Cart cart, Model model) throws Exception {
		List<Cart> cartList = cartService.getOrder(cart);
		model.addAttribute("cartList", cartList);
	}
	
	@RequestMapping("/changeCheckStatus")
	public void changeCheckStatus(Cart cart) throws Exception {
		cartService.changeCheckStatus(cart);
	}
	
	@RequestMapping("/removeFromCart")
	public void removeFromCart(Cart cart) throws Exception {
		cartService.removeFromCart(cart);
	}
	
	@RequestMapping("/removeChecked")
	public void removeChecked(Cart cart) throws Exception {
		cartService.removeChecked(cart);
	}
	
	@RequestMapping("/modifyQuantity")
	public void modifyQuantity(Cart cart) throws Exception {
		cartService.modifyQuantity(cart);
	}
}
