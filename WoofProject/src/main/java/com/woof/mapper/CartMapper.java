package com.woof.mapper;

import java.util.List;

import com.woof.domain.Cart;
import com.woof.domain.Item;

public interface CartMapper {
	
	public void addToCart(Item item, String username, int itemQuantity) throws Exception;
	
	public List<Cart> getCart(String username) throws Exception;
	
	public List<Cart> getOrder(List<String> selectedItems, String username) throws Exception;
	
//	public void changeCheckStatus(Cart cart) throws Exception;
	
	public void removeFromCart(String itemNo, String username) throws Exception;
	
	public void removeChecked(List<String> selectedItems, String username) throws Exception;
	
	public void modifyQuantity(Cart cart) throws Exception;
}
