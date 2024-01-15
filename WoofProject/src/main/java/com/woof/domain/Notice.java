package com.woof.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeDesc;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date noticeRegDate;
	private Date noticeModDate;
	private int noticeViewCount;
	

}
