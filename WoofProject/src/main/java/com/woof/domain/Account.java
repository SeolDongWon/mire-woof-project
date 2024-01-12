package com.woof.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Account implements Serializable{
	private static final long serialVersionUID = 582999266267533096L;
	
	@NotBlank
	private String username;
	@NotBlank
	private String password;
	@NotBlank
	private String name;
	private String tel;
	private String address;
	private String state;
	@DateTimeFormat(pattern = "yy-MM-dd")
	private Date regDate;
	
	
	
	// 1:N으로 연결한 테이블의 정보를 받아오는 멤버변수
		private List<AccountAuth> authList;
	
}
