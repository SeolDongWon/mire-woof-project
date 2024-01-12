package com.woof.mapper;

import java.util.List;

import com.woof.domain.Cart;

public interface CartMapper {
	
	public void addToCart(Cart cart) throws Exception;
	
	public List<Cart> getCart(Cart cart) throws Exception;
	
	public List<Cart> getOrder(List<String> selectedItems /* , String username */) throws Exception;
	
//	public void changeCheckStatus(Cart cart) throws Exception;
	
	public void removeFromCart(String itemNo) throws Exception;
	
	public void removeChecked(List<String> selectedItems /* String username */) throws Exception;
	
	public void modifyQuantity(Cart cart) throws Exception;
}
