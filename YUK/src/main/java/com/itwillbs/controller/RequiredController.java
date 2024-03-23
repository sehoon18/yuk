package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/required/*")
public class RequiredController {
	
	
	@GetMapping("/requiredMain")
	public String requiredMain() {
		System.out.println("RequiredController requiredMain()");
		return "required/requiredMain";
	}
	@GetMapping("/requiredPopUp")
	public String requiredPopUp() {
		System.out.println("RequiredController requiredPopUp()");
		return "required/requiredPopUp";
	}
	
}
