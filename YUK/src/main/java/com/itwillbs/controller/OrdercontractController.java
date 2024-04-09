package com.itwillbs.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.protobuf.TimestampProto;
import com.itwillbs.domain.OrdercontractDTO;
import com.itwillbs.domain.PageDTO;
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
//		model.addAttribute("pageDTO", pageDTO);
		return "ordercontract/contract";
	}
	@PostMapping("/insertOrder")
	public ResponseEntity<String> insertOrder(@RequestBody OrdercontractDTO ordercontractDTO ) {
		System.out.println("OrdercontractController insertContract()");
		System.out.println(ordercontractDTO);
		
		Timestamp today = new Timestamp(System.currentTimeMillis());
		ordercontractDTO.setOrd_date(today);
		ordercontractDTO.setUser_id("hong123");
		ordercontractService.insertOrder(ordercontractDTO);
		System.out.println(ordercontractDTO);
		
		return ResponseEntity.ok().body("{\"message\": \"등록 성공!\"}");
	}
	
	@PostMapping("/insertContract")
	public ResponseEntity<String> insertContract(@RequestBody OrdercontractDTO ordercontractDTO ) {
		System.out.println("OrdercontractController insertContract()");
		System.out.println(ordercontractDTO);
		
		Timestamp today = new Timestamp(System.currentTimeMillis());
		ordercontractDTO.setCon_date(today);
		ordercontractDTO.setUser_id("hong123");
		ordercontractService.insertContract(ordercontractDTO);
		System.out.println(ordercontractDTO);
		
		return ResponseEntity.ok().body("{\"message\": \"등록 성공!\"}");
	}
		
	@PostMapping("/updateOrder")
	public ResponseEntity<String> updateOrder(@RequestBody OrdercontractDTO ordercontractDTO ) {
		System.out.println("OrdercontractController updateOrder()");
		System.out.println(ordercontractDTO);	
		
		Timestamp today = new Timestamp(System.currentTimeMillis());
		ordercontractDTO.setOrd_date(today);
		ordercontractDTO.setUser_id("hong123");
		ordercontractDTO.getOrd_cd();
		ordercontractService.updateOrder(ordercontractDTO);
		System.out.println(ordercontractDTO);
		
		return ResponseEntity.ok().body("{\"message\": \"등록 성공!\"}");
	}
	
	@PostMapping("/updateContract")
	public ResponseEntity<String> updateContract(@RequestBody OrdercontractDTO ordercontractDTO ) {
		System.out.println("OrdercontractController updateContract()");
		System.out.println(ordercontractDTO);
		
		Timestamp today = new Timestamp(System.currentTimeMillis());
		ordercontractDTO.setCon_date(today);
		ordercontractDTO.setUser_id("hong123");
		ordercontractService.updateContract(ordercontractDTO);
		System.out.println(ordercontractDTO);
		
		return ResponseEntity.ok().body("{\"message\": \"등록 성공!\"}");
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
			return "popup/orderaddpopup";
		}
		@GetMapping("/orderdeletepopup")
		public String orderdeletepopup(HttpServletRequest request, OrdercontractDTO ordercontractDTO, Model model) {
			System.out.println("OrdercontractController orderdeletepopup()");
			String ord_cd = request.getParameter("ord_cd");
			ordercontractDTO.setOrd_cd(ord_cd);
			
			ordercontractDTO=ordercontractService.getOrder(ordercontractDTO);
			
			System.out.println(ordercontractDTO);
			model.addAttribute("ordercontractDTO", ordercontractDTO);
			return "popup/orderdeletepopup";
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
			return "popup/contractaddpopup";
		}
		@GetMapping("/contractdeletepopup")
		public String contractdeletepopup(HttpServletRequest request,OrdercontractDTO ordercontractDTO, Model model) {
			System.out.println("OrdercontractController contractdeletepopup()");
			
			String con_cd = request.getParameter("con_cd");
			ordercontractDTO.setCon_cd(con_cd);
			
			ordercontractDTO=ordercontractService.getContract(ordercontractDTO);
			
			System.out.println(ordercontractDTO);
			model.addAttribute("ordercontractDTO", ordercontractDTO);
			return "popup/contractdeletepopup";
		}
	
		@PostMapping("/deleteOrder")
		public String deleteOrder(  HttpServletRequest request,OrdercontractDTO ordercontractDTO) {
			System.out.println("OrdercontractController deleteorder()");
			System.out.println(ordercontractDTO);
			String ord_cd = request.getParameter("ord_cd");
			ordercontractDTO.setOrd_cd(ord_cd);
			ordercontractService.deleteOrder(ordercontractDTO);
			System.out.println(ordercontractDTO);
			
			return "ordercontract/order";
		}
		@PostMapping("/deleteContract")
		public String deleteContract( HttpServletRequest request,OrdercontractDTO ordercontractDTO) {
			System.out.println("OrdercontractController deletecontract()");
			System.out.println(ordercontractDTO);
			String con_cd = request.getParameter("con_cd");
			ordercontractDTO.setCon_cd(con_cd);
			ordercontractService.deleteContract(ordercontractDTO);
			System.out.println(ordercontractDTO);
			
//			return ResponseEntity.ok().body("{\"message\": \"등록 성공!\"}");
			return "ordercontract/contract";
		}
//		@GetMapping("/orders")
//		public String showOrders(Model model,OrdercontractDTO ordercontractDTO) {
//			List<OrdercontractDTO> orderList = ordercontractService.getOrderList(ordercontractDTO);
//			model.addAttribute("OrderList", orderList);
//			System.out.println(orderList);
//		    return "popup/orderpop"; // JSP 파일의 경로 (View의 이름)
//		}
//		@GetMapping("/contracts")
//		public String showContracts(Model model,OrdercontractDTO ordercontractDTO) {
//			List<OrdercontractDTO> contractList = ordercontractService.getContractList(ordercontractDTO);
//			model.addAttribute("ContractList", contractList);
//			System.out.println(contractList);
//		    return "popup/orderpop"; // JSP 파일의 경로 (View의 이름)
//		}
//	
}
