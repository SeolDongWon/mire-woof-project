package com.woof.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woof.domain.Account;
import com.woof.domain.AccountAuth;
import com.woof.domain.PageRequest;
import com.woof.mapper.AccountMapper;
import com.woof.service.AccountService;

import lombok.extern.java.Log;

@Log
@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountMapper mapper;
	
	//내정보
	@Override
	public Account getAccount(Account account) throws Exception {
		
		return mapper.getAccount(account);
	}

	//Account들의 모든정보 리스트
	@Override
	public List<Account> getAccountList(Account account) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getAccountList(account);
	}

	//계정 등록 처리
	@Transactional
	@Override
	public void registerAccount(Account account) throws Exception {
		mapper.registerAccount(account);
		// 회원 권한 생성
		AccountAuth accountAuth = new AccountAuth();
		accountAuth.setUsername(account.getUsername());
		accountAuth.setAuth("ROLE_MEMBER");
		log.info(accountAuth.toString());
		mapper.registerAccountAuth(accountAuth);

		
	}

	//내정보 수정
	@Transactional
	@Override
	public Account modifyAccount(Account account) throws Exception {
		
		mapper.modifyAccount(account);
		return account;
	}

	//계정 탈퇴
	@Override
	public void deleteAccount(Account username) throws Exception {
		mapper.deleteAccount(username);
		
	}


	// 최초 관리자를 생성한다.
	@Transactional
	@Override
	public void setupAdmin(Account account) throws Exception {
		mapper.registerAccount(account);
		AccountAuth accountAuth = new AccountAuth();
		accountAuth.setUsername(account.getUsername()); 
		accountAuth.setAuth("ROLE_ADMIN");
		mapper.registerAccountAuth(accountAuth);
	}

	@Override
	public int countAll() throws Exception {
		return mapper.countAll();
	}

	//관리자가 유저정지 및 해제
	@Override
	public Account restoreAccount(Account account) throws Exception {
	    mapper.restoreAccount(account);
	    return getAccount(account);
	}
	//아이디 중복체크
	@Override
	public boolean checkusername(Account account) {
		return mapper.checkusername(account);
	}
	//로그인 확인
	@Override
	public Account readByUsername(String username) {
		return readByUsername(username);
	}



}
