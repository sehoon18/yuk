package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ProductionDTO;
import com.itwillbs.domain.WarehouseDTO;
import com.itwillbs.service.WarehouseService;

@Controller
@RequestMapping("/warehouse/*")
public class WarehouseController {
	
		@Inject
		WarehouseService warehouseService;
	
	//재고 관리
	@GetMapping("/stock")
	public String stock(Model model, HttpServletRequest request) {
		System.out.println("WarehouseController stock()");
		
		WarehouseDTO warehouseDTO = new WarehouseDTO();
		
		//검색어 가져오기
		String productCode = request.getParameter("productCode");
		warehouseDTO.setProductCode(productCode);
		String productName = request.getParameter("productName");
		warehouseDTO.setProductName(productName);
		String warehouseName = request.getParameter("warehouseName");
		warehouseDTO.setWarehouseName(warehouseName);
		String productTypeParam = request.getParameter("productType");
		
		int productType = 100;
		if(productTypeParam != null && !productTypeParam.isEmpty()) {
			try {
				productType = Integer.parseInt(productTypeParam);
			}catch(NumberFormatException e) {
				e.printStackTrace();
			}
		}
		warehouseDTO.setProductType(productType);
		System.out.println(productType);
		
		List<WarehouseDTO> stockList;
		
		if(productCode == null && productName == null && warehouseName == null) {
			stockList = warehouseService.getstockList();
		}else {
			stockList = warehouseService.getSearchStockList(warehouseDTO);
		}
		
		model.addAttribute("stockList", stockList);

		return "warehouse/stock";
		}
	
	@PostMapping("/stockPro")
	public String stockPro(WarehouseDTO warehouseDTO, HttpSession session) {
		System.out.println("WarehouseController stockPro()");
		System.out.println(warehouseDTO);
		
//		String id = (String)session.getAttribute("id");
		//warehouseDTO.setName("");
		
		warehouseService.insertStock(warehouseDTO);
		
		return "redirect:/warehouse/stock";
	}
	
		//재고코드 조회
		@GetMapping("/stockCodePopup")
		public String stockCodePopup(HttpServletRequest request, Model model) {
			System.out.println("WarehouseController stockCodePopup()");
			
			WarehouseDTO warehouseDTO = new WarehouseDTO();
			
			//검색어 가져오기
			String productCode = request.getParameter("productCode");
			warehouseDTO.setProductCode(productCode);
			String productName = request.getParameter("productName");
			warehouseDTO.setProductName(productName);
			String warehouseName = request.getParameter("warehouseName");
			warehouseDTO.setWarehouseName(warehouseName);
			String productTypeParam = request.getParameter("productType");
			
			int productType = 100;
			if(productTypeParam != null && !productTypeParam.isEmpty()) {
				try {
					productType = Integer.parseInt(productTypeParam);
				}catch(NumberFormatException e) {
					e.printStackTrace();
				}
			}
			warehouseDTO.setProductType(productType);
			System.out.println(productType);
			
			List<WarehouseDTO> stockList;
			
			if(productCode == null && productName == null && warehouseName == null && productType == 100) {
				stockList = warehouseService.getstockList();
			}else {
				stockList = warehouseService.getSearchStockList(warehouseDTO);
			}
			
			model.addAttribute("stockList", stockList);

			return "warehouse/stockCodePopup";
		}
		
		@PostMapping("/stockUpdatePro")
		public String stockUpdatePro(WarehouseDTO warehouseDTO, Authentication authentication) {
			System.out.println("ProductController stockUpdatePro()");
			System.out.println(warehouseDTO);
			
			String username = authentication.getName();
			warehouseDTO.setName(username);	
			warehouseService.updateStock(warehouseDTO);
			
			return "redirect:/warehouse/stock";
		}
	
	//------------------------------------------------------------------------------------------------	
	
		//창고 관리
		@GetMapping("/warehouse")
		public String warehouse(Model model, HttpServletRequest request) {
			System.out.println("WarehouseController warehouse()");
			
			WarehouseDTO warehouseDTO = new WarehouseDTO();
			
			//검색어 가져오기
			String warehouseCode = request.getParameter("warehouseCode");
			warehouseDTO.setProductCode(warehouseCode);
			String warehouseName = request.getParameter("warehouseName");
			warehouseDTO.setWarehouseName(warehouseName);
			String warehouseLocal = request.getParameter("warehouseLocal");
			warehouseDTO.setWarehouseLocal(warehouseLocal);
			
			List<WarehouseDTO> warehouseList;
			
			if(warehouseCode == null && warehouseName == null && warehouseLocal == null) {
				warehouseList = warehouseService.getWarehouseList();
			}else {
				warehouseList = warehouseService.getSearchWarehouseList(warehouseDTO);
			}
			
			model.addAttribute("warehouseList", warehouseList);
			
			//warehouseCode 생성
			Integer warehouseLastNum = warehouseService.getWarehouseLastNum();
			
			if(warehouseLastNum == null) {
				warehouseCode = "WH001";
			}else {
				int nextNum = warehouseLastNum + 1;
				if(nextNum < 10) {
					warehouseCode = String.format("WH00%d", nextNum);
				}else if(nextNum < 100) {
					warehouseCode = String.format("WH0%d", nextNum);
				}else {
					warehouseCode = String.format("WH%d", nextNum);
				}
			}
			warehouseDTO.setWarehouseCode(warehouseCode);
			model.addAttribute("warehouseDTO", warehouseDTO);
			
			return "warehouse/warehouse";
		}
		
		@PostMapping("/warehousePro")
		public String warehousePro(WarehouseDTO warehouseDTO, HttpSession session, Authentication authentication) {
			System.out.println("WarehouseController warehousePro()");
			System.out.println(warehouseDTO);
			
			String username = authentication.getName();
			warehouseDTO.setName(username);			
			warehouseService.insertWarehouse(warehouseDTO);
			
			return "redirect:/warehouse/warehouse";
		}
		
	//창고코드 조회
	@GetMapping("/warehouseCodePopup")
	public String warehouseCodePopup(HttpServletRequest request, Model model) {
		System.out.println("WarehouseController warehouseCodePopup()");
		
		WarehouseDTO warehouseDTO = new WarehouseDTO();
		
		//검색어 가져오기
		String warehouseCode = request.getParameter("warehouseCode");
		warehouseDTO.setProductCode(warehouseCode);
		String warehouseName = request.getParameter("warehouseName");
		warehouseDTO.setWarehouseName(warehouseName);
		String warehouseLocal = request.getParameter("warehouseLocal");
		warehouseDTO.setWarehouseLocal(warehouseLocal);
		
		List<WarehouseDTO> warehouseList;
		
		if(warehouseCode == null && warehouseName == null && warehouseLocal == null) {
			warehouseList = warehouseService.getWarehouseList();
		}else {
			warehouseList = warehouseService.getSearchWarehouseList(warehouseDTO);
		}
		
		model.addAttribute("warehouseList", warehouseList);
		
		return "warehouse/warehouseCodePopup";
	}
	
	
	@PostMapping("/warehouseInsertPro")
	public String warehouseInsertPro(WarehouseDTO warehouseDTO, Authentication authentication) {
		System.out.println("warehouseController warehouseInsertPro");
		System.out.println(warehouseDTO);
		
		String username = authentication.getName();
		warehouseDTO.setName(username);		
		warehouseService.insertWarehouse(warehouseDTO);
		
		return "redirect:/warehouse/warehouse";
	}
	
	
	
	@PostMapping("/warehouseUpdatePro")
	public String warehouseUpdatePro(WarehouseDTO warehouseDTO, Authentication authentication) {
		System.out.println("ProductController warehouseUpdatePro()");
		System.out.println(warehouseDTO);
		
		String username = authentication.getName();
		warehouseDTO.setName(username);	
		warehouseService.updateWarehouse(warehouseDTO);
		
		return "redirect:/warehouse/warehouse";
	}
	
	@PostMapping("/warehouseDeletePro")
	public String warehouseDeletePro(@RequestBody WarehouseDTO warehouseDTO) {
		System.out.println("ProductionController warehouseDeletePro()");
		System.out.println(warehouseDTO);
		
		warehouseService.deleteWarehouse(warehouseDTO);
		
		return "redirect:/warehouse/warehouse";
	}
	
	
}
