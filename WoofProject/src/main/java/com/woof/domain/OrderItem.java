package com.woof.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderItem {

	private int orderNo;
	private int itemNo;
	private String itemName;
	private int quantity;
	private int price;
	private String itemMainPic;
}
