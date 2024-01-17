package com.woof.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderItem {

	private int orderHistoryNo;
	private int itemNo;
	private String itemName;
	private int itemQuantity;
	private int itemPrice;
	private String itemMainPic;
}
