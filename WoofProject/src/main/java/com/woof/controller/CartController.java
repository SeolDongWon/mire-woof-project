package com.woof.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;

	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/addToCart")
	public String addToCart(@RequestParam("itemQuantity") int itemQuantity, Item item, Principal principal, Model model) throws Exception {
		String username = principal.getName();
		log.info("/addToCart POST: " + item + ", itemQuantity: " + itemQuantity + ", username: " + username);
		String itemNo = String.valueOf(item.getItemNo()); 
		cartService.addToCart(item, username, itemQuantity);
		cartService.deleteDuplicateRows(itemNo, username);
		return "redirect:/cart/myCart";
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/myCart")
	public String getCart(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		log.info("/myCart GET: username: " + username);
		// for test
		List<Cart> cartList = cartService.getCart(username);
		model.addAttribute("cartList", cartList);
		return "account/myCart/myCart";
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/getOrder")
	public String getOrder(@RequestParam("selectedItems") List<String> selectedItems, Principal principal, Cart cart, Model model) throws Exception {
		String username = principal.getName();
		log.info("/getOrder POST selectedItems: " + selectedItems.toString() + ", username: " + username);
		List<Cart> cartList = cartService.getOrder(selectedItems, username);
		int totalPrice = calculateTotalPrice(cartList);
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("totalPrice", totalPrice);
		return "account/myCart/myOrder";
	}
	
	private int calculateTotalPrice(List<Cart> cartList) {
		int totalPrice = 0;
		for(Cart cart : cartList) {
			int itemQuantity = cart.getItemQuantity();
			int itemPrice = cart.getItemPrice();
			totalPrice += itemQuantity * itemPrice;
		}
		return totalPrice;
	}

	@PostMapping("/removeChecked")
	public ResponseEntity<String> removeChecked(@RequestBody Map<String, Object> requestData, Principal principal) throws Exception {
		log.info("/removeChecked POST requestBody: " + requestData.toString());
		
		List<String> selectedItems = (List<String>) requestData.get("selectedItems");
		String username = principal.getName();
		
		cartService.removeChecked(selectedItems, username);
		return ResponseEntity.ok("Items removed successfully");
	}

	@PostMapping("/removeFromCart")
	public ResponseEntity<String> removeFromCart(@RequestBody Map<String, Object> requestData, Principal principal) throws Exception {
		log.info("/removeFromCart POST requestBody: " + requestData.toString());
		
		String itemNo = (String) requestData.get("itemNo");
		String username = principal.getName();
		
		cartService.removeFromCart(itemNo, username);
		return ResponseEntity.ok("Item removed successfully");
	}
	
//	@RequestMapping("/changeCheckStatus")
//	public void changeCheckStatus(Cart cart) throws Exception {
//		cartService.changeCheckStatus(cart);
//	}
	
	@PostMapping("/modifyQuantity")
	public ResponseEntity<String> modifyQuantity(@RequestBody Map<String, Object> requestData, Principal principal) throws Exception {
		log.info("/modifyQuantity: requestData: " + requestData.toString());
		
		Cart cart = new Cart();
		cart.setItemNo(Integer.parseInt(requestData.get("itemNo").toString()));
		cart.setUsername(principal.getName());
		cart.setNewQuantity(Integer.parseInt(requestData.get("newQuantity").toString()));
		cartService.modifyQuantity(cart);
		
		return ResponseEntity.ok("Quantity updated");
	}
}
