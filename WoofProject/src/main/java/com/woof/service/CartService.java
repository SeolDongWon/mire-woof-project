package com.woof.service;

import java.util.List;

import com.woof.domain.Cart;

public interface CartService {
	
	public void addToCart(Cart cart) throws Exception;
	
	public List<Cart> getCart(Cart cart) throws Exception;
	
	public List<Cart> getOrder(List<String> selectedItems/* , username */) throws Exception;
	
//	public void changeCheckStatus(Cart cart) throws Exception;
	
	public void removeFromCart(String itemNo) throws Exception;
	
	public void removeChecked(List<String> selectedItems/*, username */) throws Exception;
	
	public void modifyQuantity(Cart cart) throws Exception;
}
