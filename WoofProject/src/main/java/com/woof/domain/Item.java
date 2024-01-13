package com.woof.domain;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Item {

	private int itemNo;
	private String itemName;
	private int itemPrice;
	private int itemStock;
	private String itemType;
	private Date itemRegDate;
	private String itemMainPic;
	private String itemSubPic;
	private String itemDesc;
	
	private String searchItemType;
	private String searchKeyword;
	
	private List<MultipartFile> pictures;
}
