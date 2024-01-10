package com.woof.common.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.java.Log;

@Log
public class CustomNoOpPasswordEncoder implements PasswordEncoder {
	private final PasswordEncoder passwordEncoder;
	
	public CustomNoOpPasswordEncoder() {
		this.passwordEncoder = new BCryptPasswordEncoder();
	}

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
