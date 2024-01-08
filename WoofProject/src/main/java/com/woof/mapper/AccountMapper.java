package com.woof.mapper;

import java.util.List;

import com.woof.domain.Account;

public interface AccountMapper {
	// 내정보
	public Account getAccount(Account username) throws Exception;
	// Account들의 모든정보 리스트
	public List<Account> getAccountList() throws Exception;
	//계정 등록
	public void registerAccount(Account account) throws Exception;
	//정보 수정
	public void modifyAccount(Account account) throws Exception;
	//계정 탈퇴
	public void deleteAccount(Account username) throws Exception;
	//admin이 개인계정을 찾기
	public Account searcheAccount(Account searchKeyword) throws Exception;
}
