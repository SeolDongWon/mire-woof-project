package com.zeus.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.woof.common.domain.CustomAccount;
import com.woof.domain.Account;
import com.woof.mapper.AccountMapper;

import lombok.extern.java.Log;

@Log
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private AccountMapper accountMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("Load User By username : " + username);
		// userName은 사용자명이 아니라 사용자 아이디이다.

		Account account = accountMapper.readByUsername(username);
		log.info("queried by member mapper: " + account);
		
		return account == null ? null : new CustomAccount(account);
	}

}
