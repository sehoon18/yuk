package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/member/*")

public class MemberController {
	@Inject
	MemberService memberService;

	
	// 로그인 페이지
	@GetMapping("/memberLogin")
	public void memberLogin(String error, String logout, Model model) {
		System.out.println("MemberController memberLogin()");
//		System.out.println(error);
//		System.out.println(logout);
		
		// 아이디나 비밀번호가 일치하지 않을 때
	    if(error != null) {
	        model.addAttribute("errorMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");
	    }
	    // 로그아웃 시
	    if(logout != null) {
			model.addAttribute("login", "login");
		}
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
	public String memberInsert(MemberDTO memberDTO, Authentication authentication,RedirectAttributes redirectAttributes) {
		System.out.println("MemberController memberInsert()");
		System.out.println(memberDTO);
		
		String username = authentication.getName();
		memberDTO.setName2(username);
		
		
		memberDTO.setPass(new BCryptPasswordEncoder().encode(memberDTO.getPass()));
		memberService.insertMember(memberDTO);
		
		return "redirect:/member/memberList";
	}
	@PostMapping("/memberUpdate")
	public String memberUpdate(MemberDTO memberDTO, HttpServletRequest request, Authentication authentication) {
		System.out.println("MemberController memberUpdate()");
		
		String username = authentication.getName();
		memberDTO.setName2(username);
		
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
	public String memberList(Model model , HttpServletRequest request,Authentication authentication, PageDTO pageDTO) {
		
		System.out.println("MemberController memberList()");
		
//		MemberDTO memberDTO = new MemberDTO();
//		
//		
//		memberService.userCheck(memberDTO);
//		System.out.println(memberDTO);
//		String id = request.getParameter("id");
//		memberDTO.setId(id);
//		String name = request.getParameter("name");
//		memberDTO.setName(name);
//		model.addAttribute("memberDTO",memberDTO);
		
		// 검색 기능
				pageDTO.setSearch1(request.getParameter("search1"));
				pageDTO.setSearch2(request.getParameter("search2"));
		
		// 페이징
				int pageSize = 10;
				String pageNum = request.getParameter("pageNum");
				if(pageNum == null) {
					pageNum="1";
				}
				
				int currentPage = Integer.parseInt(pageNum);
				
				pageDTO.setPageSize(pageSize);
				pageDTO.setPageNum(pageNum);
				pageDTO.setCurrentPage(currentPage);
				
				List<MemberDTO> memberList = memberService.getMemberList(pageDTO);
				
				int count =  memberService.getMemberCount(pageDTO);
				int pageBlock = 10;
				int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
				int endPage = startPage + pageBlock -1;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				
				pageDTO.setCount(pageCount);
				pageDTO.setPageBlock(pageBlock);
				pageDTO.setStartPage(startPage);
				pageDTO.setEndPage(endPage);
				pageDTO.setPageCount(pageCount);
				
				
		model.addAttribute("memberList" , memberList);
		model.addAttribute("pageDTO", pageDTO);
		
		
		return "member/memberList";
	}
	
	@GetMapping("/accessError")
	public void accessError(Model model, Authentication auth) {
		System.out.println("MemberController accessError()");
		model.addAttribute("msg", "Access Denied");
	}
	
	
	
}
