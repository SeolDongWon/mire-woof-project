package com.woof.common.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.woof.domain.Account;

import lombok.Data;

@Data
public class CustomAccount extends User {

	private static final long serialVersionUID = 1L;

	private Account account;

	public CustomAccount(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		
	}

	public CustomAccount(Account account) {
		// 사용자가 정의한 Member 타입을 스프링 시큐리티 UsersDetails 타입으로 변환한다.
		// -> : 람다식
		super(account.getUsername(), account.getPassword(), 
				account.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList()));
		this.account = account;
	}

	public Account getAccount() {
		return account;
	}
}
