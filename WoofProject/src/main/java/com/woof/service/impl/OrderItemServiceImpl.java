package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woof.domain.OrderItem;
import com.woof.mapper.OrderItemMapper;
import com.woof.service.OrderItemService;

@Service
public class OrderItemServiceImpl implements OrderItemService {

	@Autowired
	private OrderItemMapper mapper; 
	
	@Override
	public void addToOrderItem(List<OrderItem> orderItem) throws Exception {
		mapper.addToOrderItem(orderItem);		
	}

}
