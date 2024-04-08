package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String loginPro(MemberDTO memberDTO, HttpSession session, RedirectAttributes redirectAttributes) {
		System.out.println("MemberController memberLoginPro()");
     	memberDTO = memberService.userCheck(memberDTO);
     	
		if(memberDTO != null) {
			session.setAttribute("name", memberDTO.getName());
			session.setAttribute("permission", memberDTO.getPermission());
			return "redirect:/member/main";
		} else {
			redirectAttributes.addFlashAttribute("message", "아이디/비밀번호가 일치하지 않습니다.");
			return "redirect:/member/memberLogin";
		}
		
	}
	
	@PostMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("logout");
		session.invalidate();
		return "member/memberLogin";
	}
	
	
	@PostMapping("/memberInsert")
	public String memberInsert(MemberDTO memberDTO) {
		System.out.println("MemberController memberInsert()");
		System.out.println(memberDTO);
		
		memberService.insertMember(memberDTO);
		
		return "redirect:/member/memberList";
	}
	@PostMapping("/memberUpdate")
	public String memberUpdate(MemberDTO memberDTO, HttpServletRequest request) {
		System.out.println("MemberController memberUpdate()");
		System.out.println("memberUpdate의 멤버디티오 값1:" + memberDTO);
		
		memberService.updateMember(memberDTO);
		
		return "redirect:/member/memberList";
	}
	
	@PostMapping("/memberDelete")
	public String memberDelete(@RequestBody MemberDTO memberDTO) {
		System.out.println("MemberController memberDelete()");
		System.out.println(memberDTO);
		
		memberService.deleteMember(memberDTO);
		
		return "redirect:/member/memberList";
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
	@GetMapping("/memberList")
	public String memberList(Model model , HttpServletRequest request, HttpSession session) {
		System.out.println("MemberController memberList()");
		
		Integer permission = (Integer)session.getAttribute("permission");
		if(permission != 0 || permission == null) {
			return "redirect:/member/memberLogin";
		}
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setPermission(permission);
		model.addAttribute("memberDTO", memberDTO);
		
		memberService.userCheck(memberDTO);
		System.out.println(memberDTO);
		String id = request.getParameter("id");
		
		memberDTO.setId(id);
		String name = request.getParameter("name");
		memberDTO.setName(name);
		model.addAttribute("memberDTO",memberDTO);
		
		List<MemberDTO> memberList;
		if(id == null && name == null) {
			memberList = memberService.getMemberList(memberDTO);
		}else {
			memberList = memberService.searchMemberList(memberDTO);
		}
		
		model.addAttribute("memberList" , memberList);
		
		
		
		return "member/memberList";
	}
	
}
