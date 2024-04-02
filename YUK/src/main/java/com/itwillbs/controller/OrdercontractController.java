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
	@PostMapping("/insertOrder")
	public String insertOrder(OrdercontractDTO ordercontractDTO ) {
		System.out.println("OrdercontractController insertOrder()");
		System.out.println(ordercontractDTO);
//		ordercontractDTO.setName("hong123");
		ordercontractService.insertOrder(ordercontractDTO);
		
		return "ordercontract/order";
	}
	
	@PostMapping("/insertContract")
	public String insertContract(OrdercontractDTO ordercontractDTO ) {
		System.out.println("OrdercontractController insertContract()");
		System.out.println(ordercontractDTO);
//		ordercontractDTO.setName("hong123");
		ordercontractService.insertContract(ordercontractDTO);
		
		return "ordercontract/contract";
	}
	
		// 작업지시 등록 팝업
		@GetMapping("/orderaddpopup")
		public String orderaddpopup(OrdercontractDTO ordercontractDTO, Model model) {
			System.out.println("OrdercontractController orderaddpopup()");
			
			// instructionCode 생성
			Integer ordLastNum = ordercontractService.getOrdLastNum();
			
			String ord_cd;
			if (ordLastNum == null) {
			    ord_cd = "ORD001";
			} else {
			    int nextNum = ordLastNum + 1;
			    if (nextNum < 10) {
			    	ord_cd = String.format("ORD00%d", nextNum);
			    } else if (nextNum < 100) {
			    	ord_cd = String.format("ORD0%d", nextNum);
			    } else {
			    	ord_cd = String.format("ORD%d", nextNum);
			    }
			}
			ordercontractDTO.setOrd_cd(ord_cd);
			model.addAttribute("ordercontractDTO", ordercontractDTO);
			
//			List<ProductionDTO> reqList = productionService.getReqList();
			
			return "popup/orderaddpopup";
		}
		@GetMapping("/contractaddpopup")
		public String contractaddpopup(OrdercontractDTO ordercontractDTO, Model model) {
			System.out.println("OrdercontractController contractaddpopup()");
			
			// instructionCode 생성
			Integer conLastNum = ordercontractService.getConLastNum();
			
			String con_cd;
			if (conLastNum == null) {
				con_cd = "CON001";
			} else {
			    int nextNum = conLastNum + 1;
			    if (nextNum < 10) {
			    	con_cd = String.format("CON00%d", nextNum);
			    } else if (nextNum < 100) {
			    	con_cd = String.format("CON0%d", nextNum);
			    } else {
			    	con_cd = String.format("CON%d", nextNum);
			    }
			}
			ordercontractDTO.setCon_cd(con_cd);
			model.addAttribute("ordercontractDTO", ordercontractDTO);
			
//			List<ProductionDTO> reqList = productionService.getReqList();
			
			return "popup/contractaddpopup";
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
