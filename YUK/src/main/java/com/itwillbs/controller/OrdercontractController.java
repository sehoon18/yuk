package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.OrdercontractDTO;
import com.itwillbs.domain.ProductionDTO;
import com.itwillbs.service.OrdercontractService;

@Controller
@RequestMapping("/ordercontract/*")



public class OrdercontractController {
	@Inject
	private OrdercontractService ordercontractService;
	
	
	//Ordercontract
	@GetMapping("/order")
	public String order(Model model) {
		System.out.println("MemberController order()");
		List<OrdercontractDTO> orderList = ordercontractService.getOrderList();
		model.addAttribute("OrderList", orderList);
		System.out.println(orderList);
		return "ordercontract/order";
	}
	@GetMapping("/contract")
	public String contract(Model model) {
		System.out.println("MemberController contract()");
		List<OrdercontractDTO> contractList = ordercontractService.getContractList();
		model.addAttribute("ContractList", contractList);
		
		System.out.println(contractList);
		return "ordercontract/contract";
	}
	
	
	
	
}
