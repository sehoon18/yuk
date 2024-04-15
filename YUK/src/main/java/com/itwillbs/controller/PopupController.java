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
import com.itwillbs.domain.WarehouseDTO;
import com.itwillbs.service.OrdercontractService;
import com.itwillbs.service.ProductionService;
import com.itwillbs.service.WarehouseService;

@Controller
@RequestMapping("/popup/*")
public class PopupController {
	@Inject
	private ProductionService productionService;
	@Inject
	private OrdercontractService ordercontractService;
	@Inject
	private WarehouseService warehouseService;

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
		pageDTO.setSearch0(lineStatus1);


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

	@GetMapping("/orderaddpopup")
	public String orderaddpopup(Model model,OrdercontractDTO ordercontractDTO, PageDTO pageDTO) {	
		System.out.println("PopupController orderaddpopup()");
//		List<OrdercontractDTO> orderList = ordercontractService.getOrderList(ordercontractDTO);
//		model.addAttribute("OrdercontractList", orderList);
//		System.out.println(orderList);
		return "popup/orderaddpopup";
	}
	@GetMapping("/contractaddpopup")
	public String contractaddpopup(Model model,OrdercontractDTO ordercontractDTO,PageDTO pageDTO) {	
		System.out.println("PopupController contractaddpopup()");
//		List<OrdercontractDTO> contractList = ordercontractService.getContractList(ordercontractDTO);
//		model.addAttribute("contractList", contractList);
//		System.out.println(contractList);
		return "popup/contractaddpopup";
	}
	
	
	@GetMapping("/orderpop")
	public String orderpop(Model model, OrdercontractDTO ordercontractDTO, PageDTO pageDTO,HttpServletRequest request) {
		System.out.println("PopupController orderpop()");
		
		
				int pageSize = 5;
				String pageNum = request.getParameter("pageNum");
				if(pageNum == null) {
					pageNum="1";
				}
				
				int currentPage = Integer.parseInt(pageNum);
				
				pageDTO.setPageSize(pageSize);
				pageDTO.setPageNum(pageNum);
				pageDTO.setCurrentPage(currentPage);
				
				List<OrdercontractDTO> orderList2 = ordercontractService.getOrderList2(pageDTO);
				
				int count =  ordercontractService.getOrderCount2(pageDTO);
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
				
				model.addAttribute("orderList2", orderList2);
				model.addAttribute("pageDTO", pageDTO);
				return "popup/orderpop";
	}
	
	@GetMapping("/orderpop2")
	public String orderpop2(Model model, OrdercontractDTO ordercontractDTO, PageDTO pageDTO,HttpServletRequest request) {
		System.out.println("PopupController orderpop2()");
		
		
		int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<OrdercontractDTO> orderList2 = ordercontractService.getOrderList2(pageDTO);
		
		int count =  ordercontractService.getOrderCount2(pageDTO);
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
		
		model.addAttribute("orderList2", orderList2);
		model.addAttribute("pageDTO", pageDTO);
		return "popup/orderpop2";
	}
	
	@GetMapping("/contractpop")
	public String contractpop(Model model,OrdercontractDTO ordercontractDTO ,PageDTO pageDTO,HttpServletRequest request) {
		System.out.println("PopupController contractpop()");
		
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<OrdercontractDTO> contractList2 = ordercontractService.getContractList2(pageDTO);
		
		int count =  ordercontractService.getContractCount2(pageDTO);
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
		
		model.addAttribute("contractList2", contractList2);
		model.addAttribute("pageDTO", pageDTO);
		return "popup/contractpop";
	}
	
	@GetMapping("/contractpop2")
	public String contractpop2(Model model,OrdercontractDTO ordercontractDTO ,PageDTO pageDTO,HttpServletRequest request) {
		System.out.println("PopupController contractpop2()");
		
		int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<OrdercontractDTO> contractList2 = ordercontractService.getContractList2(pageDTO);
		
		int count =  ordercontractService.getContractCount2(pageDTO);
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
		
		model.addAttribute("contractList2", contractList2);
		model.addAttribute("pageDTO", pageDTO);
		System.out.println(contractList2);
		System.out.println(pageDTO);
		return "popup/contractpop2";
	}
	@GetMapping("/ordclientpop")
	public String clientpop(Model model,OrdercontractDTO ordercontractDTO ,PageDTO pageDTO,HttpServletRequest request) {
		System.out.println("PopupController ordclientpop()");
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<OrdercontractDTO> clientList1 = ordercontractService.getClientList1(pageDTO);
		
		int count =  ordercontractService.getClientCount1(pageDTO);
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
		
		model.addAttribute("clientList1", clientList1);
		model.addAttribute("pageDTO", pageDTO);
		
		return "popup/ordclientpop";
	}
	@GetMapping("/conclientpop")
	public String conclientpop(Model model,OrdercontractDTO ordercontractDTO ,PageDTO pageDTO,HttpServletRequest request) {
		System.out.println("PopupController clientpop()");
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<OrdercontractDTO> clientList2 = ordercontractService.getClientList2(pageDTO);
		
		int count =  ordercontractService.getClientCount2(pageDTO);
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
		
		model.addAttribute("clientList2", clientList2);
		model.addAttribute("pageDTO", pageDTO);
		
		return "popup/conclientpop";
	}
	
	
	@GetMapping("/whpop")
	public String whpop(HttpServletRequest request, ProductionDTO productionDTO, Model model, PageDTO pageDTO) {
		System.out.println("popupcontroller/whpop()");

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
		
		List<WarehouseDTO> whList = warehouseService.getWhList(pageDTO);
		
		int count =  warehouseService.getWhCount(pageDTO);
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
		
		System.out.println(whList.get(0));
		model.addAttribute("whList", whList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "popup/whpop";
	}

	@GetMapping("/orderform")
	public String orderform(Model model,OrdercontractDTO ordercontractDTO) {
		System.out.println("PopupController orderform()");
		ordercontractDTO=ordercontractService.getOrderform(ordercontractDTO);
		model.addAttribute("ordercontractDTO", ordercontractDTO);
	    return "popup/orderform"; 
	}
	@GetMapping("/contractform")
	public String contractform(Model model,OrdercontractDTO ordercontractDTO) {
		System.out.println("PopupController contractform()");
		ordercontractDTO=ordercontractService.getContractform(ordercontractDTO);
		model.addAttribute("ordercontractDTO", ordercontractDTO);
		System.out.println(ordercontractDTO);
	    return "popup/contractform"; 
	}
	
}
