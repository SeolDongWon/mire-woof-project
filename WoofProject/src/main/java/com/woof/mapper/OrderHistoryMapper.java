package com.woof.mapper;

import java.util.List;

import com.woof.domain.OrderHistory;

public interface OrderHistoryMapper {

	public OrderHistory getOrderHistory(String username, OrderHistory orderHistory) throws Exception;
	
	public List<OrderHistory> getOrderHistoryList(String username) throws Exception;
	
	public void addToOrderHistory(String username, OrderHistory orderHistory) throws Exception;
}
