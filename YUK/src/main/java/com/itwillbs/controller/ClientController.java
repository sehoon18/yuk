package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/client/*")
public class ClientController {
	
	@Inject
	MemberService memberService;

	
	//거래처 관리
	@GetMapping("/client")
	public String client() {
		System.out.println("ClientController client()");
		return "client/client";
	}
	
	//거래처 상세페이지
	@GetMapping("/clientDetailPopup")
	public String clientDetailPopup() {
		System.out.println("ClientController clientDetailPopup()");
		return "client/clientDetailPopup";
	}
	
	//거래처 등록
	@GetMapping("/clientAddPopup")
	public String clientAddPopup() {
		System.out.println("ClientController clientAddPopup()");
		return "client/clientAddPopup";
	}
	
	//거래처코드 조회
	@GetMapping("/clientCodePopup")
	public String clientCodePopup() {
		System.out.println("ClientController clientCodePopup()");
		return "client/clientCodePopup";
	}
	
}
