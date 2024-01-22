package com.woof.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.zeus.common.security.CustomLoginSuccessHandler;
import com.zeus.common.security.CustomUserDetailsService;

import lombok.extern.java.Log;

@Log
@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfig {
	@Autowired
	DataSource dataSource;

	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		log.info("SecurityFilterChain called");

		// 토큰 비활성화
		http.csrf().disable();

		// 가입한 회원이 인가받지 않은 페이지에 접근하면 403 에러메세지를 /accessError로 대체한다 로그를 남김
//		http.exceptionHandling().accessDeniedHandler(createAccessDeniedHandler());

		// 로그인설정
		http.formLogin().loginPage("/login").successHandler(createAuthenticationSuccessHandler()).failureUrl("/account/loginFail");
		
		// 로그아웃을 하면 자동 로그인에 사용하는 쿠키도 삭제한다
		http.logout().logoutUrl("/account/logout").logoutSuccessUrl("/").invalidateHttpSession(true).deleteCookies("remember-me","JSESSION_ID");

		// 쿠키의 유효 시간을 지정한다(24시간).
		http.rememberMe().key("zeus").tokenRepository(createJDBCRepository()).tokenValiditySeconds(60 * 60 * 24 * 30);

		return http.build();
	}

	private PersistentTokenRepository createJDBCRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
	
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(createUserDetailsService()).passwordEncoder(createPasswordEncoder());
	}
	
	@Bean
	PasswordEncoder createPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	// 스프링 시큐리티의 UserDetailsService를 구현한 클래스를 빈으로 등록한다. [사용자정보 비교]
	@Bean
	UserDetailsService createUserDetailsService() { 
		return new CustomUserDetailsService();
	}
		
	// CustomAccessDeniedHandler를 빈으로 등록한다.
//	@Bean
//	AccessDeniedHandler createAccessDeniedHandler() {
//		return new CustomAccessDeniedHandler();
//	}
		
	// CustomLoginSuccessHandler를 빈으로 등록한다.
	@Bean
	AuthenticationSuccessHandler createAuthenticationSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}
}


