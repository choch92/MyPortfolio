package com.naver.mydiary.util;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Component
@ControllerAdvice("com.naver.mydiary")
public class CommonExceptionAdvice {
	@ExceptionHandler(Exception.class)
	public String errorPage(Model model, Exception ex) {
		model.addAttribute("error", ex.getMessage());
		return "/error/error";
	}
}
