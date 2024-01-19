package com.woof.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Pet implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int petNo;
	private String username;
	private String petName;
	private int petAge;
	private String petType;
	private String petGender;
	private String petDesc;
	private Date petRegDate;
	private Date petModDate;
	private Date adoptDate;
	private String petStatus;
	
	private List<MultipartFile> pictures;
	//경로
	private String petMainPic;
	private String petSubPic;

}
