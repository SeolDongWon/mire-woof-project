package com.zeus.common.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import lombok.extern.java.Log;

//사용자가 입력한 패스워드와 DB에 저장한 암호화된 패스워드 비교
@Log
public class CustomNoOpPasswordEncoder implements PasswordEncoder {

	private final PasswordEncoder passwordEncoder = null;

//	public CustomNoOpPasswordEncoder() {
//		this.passwordEncoder = new BCryptPasswordEncoder();
//	}

	@Override
	public String encode(CharSequence rawPassword) {
		log.info("...before encode : "+rawPassword);

		return passwordEncoder.encode(rawPassword);
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		log.info("...matches : "+ rawPassword+" .. : .. "+encodedPassword);

		return passwordEncoder.matches(rawPassword, encodedPassword);
	}


}
