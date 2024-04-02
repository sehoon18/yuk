package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String order(HttpServletRequest request,Model model,OrdercontractDTO ordercontractDTO ) {
		System.out.println("MemberController order()");
		String ord_cd = request.getParameter("ord_cd");
		ordercontractDTO.setOrd_cd(ord_cd);
		String cli_name = request.getParameter("cli_name");
		ordercontractDTO.setCli_name(cli_name);
		String pro_name = request.getParameter("pro_name");
		ordercontractDTO.setPro_name(pro_name);
		
		List<OrdercontractDTO> orderList = ordercontractService.getOrderList(ordercontractDTO);
		model.addAttribute("OrderList", orderList);
		System.out.println(orderList);
		
		return "ordercontract/order";
	}
	@GetMapping("/contract")
	public String contract(HttpServletRequest request,Model model,OrdercontractDTO ordercontractDTO ) {
		System.out.println("MemberController contract()");
		String con_cd = request.getParameter("con_cd");
		ordercontractDTO.setCon_cd(con_cd);
		String cli_name = request.getParameter("cli_name");
		ordercontractDTO.setCli_name(cli_name);
		String pro_name = request.getParameter("pro_name");
		ordercontractDTO.setPro_name(pro_name);
		
		List<OrdercontractDTO> contractList = ordercontractService.getContractList(ordercontractDTO);
		model.addAttribute("ContractList", contractList);
		
		System.out.println(contractList);
		return "ordercontract/contract";
	}
	
	
	
	
}
