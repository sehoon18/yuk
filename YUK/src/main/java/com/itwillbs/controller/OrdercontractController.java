package com.itwillbs.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
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
	public String order(HttpServletRequest request,Model model,OrdercontractDTO ordercontractDTO, PageDTO pageDTO) {
		System.out.println("OrdercontractController orderList()");
		String search1 = request.getParameter("search1");
		pageDTO.setSearch1(search1);
		String search2 = request.getParameter("search2");
		pageDTO.setSearch2(search2);
		String search3 = request.getParameter("search3");
		pageDTO.setSearch3(search3);
		
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
		
		List<OrdercontractDTO> orderList = ordercontractService.getOrderList(pageDTO);
		
		int count =  ordercontractService.getOrderCount(pageDTO);
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
		
		model.addAttribute("OrderList", orderList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "ordercontract/order";
	}
	@GetMapping("/contract")
	public String contract(HttpServletRequest request,Model model,OrdercontractDTO ordercontractDTO, PageDTO pageDTO) {
		System.out.println("OrdercontractController contractList()");
		String search1 = request.getParameter("search1");
		pageDTO.setSearch1(search1);
		String search2 = request.getParameter("search2");
		pageDTO.setSearch2(search2);
		String search3 = request.getParameter("search3");
		pageDTO.setSearch3(search3);
		
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
		
		List<OrdercontractDTO> contractList = ordercontractService.getContractList(pageDTO);
		
		int count =  ordercontractService.getContractCount(pageDTO);
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
		
		model.addAttribute("ContractList", contractList);
		model.addAttribute("pageDTO", pageDTO);
		return "ordercontract/contract";
	}
	@PostMapping("/insertOrder")
	public ResponseEntity<String> insertOrder(@RequestBody OrdercontractDTO ordercontractDTO, Authentication authentication) {
		System.out.println("OrdercontractController insertContract()");
		System.out.println(ordercontractDTO);
		
		Timestamp today = new Timestamp(System.currentTimeMillis());
		ordercontractDTO.setOrd_date(today);
//		ordercontractDTO.setUser_id("hong123");
		String username = authentication.getName();
		ordercontractDTO.setUser_id(username);	
		ordercontractService.insertOrder(ordercontractDTO);
		ordercontractService.insertMib(ordercontractDTO);
		System.out.println(ordercontractDTO);
		
		return ResponseEntity.ok().body("{\"message\": \"등록 성공!\"}");
	}
	
	@PostMapping("/insertContract")
	public ResponseEntity<String> insertContract(@RequestBody OrdercontractDTO ordercontractDTO, Authentication authentication) {
		System.out.println("OrdercontractController insertContract()");
		System.out.println(ordercontractDTO);
		
		Timestamp today = new Timestamp(System.currentTimeMillis());
		ordercontractDTO.setCon_date(today);
//		ordercontractDTO.setUser_id("hong123");
		String username = authentication.getName();
		ordercontractDTO.setUser_id(username);
		ordercontractService.insertContract(ordercontractDTO);
		ordercontractService.insertOb(ordercontractDTO);
		System.out.println(ordercontractDTO);
		
		return ResponseEntity.ok().body("{\"message\": \"등록 성공!\"}");
	}
		
	@PostMapping("/updateOrder")
	public ResponseEntity<String> updateOrder(@RequestBody OrdercontractDTO ordercontractDTO,Authentication authentication) {
		System.out.println("OrdercontractController updateOrder()");
		System.out.println(ordercontractDTO);	
		
		Timestamp today = new Timestamp(System.currentTimeMillis());
		ordercontractDTO.setOrd_date(today);
//		ordercontractDTO.setUser_id("hong123");
		String username = authentication.getName();
		ordercontractDTO.setUser_id(username);
		ordercontractDTO.getOrd_cd();
		ordercontractService.updateOrder(ordercontractDTO);
		System.out.println(ordercontractDTO);
		
		return ResponseEntity.ok().body("{\"message\": \"등록 성공!\"}");
	}
	
	@PostMapping("/updateContract")
	public ResponseEntity<String> updateContract(@RequestBody OrdercontractDTO ordercontractDTO,Authentication authentication ) {
		System.out.println("OrdercontractController updateContract()");
		System.out.println(ordercontractDTO);
		
		Timestamp today = new Timestamp(System.currentTimeMillis());
		ordercontractDTO.setCon_date(today);
//		ordercontractDTO.setUser_id("hong123");
		String username = authentication.getName();
		ordercontractDTO.setUser_id(username);
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
//			return ResponseEntity.ok().body("{\"message\": \"등록 성공!\"}");
			return "popup/orderaddpopup";
		}
		@GetMapping("/orderdeletepopup")
		public String orderdeletepopup(HttpServletRequest request, OrdercontractDTO ordercontractDTO, Model model) {
			System.out.println("OrdercontractController orderdeletepopup()");
			String ord_cd = request.getParameter("ord_cd");
			ordercontractDTO.setOrd_cd(ord_cd);
			
			ordercontractDTO=ordercontractService.getOrder(ordercontractDTO);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    String dueDateString = dateFormat.format(ordercontractDTO.getOrd_due_date());
		    String payDateString = dateFormat.format(ordercontractDTO.getOrd_pay_date());
		  
		    
			System.out.println(ordercontractDTO);
			model.addAttribute("ordercontractDTO", ordercontractDTO);
			 model.addAttribute("dueDateString", dueDateString);
			 model.addAttribute("payDateString", payDateString);
			
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
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    String dueDateString = dateFormat.format(ordercontractDTO.getCon_due_date());
		    String payDateString = dateFormat.format(ordercontractDTO.getCon_pay_date());
		  
		    
			System.out.println(ordercontractDTO);
			model.addAttribute("ordercontractDTO", ordercontractDTO);
			 model.addAttribute("dueDateString", dueDateString);
			 model.addAttribute("payDateString", payDateString);

			return "popup/contractdeletepopup";
		}
	
		@PostMapping("/deleteOrder")
		public ResponseEntity<String> deleteOrder(@RequestBody  OrdercontractDTO ordercontractDTO) {
			System.out.println("OrdercontractController deleteorder()");
			System.out.println(ordercontractDTO);

			ordercontractService.deleteOrder(ordercontractDTO);
			ordercontractService.deleteMib(ordercontractDTO);
			System.out.println(ordercontractDTO);
			
			return ResponseEntity.ok().body("{\"message\": \"등록 성공!\"}");

		}
		@PostMapping("/deleteContract")
		public ResponseEntity<String> deleteContract(@RequestBody OrdercontractDTO ordercontractDTO) {
			System.out.println("OrdercontractController deletecontract()");
			System.out.println(ordercontractDTO);

			ordercontractService.deleteContract(ordercontractDTO);
			ordercontractService.deleteOb(ordercontractDTO);
			System.out.println(ordercontractDTO);
			
			return ResponseEntity.ok().body("{\"message\": \"등록 성공!\"}");

		}
	
}
