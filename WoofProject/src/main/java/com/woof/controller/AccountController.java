package com.woof.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woof.domain.Account;
import com.woof.service.AccountService;

import jakarta.servlet.jsp.jstl.sql.Result;
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
	private String username;

	// 계정 등록 페이지
	@RequestMapping(value = "/createAccount", method = RequestMethod.GET)
	public String createAccountForm(Account account, Model model) throws Exception {
		log.info("createAccountForm");

		return "account/login/createAccount";
	}

	// 계정 등록 처리
	@RequestMapping(value = "/createAccount", method = RequestMethod.POST)
	public String createAccount(@Validated Account account, Model model, BindingResult result, RedirectAttributes rttr)
			throws Exception {
		log.info("createAccount : POST");

		// 비밀번호 암호화
		String inputPassword = account.getPassword();
		account.setPassword(passwordEncoder.encode(inputPassword));
		log.info(account.toString());

		service.registerAccount(account);
		rttr.addFlashAttribute("username", account.getUsername());

		return "redirect:/account/login";
//		return "account/login/loginForm";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(String error, String logout, Model model) {
		log.info("loginForm");
		log.info("error: " + error);
		log.info("logout: " + logout);
		if (error != null) {
			model.addAttribute("error", "로그인 에러!!!");
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃!!!");
		}
		return "account/login/loginForm";
	}

	// 로그아웃 페이지를 생성한다.
	@RequestMapping("/logout")
	public String logoutForm() {
		return "account/login/loginForm";
	}

	// 내정보
	@RequestMapping(value = "/myAccount", method = RequestMethod.GET)
	public String myAccountForm(Account account, Model model) throws Exception {
		log.info("myAccountForm");
		log.info("11111myAccount account : " + account.toString());
	
		model.addAttribute(service.getAccount(account));
		log.info("2222myAccount account : " + account.toString());
		return "account/myAccount/myAccountForm";
	}
	
	// 내정보
		@RequestMapping(value = "/myAccount", method = RequestMethod.POST)
		public String myAccountFormpost(Account account, Model model) throws Exception {
			log.info("myAccountForm post");
			log.info("11111myAccount account : " + account.toString());
			
			model.addAttribute(service.getAccount(account));
			log.info("2222myAccount account : " + account.toString());
			return "account/myAccount/myAccountForm";
		}

	// 내정보 수정
	@RequestMapping(value = "/modifyAccountForm", method = RequestMethod.POST)
	public String modifyAccountForm(Account account, Model model) throws Exception {
		log.info("modifyAccount : GET");
		log.info("modifyAccountForm account : " + account.toString());
		model.addAttribute(service.getAccount(account));
		log.info("modifyAccountForm account : " + account.toString());
		return "account/myAccount/modifyAccount";
	}

	// 내정보 수정
	@RequestMapping(value = "/modifyAccount", method = RequestMethod.POST)
	public String modifyAccount(@Validated Account account, Model model) throws Exception {
		log.info("modifyAccount : POST");
		// 비밀번호 암호화
		String inputPassword = account.getPassword();
		account.setPassword(passwordEncoder.encode(inputPassword));
		
		log.info("modifyAccount account : " + account.toString());
		service.modifyAccount(account);
		model.addAttribute(service.getAccount(account));
		return "account/myAccount/myAccountForm";
	}

	
	// 내정보 삭제
		@RequestMapping(value = "/deleteAccountForm", method = RequestMethod.POST)
		public String deleteAccountForm(Account account, Model model) throws Exception {
			log.info("*** deleteAccountForm : POST");
			model.addAttribute(service.getAccount(account));
			return "account/myAccount/deleteAccount";
		}
		
		
		// 내정보 삭제
		@RequestMapping(value = "/deleteAccount", method = RequestMethod.POST)
		public String deleteAccount(Account account, Model model, RedirectAttributes rttr) throws Exception {
			log.info("*** deleteAccount : POST");
			
			
		
			service.deleteAccount(account);
			rttr.addFlashAttribute("magDelete", "DELETE");
		
			
			return "homewoof";
		}
	
	

	// 최초 관리자를 생성하는 화면.
	@RequestMapping(value = "/setup", method = RequestMethod.GET)
	public String setupAdminForm(Account account, Model model) throws Exception {
		log.info("****setupAdminForm : " + service.countAll());

		// 회원 테이블 데이터 건수를 확인하여 최초 관리자 등록 페이지를 표시한다.
		if (service.countAll() == 0) {
			return "account/login/setup";
		}
		// 회원 테이블에 데이터가 존재하면 최초 관리자를 생성할 수 없으므로 실패 페이지로 이동한다.
		model.addAttribute("msg", "SUCCESS");
		return "homewoof";
	}

	// 회원 테이블에 데이터가 없으면 최초 관리자를 생성
	@RequestMapping(value = "/setup", method = RequestMethod.POST)
	public String setupAdmin(Account account, RedirectAttributes rttr, Model model) throws Exception {

		// 회원 테이블 데이터 건수를 확인하여 빈 테이블이면 최초 관리자를 생성
		if (service.countAll() == 0) {
			String inputPassword = account.getPassword();
			account.setPassword(passwordEncoder.encode(inputPassword));
			service.setupAdmin(account);
			rttr.addFlashAttribute("username", account.getUsername());
			return "homewoof";
		}
		// 회원 테이블에 데이터가 존재하면 최초 관리자를 생성할 수 없으므로 실패 페이지로 이동
		model.addAttribute("msg", "SUCCESS");
		return "homewoof";
	}

}
