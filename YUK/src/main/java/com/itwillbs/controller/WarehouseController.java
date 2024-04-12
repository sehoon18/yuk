package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.PageDTO;
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
		
		//검색어 가져오기
		String productCode = request.getParameter("productCode");
		String productName = request.getParameter("productName");
		String warehouseName = request.getParameter("warehouseName");
		//검색 옵션
		String productType = request.getParameter("productType");
		
		// 한화면에 보여줄 글개수 설정
		int pageSize = 10;
		// pageNum 에 파라미터값을 가져오기
		String pageNum = request.getParameter("pageNum");
		// pageNum이 없으면 "1"로 설정
		if(pageNum == null) {
		pageNum = "1";
		}
		// pageNum => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
					
		PageDTO pageDTO = new PageDTO();
		
		// pageDTO 저장 
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
					
		//검색어 추가
		pageDTO.setProductCode(productCode);
		pageDTO.setProductName(productName);
		pageDTO.setWarehouseName(warehouseName);
		//검색 옵션
		pageDTO.setProductType(productType);
					
		List<WarehouseDTO> stockList = warehouseService.getStockList(pageDTO);
				
		//페이징 작업
		//전체 글개수 구하기 int 리턴할형 count = getStockList()
		int count = warehouseService.getStockCount(pageDTO);
		//한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		//한 화면에 보여줄 시작페이지 구하기
		int startPage = (currentPage - 1)/pageBlock*pageBlock+1;
		//한 화면에 보여줄 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
		//전체 페이지개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		//끝페이지, 전체 페이지수 비교 => 끝페이지가 크면 전체 페이지로 변경
		if(endPage > pageCount) {
		endPage = pageCount;
		}
					
		//pageDTO 저장
		pageDTO.setCount(count); //전체글개수 ${pageDTO.count}
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		//model 저장
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("stockList",stockList);
		
		// ProductCode 생성
//		Integer productLastNum = warehouseService.getProductLastNum();
					
//		if (productLastNum == null) {
//			productCode = "CL001";
//		}else {
//			int nextNum = productLastNum + 1;
//			if(nextNum < 10) {
//				productCode = String.format("CL00%d", nextNum);
//			}else if (nextNum < 100) {
//				productCode = String.format("CL0%d", nextNum);
//			}else {
//				productCode = String.format("CL%d", nextNum);
//			}
//		}
//		warehouseDTO.setProductCode(productCode);

		return "warehouse/stock";
		}//stock()
	
	@PostMapping("/stockPro")
	public String stockPro(WarehouseDTO warehouseDTO, HttpSession session) {
		System.out.println("WarehouseController stockPro()");
		System.out.println(warehouseDTO);
		
		warehouseService.insertStock(warehouseDTO);
		
		return "redirect:/warehouse/stock";
	}
	
		//재고코드 조회
		@GetMapping("/stockCodePopup")
		public String stockCodePopup(HttpServletRequest request, PageDTO pageDTO, Model model) {
			System.out.println("WarehouseController stockCodePopup()");
			
			//검색어 가져오기
			String productCode = request.getParameter("productCode");
			String productName = request.getParameter("productName");
			String warehouseName = request.getParameter("warehouseName");
			//검색 옵션
			String productType = request.getParameter("productType");
		
			
			// 한화면에 보여줄 글개수 설정
			int pageSize = 10;
//			// pageNum 에 파라미터값을 가져오기
			String pageNum = request.getParameter("pageNum");
////			// pageNum이 없으면 "1"로 설정
			if(pageNum == null) {
			pageNum = "1";
			}
//			// pageNum => 정수형 변경
			int currentPage = Integer.parseInt(pageNum);
////						
////			// pageDTO 저장 
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
////						
////			//검색어 추가
			pageDTO.setProductCode(productCode);
			pageDTO.setProductName(productName);
			pageDTO.setWarehouseName(warehouseName);
//			//검색 옵션
			pageDTO.setProductType(productType);
////						
			List<WarehouseDTO> stockList = warehouseService.getStockList(pageDTO);
////					
////			//페이징 작업
////			//전체 글개수 구하기 int 리턴할형 count = getStockList()
			int count = warehouseService.getStockCount(pageDTO);
//			//한 화면에 보여줄 페이지 개수 설정
			int pageBlock = 10;
////			//한 화면에 보여줄 시작페이지 구하기
			int startPage = (currentPage - 1)/pageBlock*pageBlock+1;
////			//한 화면에 보여줄 끝페이지 구하기
			int endPage = startPage + pageBlock - 1;
////			//전체 페이지개수 구하기
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
////			//끝페이지, 전체 페이지수 비교 => 끝페이지가 크면 전체 페이지로 변경
			if(endPage > pageCount) {
			endPage = pageCount;
			}
////						
////			//pageDTO 저장
			pageDTO.setCount(count); //전체글개수 ${pageDTO.count}
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
////			//model 저장
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("stockList",stockList);
			
			// ProductCode 생성
//			Integer productLastNum = warehouseService.getProductLastNum();
//			
//			if (productLastNum == null) {
//				productCode = "CL001";
//			}else {
//				int nextNum = productLastNum + 1;
//				if(nextNum < 10) {
//					productCode = String.format("CL00%d", nextNum);
//				}else if (nextNum < 100) {
//					productCode = String.format("CL0%d", nextNum);
//				}else {
//					productCode = String.format("CL%d", nextNum);
//				}
//			}
//			warehouseDTO.setProductCode(productCode);

			return "warehouse/stockCodePopup";
		}//stockPro()
		
		@PostMapping("/stockUpdatePro")
		@ResponseBody
		public ResponseEntity<?> stockUpdatePro(WarehouseDTO warehouseDTO, Authentication authentication) {
			System.out.println("ProductController stockUpdatePro()");
			System.out.println(warehouseDTO);
			
			String username = authentication.getName();
			warehouseDTO.setName(username);	
//			warehouseService.updateStock(warehouseDTO);
			
//			return "OK";
			return warehouseService.stockUpdatePro(warehouseDTO);
		}//stockUpdatePro()
	
	//------------------------------------------------------------------------------------------------	
	
		//창고 관리
		@GetMapping("/warehouse")
		public String warehouse(HttpServletRequest request, PageDTO pageDTO, Model model,WarehouseDTO warehouseDTO) {
			System.out.println("WarehouseController warehouse()");
			
			//검색어 가져오기
			String warehouseCode = request.getParameter("warehouseCode");
			String warehouseName = request.getParameter("warehouseName");
			String warehouseLocal = request.getParameter("warehouseLocal");
			
			// 한화면에 보여줄 글개수 설정
			int pageSize = 10;
//			// pageNum 에 파라미터값을 가져오기
			String pageNum = request.getParameter("pageNum");
			// pageNum이 없으면 "1"로 설정
			if(pageNum == null) {
			pageNum = "1";
			}
//			// pageNum => 정수형 변경
			int currentPage = Integer.parseInt(pageNum);
//				
//			// pageDTO 저장 
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
//					
//			//검색어 추가
			pageDTO.setWarehouseCode(warehouseCode);
			pageDTO.setWarehouseName(warehouseName);
			pageDTO.setWarehouseLocal(warehouseLocal);
//						
			List<WarehouseDTO> warehouseList = warehouseService.getWarehouseList(pageDTO);
//						
//			//페이징 작업
//			//전체 글개수 구하기 int 리턴할형 count = getWarehouseList()
			int count = warehouseService.getWarehouseCount(pageDTO);
//			//한 화면에 보여줄 페이지 개수 설정
			int pageBlock = 10;
//			//한 화면에 보여줄 시작페이지 구하기
			int startPage = (currentPage - 1)/pageBlock*pageBlock+1;
//			//한 화면에 보여줄 끝페이지 구하기
			int endPage = startPage + pageBlock - 1;
//			//전체 페이지개수 구하기
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
//			//끝페이지, 전체 페이지수 비교 => 끝페이지가 크면 전체 페이지로 변경
			if(endPage > pageCount) {
			endPage = pageCount;
			}
//						
//			//pageDTO 저장
			pageDTO.setCount(count); //전체글개수 ${pageDTO.count}
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
//			
//			//model 저장
			model.addAttribute("pageDTO", pageDTO);
			model.addAttribute("warehouseList",warehouseList);
			
			
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
			
			
			
			
			return "warehouse/warehouse";
		}//warehouse()
		
		@PostMapping("/warehousePro")
		public String warehousePro(WarehouseDTO warehouseDTO, HttpSession session, Authentication authentication) {
			System.out.println("WarehouseController warehousePro()");
			System.out.println(warehouseDTO);
			
			String username = authentication.getName();
			warehouseDTO.setName(username);			
			warehouseService.insertWarehouse(warehouseDTO);
			
			return "redirect:/warehouse/warehouse";
		}//warehousePro()
		
	//창고코드 조회
	@GetMapping("/warehouseCodePopup")
	public String warehouseCodePopup(HttpServletRequest request, Model model, PageDTO pageDTO, WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseController warehouseCodePopup()");
		
		//검색어 가져오기
		String warehouseCode = request.getParameter("warehouseCode");
		String warehouseName = request.getParameter("warehouseName");
		String warehouseLocal = request.getParameter("warehouseLocal");
		
		// 한화면에 보여줄 글개수 설정
		int pageSize = 10;
//		// pageNum 에 파라미터값을 가져오기
		String pageNum = request.getParameter("pageNum");
//		// pageNum이 없으면 "1"로 설정
		if(pageNum == null) {
		pageNum = "1";
		}
//		// pageNum => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
//			
//		// pageDTO 저장 
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
//				
//		//검색어 추가
		pageDTO.setWarehouseCode(warehouseCode);
		pageDTO.setWarehouseName(warehouseName);
		pageDTO.setWarehouseLocal(warehouseLocal);
//					
		List<WarehouseDTO> warehouseList = warehouseService.getWarehouseList(pageDTO);
//					
//		//페이징 작업
//		//전체 글개수 구하기 int 리턴할형 count = getWarehouseList()
		int count = warehouseService.getWarehouseCount(pageDTO);
//		//한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
//		//한 화면에 보여줄 시작페이지 구하기
		int startPage = (currentPage - 1)/pageBlock*pageBlock+1;
//		//한 화면에 보여줄 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
//		//전체 페이지개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
//		//끝페이지, 전체 페이지수 비교 => 끝페이지가 크면 전체 페이지로 변경
		if(endPage > pageCount) {
		endPage = pageCount;
		}
//					
//		//pageDTO 저장
		pageDTO.setCount(count); //전체글개수 ${pageDTO.count}
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
//		
//		//model 저장
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("warehouseList",warehouseList);
		
		
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
		
		
		return "warehouse/warehouseCodePopup";
	}//warehouseCodePopup()
	
	
	@PostMapping("/warehouseInsertPro")
	public String warehouseInsertPro(WarehouseDTO warehouseDTO, Authentication authentication) {
		System.out.println("warehouseController warehouseInsertPro");
		System.out.println(warehouseDTO);
		
		String username = authentication.getName();
		warehouseDTO.setName(username);		
		warehouseService.insertWarehouse(warehouseDTO);
		
		return "redirect:/warehouse/warehouse";
	}//warehouseInsertPro()
	
	
	
	@PostMapping("/warehouseUpdatePro")
	public String warehouseUpdatePro(WarehouseDTO warehouseDTO, Authentication authentication, RedirectAttributes redirectAttributes) {
		System.out.println("ProductController warehouseUpdatePro()");
		System.out.println(warehouseDTO);
		
//		String username = authentication.getName();
//		warehouseDTO.setName(username);	
//		
//		WarehouseDTO warehouseDTO2 = warehouseService.getWarehouse(warehouseDTO);
//		System.out.println(warehouseDTO);
//		if(warehouseDTO2.getProductSvol() == 0) {
			warehouseService.updateWarehouse(warehouseDTO);
//			return "redirect:/warehouse/warehouse";
//		}else {
//			redirectAttributes.addFlashAttribute("errorMessage", "현재 보유량이 0인 창고는 삭제가 불가능합니다.");
			return "redirect:/warehouse/warehouse";
		
	}//warehouseUpdatePro()
	
	
	@PostMapping("/warehouseDeletePro")
	public ResponseEntity<?> warehouseDeletePro(@RequestBody WarehouseDTO warehouseDTO, Authentication authentication, RedirectAttributes redirectAttributes) {
		System.out.println("ProductionController warehouseDeletePro()");
		System.out.println(warehouseDTO);
		
		String username = authentication.getName();
		warehouseDTO.setName(username);	
		
		WarehouseDTO warehouseDTO2 = warehouseService.getWarehouseList2(warehouseDTO);
		System.out.println(warehouseDTO2);
		if(warehouseDTO2.getProductSvol() == 0) {
			warehouseService.deleteWarehouse(warehouseDTO2);
			return ResponseEntity.ok().body("{\"message\":\"success\"}");
		}else {
			redirectAttributes.addFlashAttribute("errorMessage", "현재 보유량이 존재하는 창고는 삭제가 불가능합니다.");
			return ResponseEntity.badRequest().body("{\"message\":\"Operation not allowed\"}");

	}//warehouseDeletePro()
		
	
	
	}}
