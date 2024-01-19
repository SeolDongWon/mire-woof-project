package com.woof.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Reply {
	private int replyNo;
	private String username;
	private int petNo;
	private int reviewNo;
	private String reply;
	private Date replyRegDate;
	private Date replyModDate;
}
