package com.itwillbs.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		List<String> roleNames = new ArrayList<String>();
		
		authentication.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());
		});
		
		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect(request.getContextPath() + "/member/main");
			return;
		}
		if (roleNames.contains("ROLE_BOUND")) {
			response.sendRedirect(request.getContextPath() + "/member/main");
			return;
		}
		if (roleNames.contains("ROLE_PRODUCT")) {
			response.sendRedirect(request.getContextPath() + "/member/main");
			return;
		}
		if (roleNames.contains("ROLE_OC")) {
			response.sendRedirect(request.getContextPath() + "/member/main");
			return;
		}
		if (roleNames.contains("ROLE_PRODUCTION")) {
			response.sendRedirect(request.getContextPath() + "/member/main");
			return;
		}
		
//		if (roleNames.contains("ROLE_PRODUCTION")) {
//			response.sendRedirect(request.getContextPath() + "/production/line");
//			return;
//		}
		
		response.sendRedirect(request.getContextPath() + "/");
	}
}
