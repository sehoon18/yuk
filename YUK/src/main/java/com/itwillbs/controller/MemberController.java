package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Inject
	MemberService memberService;
	
	
	
	
	
	// --------------------------------- test --------------------------------------
//	@GetMapping("/main")
//	public String main() {
//		System.out.println("MemberController main()");
//		return "member/main";
//	}
//
//	@PostMapping("/loginPro")
//	public String loginPro(MemberDTO memberDTO, HttpSession session) {
//		System.out.println("MemberController loginPro()");
//		System.out.println(memberDTO);
//		memberDTO = memberService.userCheck(memberDTO);
//		
//		if(memberDTO != null) {
//			return "redirect:/member/main";
//		} else {
//			return "redirect:/member/login";
//		}
//		
//	}
}
