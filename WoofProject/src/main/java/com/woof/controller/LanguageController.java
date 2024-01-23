package com.woof.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class LanguageController {

	@GetMapping("/changeLanguage")
	public void changeLanguage(HttpServletRequest request, HttpServletResponse response, String language) {
		Locale locale = new Locale(language);
		request.getSession().setAttribute("org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE", locale);
		
		CookieLocaleResolver localeResolver = new CookieLocaleResolver();
		localeResolver.setCookieMaxAge(60 * 60 * 24);
		localeResolver.setCookieName("language");
        localeResolver.setLocale(request, response, locale);
	}
}
