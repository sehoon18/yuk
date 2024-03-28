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
		
		String id = (String)session.getAttribute("id");
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
			
			List<WarehouseDTO> stockList;
			
			if(productCode == null && productName == null && warehouseName == null) {
				stockList = warehouseService.getstockList();
			}else {
				stockList = warehouseService.getSearchStockList(warehouseDTO);
			}
			
			model.addAttribute("stockList", stockList);

			return "warehouse/stockCodePopup";
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
			String productCode = request.getParameter("productCode");
			warehouseDTO.setProductCode(productCode);
			String warehouseLocal = request.getParameter("warehouseLocal");
			warehouseDTO.setWarehouseLocal(warehouseLocal);
			
			List<WarehouseDTO> warehouseList;
			
			if(warehouseCode == null && warehouseName == null && productCode == null && warehouseLocal == null) {
				warehouseList = warehouseService.getWarehouseList();
			}else {
				warehouseList = warehouseService.getSearchWarehouseList(warehouseDTO);
			}
			
			model.addAttribute("warehouseList", warehouseList);
			
			return "warehouse/warehouse";
		}
		
		@PostMapping("/warehousePro")
		public String warehousePro(WarehouseDTO warehouseDTO, HttpSession session) {
			System.out.println("WarehouseController warehousePro()");
			System.out.println(warehouseDTO);
			
			String id = (String)session.getAttribute("id");
			//warehouseDTO.setName("");
			
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
		String productCode = request.getParameter("productCode");
		warehouseDTO.setProductCode(productCode);
		String warehouseLocal = request.getParameter("warehouseLocal");
		warehouseDTO.setWarehouseLocal(warehouseLocal);
		
		List<WarehouseDTO> warehouseList;
		
		if(warehouseCode == null && warehouseName == null && productCode == null && warehouseLocal == null) {
			warehouseList = warehouseService.getWarehouseList();
		}else {
			warehouseList = warehouseService.getSearchWarehouseList(warehouseDTO);
		}
		
		model.addAttribute("warehouseList", warehouseList);
		
		return "warehouse/warehouseCodePopup";
	}
	
	
	

	
	
}
