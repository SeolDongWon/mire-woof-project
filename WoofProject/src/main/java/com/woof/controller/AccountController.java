package com.woof.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woof.domain.Account;
import com.woof.domain.PageRequest;
import com.woof.domain.Pagination;
import com.woof.service.AccountService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.jsp.jstl.sql.Result;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/account")
public class AccountController {

	@Autowired
	private AccountService service;
	// 스프링 시큐리티의 비밀번호 암호처리기
	@Autowired
	private PasswordEncoder passwordEncoder;
	private String username;

	// 계정 등록 페이지
	@GetMapping(value = "/createAccount")
	public String createAccountForm(Account account, Model model) throws Exception {
		log.info("createAccountForm");

		return "account/login/createAccount";
	}
	
	@PutMapping(value = "/accountCheck")
	public ResponseEntity<String> accountCheck(@RequestBody Account account, Model model) throws Exception {
		log.info("++++ accountCheck ++++");
		
		if(service.checkusername(account)) {
			
			return ResponseEntity.ok("Username already exists");
		}else {
			  return ResponseEntity.ok("Username available");
		}
	}

	// 계정 등록 처리
	@RequestMapping(value = "/createAccount", method = RequestMethod.POST)
	public String createAccount(@Validated Account account, Model model, BindingResult result, RedirectAttributes rttr)
			throws Exception {
		log.info("createAccount : POST");

		// 비밀번호 암호화
		String inputPassword = account.getPassword();
		account.setPassword(passwordEncoder.encode(inputPassword));
		log.info("======== 전 =========account.toString()" + account.toString());

		String address = account.getAddress1() + " " + account.getAddress2() + " " + account.getAddress3() + " "
				+ account.getAddress4();
		account.setAddress(address);

		log.info("======== 후 =========account.toString()" + account.toString());
		
/////////////////////////////////////////////////////////////////샘플 반복생성
		String id = account.getUsername();
		for(int i=0;i<101;i++) {
		account.setUsername(id+i);
		service.registerAccount(account);
		}
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
			log.info("error: 로그인 에러!!!");
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃!!!");
			log.info("logout: 로그아웃!!");
		}
		return "account/login/loginForm";
	}

	// 로그인 실패
	@RequestMapping(value = "/loginFail", method = RequestMethod.GET)
	public String loginFail(String error, String logout, Model model) {
		log.info("===========loginFail");

		model.addAttribute("error", "xo");

		return "account/login/loginForm";
	}

	// 로그아웃 페이지를 생성한다.
	@RequestMapping("/logout")
	public String logoutForm() {
		return "account/login/loginForm";
	}

	// 내정보
	@RequestMapping(value = "/myAccount", method = RequestMethod.GET)
	public String myAccountForm(Account account, Model model, Principal principal) throws Exception {
		log.info("myAccountForm");
		log.info("...principal.getName : " + principal.getName());
		account.setUsername(principal.getName());
		model.addAttribute(service.getAccount(account));
		log.info("myAccount account : " + account.toString());
		return "account/myAccount/myAccountForm";
	}

	// 내정보
	@RequestMapping(value = "/myAccount", method = RequestMethod.POST)
	public String myAccountFormpost(Account account, Model model) throws Exception {
		log.info("myAccountForm post");
		log.info("11111myAccount account : " + account.toString());

		model.addAttribute(service.getAccount(account));
		log.info("myAccount account : " + account.toString());
		return "account/myAccount/myAccountForm";
	}

	// 내정보 수정
	@RequestMapping(value = "/modifyAccountForm", method = RequestMethod.GET)
	public String modifyAccountForm(Account account, Model model, Principal principal) throws Exception {
		log.info("modifyAccount : GET");
		log.info("...principal.getName : " + principal.getName());
		account.setUsername(principal.getName());
		log.info("modifyAccountForm account : " + account.toString());
		model.addAttribute(service.getAccount(account));
		return "account/myAccount/modifyAccount";
	}

	// 내정보 수정
	@RequestMapping(value = "/modifyAccount", method = RequestMethod.POST)
	public String modifyAccount(@Validated Account account, Model model) throws Exception {
		log.info("modifyAccount : POST");

		// 비밀번호 암호화
		String inputPassword = account.getPassword();
		account.setPassword(passwordEncoder.encode(inputPassword));

		String address = account.getAddress1() + " " + account.getAddress2() + " " + account.getAddress3() + " "
				+ account.getAddress4();
		account.setAddress(address);

		service.modifyAccount(account);

		log.info("======= modifyAccount account : " + account.toString());
		model.addAttribute(service.getAccount(account));

		return "account/myAccount/myAccountForm";
	}

	// 내정보 삭제
	@RequestMapping(value = "/deleteAccountForm", method = RequestMethod.GET)
	public String deleteAccountForm(Account account, Model model, Principal principal) throws Exception {
		log.info("*** deleteAccountForm : GET");
		log.info("...principal.getName : " + principal.getName());
		account.setUsername(principal.getName());
		model.addAttribute(service.getAccount(account));
		return "account/myAccount/deleteAccount";
	}

	// 내정보 삭제
	@RequestMapping(value = "/deleteAccount", method = RequestMethod.POST)
	public String deleteAccount(@ModelAttribute("account") Account account, BindingResult result, Model model,
			RedirectAttributes rttr, Principal principal, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		log.info("*** deleteAccount : POST");

		if (result.hasErrors()) {

			return "account/myAccount/deleteAccount";
		}
		if (principal != null && principal.getName().equals(account.getUsername())) {
			// 비밀번호 암호화
//			String inputPassword = account.getPassword();
//			account.setPassword(passwordEncoder.encode(inputPassword));
			log.info("222...... deleteAccount(account)" + account);

			// 서비스이용 deleteAccount.xml 이용(삭제기능 대체)
			service.deleteAccount(account);
			log.info("...... deleteAccount(account)" + account);

			// 로그아웃 처리 (세션 무효화)
			SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
			logoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication());

			// 삭제 후 홈페이지로 리다이렉트 및 메시지 전달
			model.addAttribute("msg2", "SUCCESS2");

			return "homewoof";

		} else {
			// 현재 로그인한 사용자와 폼에서 입력한 사용자가 다른 경우에 대한 처리
			// (예: 권한이 없는 사용자가 다른 사용자의 계정을 삭제하려는 시도)
			model.addAttribute("msg3", "SUCCESS3");
			return "homewoof"; // 적절한 에러 페이지로 리다이렉트
		}

	}

	// 최초 관리자를 생성하는 화면.
	@RequestMapping(value = "/setup", method = RequestMethod.GET)
	public String setupAdminForm(Account account, Model model,PageRequest pageRequest) throws Exception {

		if(null==pageRequest.getKeyword()) {
			pageRequest.setKeyword("");
		}
		log.info("****setupAdminForm : " + service.countAll(pageRequest));

		// 회원 테이블 데이터 건수를 확인하여 최초 관리자 등록 페이지를 표시한다.
		if (service.countAll(pageRequest) == 0) {
			return "account/login/setup";
		}
		// 회원 테이블에 데이터가 존재하면 최초 관리자를 생성할 수 없으므로 실패 페이지로 이동한다.
		model.addAttribute("msg", "SUCCESS");
		return "homewoof";
	}

	// 회원 테이블에 데이터가 없으면 최초 관리자를 생성
	@RequestMapping(value = "/setup", method = RequestMethod.POST)
	public String setupAdmin(Account account, RedirectAttributes rttr, Model model,PageRequest pageRequest) throws Exception {
		if(null==pageRequest.getKeyword()) {
			pageRequest.setKeyword("");
		}

		String address = account.getAddress1() + " " + account.getAddress2() + " " + account.getAddress3() + " "
				+ account.getAddress4();
		account.setAddress(address);
		// 회원 테이블 데이터 건수를 확인하여 빈 테이블이면 최초 관리자를 생성
		if (service.countAll(pageRequest) == 0) {
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

	// 관리자의 유저관리 (accountList)
	@GetMapping(value = "/accountList")
	public String accountListForm(Account account, Model model, PageRequest pageRequest,Pagination pagination) throws Exception {
		log.info("**ADMIN** : accountList");


		
		if(null==pageRequest.getKeyword()) {
			pageRequest.setKeyword("");
		}
		
		
		pagination.setPageRequest(pageRequest);
//		log.info("getPetList().size() : "+service.getPetList().size());
		pagination.setTotalCount(service.countAll(pageRequest));
//		log.info("pagination : "+pagination.toString());
		model.addAttribute("pagination", pagination);
		model.addAttribute(pageRequest);
		
		
		
		log.info("**List" + service.getAccountList(pageRequest));

		model.addAttribute("list", service.getAccountList(pageRequest));
		
//		if(pageRequest.getKeyword()!=null) {
//			account.setUsername(pageRequest.getKeyword());			
//			model.addAttribute("list", service.checkusername(account));
//		}else {
//		}
//		if(account.getUsername() == null) {
//			account.setUsername("");
//		}
		
		

		return "account/admin/accountList";
	}


	
	// 관리자가 유저 정지 및 해제
	@RequestMapping(value = "/accountStatusSwitch", method = RequestMethod.POST)
	public String accountStatusSwitch(Account account, Model model, Principal principal, PageRequest pageRequest,RedirectAttributes redirectAttributes) throws Exception {
	    log.info("*** accountStatusSwitch : POST");
	    log.info("...account.toString() : " + account.toString());
	 
	    service.restoreAccount(account);

		if(null==pageRequest.getKeyword()) {
			pageRequest.setKeyword("");
		}
		
		redirectAttributes.addAttribute("keyword",pageRequest.getKeyword());

	    // 계정 목록을 다시 로딩하도록 redirect
	    return "redirect:/account/accountList";
	}

	
	
	
	
	
	
	
}
