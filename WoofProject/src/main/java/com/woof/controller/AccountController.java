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
	//로그인
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

	//내정보
	@RequestMapping(value = "/myAccount", method = RequestMethod.GET)
	public void myAccountForm(Account account, Model model) throws Exception {
		log.info("myAccountForm");
		log.info(account.getUsername()+" : ===================username");
		model.addAttribute(service.getAccount(account));
	}
	//내정보
	@RequestMapping(value = "/myAccount", method = RequestMethod.POST)
	public void myAccount(Account account, Model model) throws Exception {
		log.info("myAccount : POST");
		log.info(account.getUsername()+" : ===================username");
		service.getAccount(account);
		
	}
	//내정보 수정
	@RequestMapping(value = "/midifyAccount", method = RequestMethod.GET)
	public void modifyAccountForm(Account account, Model model) throws Exception {
		log.info("midifyAccount : GET");
		model.addAttribute(service.getAccount(account));
	}
	//내정보 수정
	@RequestMapping(value = "/midifyAccount", method = RequestMethod.POST)
	public String modifyAccount(Account account, RedirectAttributes rttr) throws Exception {
		log.info("midifyAccount : POST");
		service.modifyAccount(account);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/account/midifyAccount";
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
