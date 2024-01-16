package com.woof.service;

import java.util.List;

import com.woof.domain.Account;


public interface AccountService {
	//상세페이지
	public Account getAccount(Account account) throws Exception;
	//목록페이지(admin)
	public List<Account> getAccountList() throws Exception;
	// 등록 처리
	public void registerAccount(Account account) throws Exception;
	//수정처리
	public Account modifyAccount(Account account) throws Exception;
	//삭제처리
	public void deleteAccount(Account username) throws Exception;
	
	public Account searcheAccount(Account searchKeyword) throws Exception;
	// 회원 테이블의 데이터 건수를 반환한
	public void setupAdmin(Account account) throws Exception;;
	// 최초 관리자 생성을 위한 데이터를 등록
	public int countAll() throws Exception;;
	

}
