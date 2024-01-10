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
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.woof.common.security.CustomAccessDeniedHandler;
import com.woof.common.security.CustomLoginSuccessHandler;
import com.woof.common.security.CustomNoOpPasswordEncoder;
import com.woof.common.security.CustomUserDetailsService;

import lombok.extern.java.Log;

@Log
@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled=true, securedEnabled=true)
public class SecurityConfig {
	@Autowired
	DataSource dataSource;
	
	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		log.info("... security config ...");
		
		 //토큰 비활성화
		http.csrf().disable();
		 //모두 허용 / 이걸 쓰면 각 requestMatchers("**").permitAll();이 필요없다
        http.authorizeHttpRequests().anyRequest().permitAll();
		//가입하지 않은 회원이 페이지 접근시 넘겨버리지 않고 로그를 남긴다.
		http.exceptionHandling().accessDeniedHandler(createAccessDeniedHandler());
		//개발자가 만든 loginForm을 사용
		http.formLogin().loginPage("/login").successHandler(createAuthenticationSuccessHandler());
		//Logout을 처리 쿠키를 이용하여 Logout 시 자동 Login방지
		http.logout().logoutUrl("/logout").invalidateHttpSession(true).deleteCookies("remember-me","JSESSION_ID");
		//쿠키 시간지정 및 로그인 정보기록
		http.rememberMe().key("zeus")
		.tokenRepository(createJDBCRepository())
		.tokenValiditySeconds(60*60*24*30);
		return http.build();
	}
	
	private PersistentTokenRepository createJDBCRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(createUserDetailsService())
		.passwordEncoder(createPasswordEncoder());
	}
	
	@Bean
	public AuthenticationSuccessHandler createAuthenticationSuccessHandler() {
		return  new CustomLoginSuccessHandler();
	}

	@Bean
	public AccessDeniedHandler createAccessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}


	@Bean
	public UserDetailsService createUserDetailsService() {
		return new CustomUserDetailsService();
	}
	@Bean
	public PasswordEncoder createPasswordEncoder() {
		return new CustomNoOpPasswordEncoder();
	}

	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
