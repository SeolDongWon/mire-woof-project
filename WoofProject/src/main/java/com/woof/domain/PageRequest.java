package com.woof.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


public class PageRequest {
	
	private int postNo;

	private String condition; // 검색 분야 ex 제목 내용 /condition
	private String keyword; // 검색 키워드 / keyword
	private String keywordTitle; // 제목이 검색대상인 키워드 / titleKeyword
	private String keywordDesc; // 내용이 검색대상인 키워드 / descKeyword
	
	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getKeywordTitle() {
		return keywordTitle;
	}

	public void setKeywordTitle(String keywordTitle) {
		this.keywordTitle = keywordTitle;
	}

	public String getKeywordDesc() {
		return keywordDesc;
	}

	public void setKeywordDesc(String keywordDesc) {
		this.keywordDesc = keywordDesc;
	}

	// 현재페이지
	private int page;
	// 화면하단에 출력할 페이지사이즈
	private int sizePerPage;

	public PageRequest() {
		this.page = 1;
		this.sizePerPage = 10;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setSizePerPage(int size) {
		if (size <= 0 || size > 100) {
			this.sizePerPage = 10;
			return;
		}
		this.sizePerPage = size;
	}

	public int getPage() {
		return page;
	}

	// 마이바티스 SQL 매퍼를 위한 메서드
	public int getPageStart() {
		return (this.page - 1) * sizePerPage;
	}

	// 마이바티스 SQL 매퍼를 위한 메서드
	public int getSizePerPage() {
		return this.sizePerPage;
	}

	// 멤버 변수를 활용하여 다양한 형태의 쿼리파라미터를 생성한다.
	public String toUriString() {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", this.page)
				.queryParam("size", this.sizePerPage).build();
		return uriComponents.toUriString();
	}

	@Override
	public String toString() {
		return "PageRequest [postNo=" + postNo + ", condition=" + condition + ", keyword=" + keyword + ", keywordTitle="
				+ keywordTitle + ", keywordDesc=" + keywordDesc + ", page=" + page + ", sizePerPage=" + sizePerPage
				+ "]";
	}

	
}
