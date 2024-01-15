package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woof.domain.OrderHistory;
import com.woof.mapper.OrderHistoryMapper;
import com.woof.service.OrderHistoryService;

@Service
public class OrderHistoryServiceImpl implements OrderHistoryService {

	@Autowired
	private OrderHistoryMapper mapper;
	
	@Override
	public OrderHistory getOrderHistory(String username, OrderHistory orderHistory) throws Exception {
		return mapper.getOrderHistory(username, orderHistory);
	}
	
	@Override
	public List<OrderHistory> getOrderHistoryList(String username) throws Exception {
		return mapper.getOrderHistoryList(username);
	}

	@Override
	public void addToOrderHistory(String username, OrderHistory orderHistory) throws Exception {
		mapper.addToOrderHistory(username, orderHistory);
	}
}
