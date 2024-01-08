package com.woof.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Pet {
	 private int petNo;
	 private String   username;
	 private String   petName;
	 private int   petAge;
	 private String   petType;
	 private String   petGender;
	 private String   petDesc;
	 private Date  petRegDate;
	 private Date  petModDate;
	 private Date  adoptDate;
	 private String   petStatus;
	 private String   petMainPic;
	 private String   petSubPic;

}
