package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.OrdercontractDTO;
import com.itwillbs.domain.ProductionDTO;
import com.itwillbs.service.OrdercontractService;
import com.itwillbs.service.ProductionService;

@Controller
@RequestMapping("/popup/*")
public class PopupController {
	@Inject
	private ProductionService productionService;
	@Inject
	private OrdercontractService ordercontractService;

	
	
	@GetMapping("/linepop")
	public String linepop(ProductionDTO productionDTO, Model model) {
		
		List<ProductionDTO> lineList = productionService.getLineList();
		model.addAttribute("lineList", lineList);
		
		return "popup/linepop";
	}
	@GetMapping("/orderdeletepopup")
	public String orderdeletepopup(Model model) {	
		System.out.println("PopupController orderdeletepopup()");
		List<OrdercontractDTO> orderList = ordercontractService.getOrderList();
		model.addAttribute("OrderList", orderList);
		System.out.println(orderList);
		return "popup/orderdeletepopup";
	}
	@GetMapping("/orderaddpopup")
	public String orderaddpopup(Model model) {	
		System.out.println("PopupController orderaddpopup()");
		List<OrdercontractDTO> orderList = ordercontractService.getOrderList();
		model.addAttribute("OrdercontractList", orderList);
		System.out.println(orderList);
		return "popup/orderaddpopup";
	}
	@GetMapping("/contractaddpopup")
	public String contractaddpopup(Model model) {	
		System.out.println("PopupController contractaddpopup()");
		List<OrdercontractDTO> contractList = ordercontractService.getContractList();
		model.addAttribute("contractList", contractList);
		System.out.println(contractList);
		return "popup/contractaddpopup";
	}
	@GetMapping("/contractdeletepopup")
	public String contractdeletepopup(Model model) {	
		System.out.println("PopupController contractdeletepopup()");
		List<OrdercontractDTO> contractList = ordercontractService.getContractList();
		model.addAttribute("contractList", contractList);
		System.out.println(contractList);
		return "popup/contractdeletepopup";
	}
	
	@GetMapping("/orderpop")
	public String orderpop(Model model) {
		System.out.println("PopupController orderpop()");
		List<OrdercontractDTO> orderList = ordercontractService.getOrderList();
		model.addAttribute("OrderList", orderList);
		System.out.println(orderList);
		return "popup/orderpop";
	}
	@GetMapping("/contractpop")
	public String contractpop(Model model) {
		System.out.println("PopupController contractpop()");
		List<OrdercontractDTO> contractList = ordercontractService.getContractList();
		model.addAttribute("ContractList", contractList);
		
		System.out.println(contractList);
		return "popup/contractpop";
	}
}
