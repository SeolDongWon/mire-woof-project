package com.woof.service;

import java.util.List;

import com.woof.domain.OrderHistory;

public interface OrderHistoryService {

	public OrderHistory getOrderHistory(String orderHistoryNo) throws Exception;
	
	public List<OrderHistory> getOrderHistoryList(String username) throws Exception;
	
	public void addToOrderHistory(OrderHistory orderHistory) throws Exception; 
	
	public int getOrderHistoryNo() throws Exception;
}
