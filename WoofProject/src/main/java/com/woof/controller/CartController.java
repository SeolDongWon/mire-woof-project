package com.woof.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woof.domain.Cart;
import com.woof.domain.Item;
import com.woof.service.CartService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/account/myCart")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@PostMapping("/addToCart")
	public String addToCart(@ModelAttribute("item") Item item, @RequestParam("itemQuantity") int itemQuantity, @RequestParam("username") String username, Model model) throws Exception {
		log.info("/addToCart POST: " + item + ", itemQuantity: " + itemQuantity + ", username: " + username);
		cartService.addToCart(item, username, itemQuantity);
		return "redirect:/item/itemList";
	}
	
	@GetMapping("/myCart")
	public String getCart(@RequestParam("username") String username, Model model) throws Exception {
		log.info("/myCart GET: username: " + username);
		// for test
		List<Cart> cartList = cartService.getCart(username);
		log.info("/myCart GET: cartList: " + cartList.toString());
		model.addAttribute("cartList", cartList);
		return "account/myCart/myCart";
	}
		
	@PostMapping("/getOrder")
	public String getOrder(@RequestParam("selectedItems") List<String> selectedItems, @RequestParam("username") String username, Cart cart, Model model) throws Exception {
		log.info("/getOrder POST selectedItems: " + selectedItems.toString() + ", username: " + username);
		List<Cart> cartList = cartService.getOrder(selectedItems, username);
		model.addAttribute("cartList", cartList);
		log.info("/getOrder cartList: " + cartList);
		return "account/myCart/myOrder";
	}
	
	@PostMapping("/removeChecked")
	public ResponseEntity<String> removeChecked(@RequestBody Map<String, Object> requestBody) throws Exception {
		log.info("/removeChecked POST requestBody: " + requestBody.toString());
		
		List<String> selectedItems = (List<String>) requestBody.get("selectedItems");
		String username = (String) requestBody.get("username");
		
		log.info("/removeChecked POST selectedItems: " + selectedItems.toString() + ", username: " + username);
		cartService.removeChecked(selectedItems, username);
		return ResponseEntity.ok("Items removed successfully");
	}

	@PostMapping("/removeFromCart")
	public ResponseEntity<String> removeFromCart(@RequestBody Map<String, Object> requestBody) throws Exception {
		log.info("/removeFromCart POST requestBody: " + requestBody.toString());
		
		String itemNo = (String) requestBody.get("itemNo");
		String username = (String) requestBody.get("username");
		
		log.info("/removeFromCart POST itemNo: " + itemNo + ", username: " + username);
		cartService.removeFromCart(itemNo, username);
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
