package com.woof.mapper;

import java.util.List;

import com.woof.domain.Account;
import com.woof.domain.AccountAuth;

public interface AccountMapper {
	//계정 등록 처리
	public void registerAccount(Account account) throws Exception;
	// 권한 생성
	public void registerAccountAuth(AccountAuth accountAuth) throws Exception;
	
	
	// 내정보
	public Account getAccount(Account account) throws Exception;
	// Account들의 모든정보 리스트
	public List<Account> getAccountList() throws Exception;
	//정보 수정
	public void modifyAccount(Account account) throws Exception;
	//계정 탈퇴
	public void deleteAccount(Account account) throws Exception;
	//admin이 개인계정을 찾기
	public Account searchAccount(Account searchKeyword) throws Exception;
	// 회원 테이블의 데이터 건수 조회
	public int countAll() throws Exception;
	
	//사용자 아이디를 가진 회원 정보를 조회
	public Account readByUsername(String username);
	
	public String getAddress(String username);
}
