package com.woof.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woof.domain.Account;
import com.woof.service.AccountService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/account")
//@MapperScan(basePackages = "com.woof.mapper")
public class AccountController {

	@Autowired
	private AccountService service;
	// 스프링 시큐리티의 비밀번호 암호처리기
	@Autowired
	private PasswordEncoder passwordEncoder;

	// 등록 페이지
	@RequestMapping(value = "/createAccount", method = RequestMethod.GET)
	public String createAccountForm(Account account, Model model) throws Exception {
		log.info("createAccountForm");

		return "account/login/createAccount";
	}
	// 등록 처리
	@RequestMapping(value = "/createAccount", method = RequestMethod.POST)
	public String createAccount(@Validated Account account, Model model,BindingResult result,RedirectAttributes rttr) throws Exception {
		log.info("createAccount : POST");
		
		// 비밀번호 암호화
		String inputPassword = account.getPassword();
		account.setPassword(passwordEncoder.encode(inputPassword));
		log.info(account.toString());
		service.registerAccount(account);
		rttr.addFlashAttribute("username", account.getUsername());
	
		return "account/login/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(String error, String logout,Model model) {
		log.info("loginForm");
		log.info("error: " + error);
		log.info("logout: " + logout);
		if (error != null) {
			model.addAttribute("error", "로그인 에러!!!");
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃!!!");
		}
		return "account/login/login";
	}
	
	@RequestMapping("/logout")
	public String logoutForm() {
		log.info("logoutForm");
		return "account/login/login";
		}
	
	@RequestMapping("/register")
	public void register() {
		log.info("register : 로그인한 관리자만 가능");
	}
	
	
}
//
//@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
//public String loginForm(Model model) {
//	
//	log.info("loginForm");
//	return "account/login/login";
//}
//@RequestMapping(value = "/login", method = RequestMethod.POST)
//public String login(Account account, Model model) {
//	
//	log.info("login");
//	return "account/login/regis";
//}
//
//
//// 회원권한을 가진 사용자만 접근이 가능하다.
////@PreAuthorize("hasRole('ROLE_MEMBER')")
//@RequestMapping("/regis")
//public String registerForm() {
//log.info("registerForm : 로그인한 회원만 접근 가능");
//return "account/login/regis";
//}
//
//
//@RequestMapping(value = "/createAccountForm", method = RequestMethod.GET)
//public String createAccountForm(Account account, Model model) throws Exception {
//	log.info("createAccountForm");
//	
//	return "account/login/createAccount";
//}
//
//@RequestMapping(value = "/createAccount", method = RequestMethod.POST)
//public String createAccount(Account account, Model model) throws Exception {
//	service.registerAccount(account);
//	
//	log.info("createAccount");
//	
//	return "account/login/login";
//}
