package com.woof.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Account {

	private String username;
	private String password;
	private String name;
	private String tel;
	private String address;
	private String state;
	@DateTimeFormat(pattern = "yy-MM-dd")
	private Date regDate;
	private String searchKeyword;
	
	
	
	
}
