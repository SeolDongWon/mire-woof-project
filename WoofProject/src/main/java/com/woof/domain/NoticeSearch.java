package com.woof.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeSearch {
	private int postNo;
	private String searchCondition;
	private String searchKeyword;
	private String searchKeywordTitle;
	private String searchKeywordDesc;

}
