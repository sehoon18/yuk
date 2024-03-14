package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	// ���� ������
	@GetMapping("/main")
	public String main() {
		System.out.println("MemberController main()");
		return "member/main";
	}
}