package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woof.domain.Cart;
import com.woof.mapper.CartMapper;
import com.woof.service.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired 
	private CartMapper mapper;
	
	@Override
	public void addToCart(Cart cart) throws Exception {
		mapper.addToCart(cart);
	}

	@Override
	public List<Cart> getCart(Cart cart) throws Exception {
		return mapper.getCart(cart);
	}

	@Override
	public List<Cart> getOrder(Cart cart) throws Exception {
		return mapper.getOrder(cart);
	}

	@Override
	public void changeCheckStatus(Cart cart) throws Exception {
		mapper.changeCheckStatus(cart);
	}

	@Override
	public void removeFromCart(Cart cart) throws Exception {
		mapper.removeFromCart(cart);
	}

	@Override
	public void removeChecked(Cart cart) throws Exception {
		mapper.removeChecked(cart);
	}

	@Override
	public void modifyQuantity(Cart cart) throws Exception {
		mapper.modifyQuantity(cart);
	}
	
}
