package com.woof.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Service {
	private int serviceNo;
	private String username;
	private int itemNo;
	private int petNo;
	private String serviceDesc;
	private String response;
	private Date serviceRegDate;
	private Date responseRegDate;
	
}
