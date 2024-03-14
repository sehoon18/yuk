package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	// 메인 페이지
	@GetMapping("/main")
	public String main() {
		System.out.println("MemberController main()");
		return "member/main";
	}
}
