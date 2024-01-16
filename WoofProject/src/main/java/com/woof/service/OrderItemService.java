package com.woof.service;

import java.util.List;

import com.woof.domain.OrderItem;

public interface OrderItemService {

	public void addToOrderItem(List<OrderItem> orderItem) throws Exception;
}
