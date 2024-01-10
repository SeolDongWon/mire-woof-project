package com.woof.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Account implements Serializable{
	private static final long serialVersionUID = 582999266267533096L;
	
	private String username;
	private String password;
	private String name;
	private String tel;
	private String address;
	private String state;
	@DateTimeFormat(pattern = "yy-MM-dd")
	private Date regDate;
	private String searchKeyword;
	
	
	// 1:N으로 연결한 테이블의 정보를 받아오는 멤버변수
		private List<AccountAuth> authList;
	
}
