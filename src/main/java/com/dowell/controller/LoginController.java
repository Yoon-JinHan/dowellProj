package com.dowell.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	//로그인 페이지 컨트롤러
	@RequestMapping(value="/logInPage", method= {RequestMethod.GET})
	public String loginPage() {
		
		return "/login/logInPage";
	}
	
	@GetMapping("/logout")
	public void logoutPage() {
		
	}
}
