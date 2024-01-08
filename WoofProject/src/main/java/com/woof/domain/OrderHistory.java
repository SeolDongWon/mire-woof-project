package com.woof.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderHistory {

	private int orderHistoryNo;
	private String username;
	private int totalPrice;
	private String address;
	private Date orderDate;
}
