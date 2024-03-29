package com.woof.service;

import java.util.List;

import com.woof.domain.Account;
import com.woof.domain.PageRequest;


public interface AccountService {
	//상세페이지
	public Account getAccount(Account account) throws Exception;
	//목록페이지(admin)
//	public List<Account> getAccountList(Account account) throws Exception;
	public List<Account> getAccountList(PageRequest pageRequest) throws Exception;
	// 등록 처리
	public void registerAccount(Account account) throws Exception;
	//수정처리
	public Account modifyAccount(Account account) throws Exception;
	//삭제처리
	public void deleteAccount(Account username) throws Exception;
	

	// 회원 테이블의 데이터 건수를 반환한
	public void setupAdmin(Account account) throws Exception;;
	// 최초 관리자 생성을 위한 데이터를 등록
	public int countAll(PageRequest pageRequest) throws Exception;;
	//관리자가 유저정지 및 해제
	public Account restoreAccount(Account account) throws Exception;
	
	//아이디 중복체크
	public boolean checkusername(Account username);
	
	
	//로그인 확인
	public Account readByUsername(String username);
}
