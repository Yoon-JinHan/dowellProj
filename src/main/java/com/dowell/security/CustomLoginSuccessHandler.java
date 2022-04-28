package com.dowell.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	//로그인 성공 처리 핸들러
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.warn("Login Success");
		
		//권한 저장할 리스트
		List<String> roleNames=new ArrayList<String>();
		
		authentication.getAuthorities().forEach(authority->{roleNames.add(authority.getAuthority());});

		log.warn("ROLE NAMES : " + roleNames);
		
		//권한명에 따른 redirect 경로
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/home");
			return;
		}
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/home");
			return;
		}
		//권한 없으면 첫 화면으로
		response.sendRedirect("/");
	}

}
