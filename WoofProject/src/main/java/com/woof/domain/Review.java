package com.woof.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

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
	private String itemName;
	private int petNo;
	private String reviewTitle;
	private String reviewDesc;
	
	private List<MultipartFile>pictures;
	private String reviewPic;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date reviewRegDate;
	private Date reviewModDate;
} 
