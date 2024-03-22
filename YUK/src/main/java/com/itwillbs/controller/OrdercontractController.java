package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ordercontract/*")
public class OrdercontractController {

	@GetMapping("/orderdeletepopup")
	public String orderdeletepopup() {	
		System.out.println("MemberController orderpopup()");
		return "ordercontract/orderdeletepopup";
	}
	@GetMapping("/orderaddpopup")
	public String orderaddpopup() {	
		System.out.println("MemberController addpopup()");
		return "ordercontract/orderaddpopup";
	}
	@GetMapping("/contractaddpopup")
	public String contractaddpopup() {	
		System.out.println("MemberController contractaddpopup()");
		return "ordercontract/contractaddpopup";
	}
	@GetMapping("/contractdeletepopup")
	public String contractdeletepopup() {	
		System.out.println("MemberController contractdeletepopup()");
		return "ordercontract/contractdeletepopup";
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
}
