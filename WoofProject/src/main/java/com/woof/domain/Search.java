package com.woof.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Search { 
//public class search { 
	// 모든 페이지에서 공통으로 사용할 클래스명, 변수명 정할것
	// pageSearch / searchPage
	private int postNo;
	
	private String condition; // 검색 분야  ex 제목 내용 /condition
	private String keyword; // 검색 키워드 / keyword
	private String keywordTitle; // 제목이 검색대상인 키워드 / titleKeyword
	private String keywordDesc; // 내용이 검색대상인 키워드 / descKeyword

//	private String condition; // 검색 분야  ex 제목 내용 /condition
//	private String keyword; // 검색 키워드 / keyword
//	private String keywordTitle; // 제목이 검색대상인 키워드 / titleKeyword
//	private String keywordDesc; // 내용이 검색대상인 키워드 / descKeyword
	
	

}
