package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woof.domain.Cart;
import com.woof.domain.Item;
import com.woof.mapper.CartMapper;
import com.woof.service.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired 
	private CartMapper mapper;
	
	@Override
	public void addToCart(Item item, String username, int itemQuantity) throws Exception {
		mapper.addToCart(item, username, itemQuantity);
	}

	@Override
	public List<Cart> getCart(String username) throws Exception {
		return mapper.getCart(username);
	}

	@Override
	public List<Cart> getOrder(List<String> selectedItems, String username) throws Exception {
		return mapper.getOrder(selectedItems, username);
	}

//	@Override
//	public void changeCheckStatus(Cart cart) throws Exception {
//		mapper.changeCheckStatus(cart);
//	}

	@Override
	public void removeFromCart(String itemNo, String username) throws Exception {
		mapper.removeFromCart(itemNo, username);
	}

	@Override
	public void removeChecked(List<String> selectedItems, String username) throws Exception {
		mapper.removeChecked(selectedItems, username);
	}

	@Override
	public void modifyQuantity(Cart cart) throws Exception {
		mapper.modifyQuantity(cart);
	}
	
}
