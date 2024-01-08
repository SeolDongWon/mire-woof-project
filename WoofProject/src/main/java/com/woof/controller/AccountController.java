package com.woof.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woof.service.AccountService;
import com.woof.service.impl.AccountServiceImpl;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private AccountServiceImpl accountServiceImpl;
	
	
	

}
