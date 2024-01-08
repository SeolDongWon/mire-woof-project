package com.woof.service;

import java.util.List;

import com.woof.domain.Account;


public interface AccountService {
	
	public Account getAccount(Account username) throws Exception;
	
	public List<Account> getAccountList() throws Exception;
	
	public void registerAccount(Account account) throws Exception;
	
	public void modifyAccount(Account account) throws Exception;
	
	public void deleteAccount(Account username) throws Exception;
	
	public Account searcheAccount(Account searchKeyword) throws Exception;
	
	
}
