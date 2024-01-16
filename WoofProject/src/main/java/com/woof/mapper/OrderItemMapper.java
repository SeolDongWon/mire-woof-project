package com.woof.mapper;

import java.util.List;

import com.woof.domain.OrderItem;

public interface OrderItemMapper {

	public void addToOrderItem(List<OrderItem> orderItem) throws Exception;
	
}
