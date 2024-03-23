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

	
	// 로그인 페이지
	@GetMapping("/memberLogin")
	public String memberLogin() {
		System.out.println("MemberController memberLogin()");
		return "member/memberLogin";
	}
	
	// 로그인 기능
	@PostMapping("/memberLoginPro")
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController memberLoginPro()");
//		memberDTO = memberService.userCheck(memberDTO);
		
//		if(memberDTO != null) {
//			return "redirect:/member/main";
//		} else {
//			return "redirect:/member/login";
//		}
		
		return "redirect:/member/main";
	}
	
	// 회원가입
	@GetMapping("/memberInsert")
	public String memberInsert() {
		System.out.println("MemberController memberInsert()");
		return "member/memberInsert";
	}
	
	// 메인 페이지
	@GetMapping("/main")
	public String main() {
		System.out.println("MemberController main()");
		return "member/main";
	}
	
	@GetMapping("/test")
	public String test() {
		System.out.println("MemberController main()");
		return "member/test";
	}
	@GetMapping("/order")
	public String order() {
		System.out.println("MemberController order()");
		return "member/order";
	}
	@GetMapping("/contract")
	public String contract() {
		System.out.println("MemberController contract()");
		return "member/contract";
	}
	
	
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
