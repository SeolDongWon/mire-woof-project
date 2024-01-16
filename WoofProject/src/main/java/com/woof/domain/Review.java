package com.woof.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Review {
	private int reviewNo;
	private String username;
	private int itemNo;
	private int petNo;
	private String reviewTitle;
	private String reviewDesc;
	private String reviewPic;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date reviewRegDate;
	private Date reviewModDate;
} 
