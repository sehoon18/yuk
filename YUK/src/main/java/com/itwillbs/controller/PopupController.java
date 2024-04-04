package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.OrdercontractDTO;
import com.itwillbs.domain.PageDTO;
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

	@GetMapping("/productpop")
	public String contractpop(ProductionDTO productionDTO, Model model, PageDTO pageDTO, HttpServletRequest request) {
		
		// 검색 기능
		pageDTO.setSearch1(request.getParameter("search1"));
		pageDTO.setSearch2(request.getParameter("search2"));

		// 페이징
		int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<ProductionDTO> productList = productionService.getProductList(pageDTO);
		
		int count =  productionService.getProCount(pageDTO);
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
		
		model.addAttribute("productList", productList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "popup/productpop";
	}
	
	@GetMapping("/linepop")
	public String linepop(HttpServletRequest request, ProductionDTO productionDTO, Model model, PageDTO pageDTO) {
		
		// 검색 기능
		pageDTO.setSearch1(request.getParameter("search1"));
		pageDTO.setSearch2(request.getParameter("search2"));
		String lineStatus = (String)request.getParameter("search5");
		System.out.println(pageDTO);
		int lineStatus1 = 4;
		if(lineStatus == null) {
			lineStatus1 = 4;
		} else {
			lineStatus1 = Integer.parseInt(request.getParameter("search5"));
		}
		pageDTO.setSearch5(lineStatus1);


		// 페이징
		int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<ProductionDTO> lineList = productionService.getLineList(pageDTO);
		
		int count =  productionService.getLineCount(pageDTO);
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
		
		model.addAttribute("lineList", lineList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "popup/linepop";
	}
	@GetMapping("/orderdeletepopup")
	public String orderdeletepopup(Model model,OrdercontractDTO ordercontractDTO) {	
		System.out.println("PopupController orderdeletepopup()");
		List<OrdercontractDTO> orderList = ordercontractService.getOrderList(ordercontractDTO);
		model.addAttribute("OrderList", orderList);
		System.out.println(orderList);
		return "popup/orderdeletepopup";
	}
	@GetMapping("/orderaddpopup")
	public String orderaddpopup(Model model,OrdercontractDTO ordercontractDTO) {	
		System.out.println("PopupController orderaddpopup()");
		List<OrdercontractDTO> orderList = ordercontractService.getOrderList(ordercontractDTO);
		model.addAttribute("OrdercontractList", orderList);
		System.out.println(orderList);
		return "popup/orderaddpopup";
	}
	@GetMapping("/contractaddpopup")
	public String contractaddpopup(Model model,OrdercontractDTO ordercontractDTO) {	
		System.out.println("PopupController contractaddpopup()");
		List<OrdercontractDTO> contractList = ordercontractService.getContractList(ordercontractDTO);
		model.addAttribute("contractList", contractList);
		System.out.println(contractList);
		return "popup/contractaddpopup";
	}
	@GetMapping("/contractdeletepopup")
	public String contractdeletepopup(Model model,OrdercontractDTO ordercontractDTO) {	
		System.out.println("PopupController contractdeletepopup()");
		List<OrdercontractDTO> contractList = ordercontractService.getContractList(ordercontractDTO);
		model.addAttribute("contractList", contractList);
		System.out.println(contractList);
		return "popup/contractdeletepopup";
	}
	
	@GetMapping("/orderpop")
	public String orderpop(Model model, OrdercontractDTO ordercontractDTO) {
		System.out.println("PopupController orderpop()");
		List<OrdercontractDTO> orderList = ordercontractService.getOrderList(ordercontractDTO);
		model.addAttribute("OrderList", orderList);
		System.out.println(orderList);
		return "popup/orderpop";
	}
	@GetMapping("/contractpop")
	public String contractpop(Model model,OrdercontractDTO ordercontractDTO) {
		System.out.println("PopupController contractpop()");
		List<OrdercontractDTO> contractList = ordercontractService.getContractList(ordercontractDTO);
		model.addAttribute("ContractList", contractList);
		
		System.out.println(contractList);
		return "popup/contractpop";
	}
}
