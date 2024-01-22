package com.woof.common.global;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.java.Log;

@Log
@ControllerAdvice
public class GlobalExceptionHandler {

	@Autowired
	private MessageSource messageSource;
	
	// for Exception class errors
	@ExceptionHandler({Exception.class, RuntimeException.class, IOException.class})
	public String handleException(Exception e, Model model) {
		log.info("ExceptionHandler: " + e.toString());
		String errorMessage = messageSource.getMessage("error.general", null, LocaleContextHolder.getLocale());
		model.addAttribute("errorMessage", errorMessage);
		model.addAttribute("actualErrorMessage", e.getMessage());
		return "error/error";
	}
	
	// for SQL errors
	@ExceptionHandler(SQLException.class)
	public String handleSQLException(SQLException e, Model model) {
		log.info("SQLExceptionHandler: " + e.toString());
		String errorMessage = messageSource.getMessage("error.sql", null, LocaleContextHolder.getLocale());
		model.addAttribute("errorMessage", errorMessage);
		model.addAttribute("actualErrorMessage", e.getMessage());
		return "error/sqlError";
	}
}