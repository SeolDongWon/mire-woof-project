package com.woof.common.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
public class CommonController {

	@RequestMapping("/accessError")
	public void accessError(Authentication auth, Model madel) {
		log.info("...accessError... : "+auth);
		madel.addAttribute("Error","회원 이상만 볼 수 있는 사이트 입니다.");
	}
}
