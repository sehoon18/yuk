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

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;


@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Inject
	ProductService productService;
	
	// --------  품목 관리 -----------
	
	@GetMapping("/productMain")
	public String productMain(Model model,HttpServletRequest request,HttpSession session,PageDTO pageDTO) {
		System.out.println("ProductController productMain()");
		
		ProductDTO productDTO = new ProductDTO();
		
		// productCode 생성
				Integer productLastNum = productService.getProductLastNum();

				String productCode;
				if (productLastNum == null) {
				    productCode = "PRO001";
				} else {
				    int nextNum = productLastNum + 1;
				    if (nextNum < 10) {
				    	productCode = String.format("PRO00%d", nextNum);
				    } else if (nextNum < 100) {
				    	productCode = String.format("PRO0%d", nextNum);
				    } else {
				    	productCode = String.format("PRO%d", nextNum);
				    }
				}
				
				productDTO.setProductCode(productCode);
				model.addAttribute("productDTO", productDTO);
		
		
				// 검색 기능
				pageDTO.setSearch1(request.getParameter("search1"));
				pageDTO.setSearch2(request.getParameter("search2"));
				String productType = (String)request.getParameter("search5");
				System.out.println(pageDTO);
				int productType1 = 100;
				if(productType == null) {
					productType1 = 100;
				} else {
					productType1 = Integer.parseInt(request.getParameter("search5"));
				}
				pageDTO.setSearch0(productType1);

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
				
				List<ProductDTO> productList = productService.getProductList(pageDTO);
				
				int count =  productService.getProductCount(pageDTO);
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
		
		
		return "product/productMain";
	}
	//품목 팝업
	@GetMapping("/productPopUp")
	public String productPopUp(Model model,HttpServletRequest request,PageDTO pageDTO) {
		System.out.println("ProductController productPopUp()");
		
		// 검색 기능
		pageDTO.setSearch1(request.getParameter("search1"));
		pageDTO.setSearch2(request.getParameter("search2"));
		String productType = (String)request.getParameter("search5");
		System.out.println(pageDTO);
		int productType1 = 100;
		if(productType == null) {
			productType1 = 100;
		} else {
			productType1 = Integer.parseInt(request.getParameter("search5"));
		}
		pageDTO.setSearch0(productType1);

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
		
		List<ProductDTO> productList = productService.getProductList(pageDTO);
		
		int count =  productService.getProductCount(pageDTO);
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
		return "product/productPopUp";
	}
	
	@PostMapping("/productInsertPro")
	public String productInsertPro(ProductDTO productDTO, Authentication authentication) {
		System.out.println("ProductionController productInsertPro()");
		System.out.println(productDTO);
		
		String username = authentication.getName();
		productDTO.setName(username);
		
		productService.insertProduct(productDTO);
		return "redirect:/product/productMain";
		}
	
	
	@PostMapping("/productUpdatePro")
	public String productUpdatePro(ProductDTO productDTO, Authentication authentication) {
		System.out.println("ProductController productUpdatePro()");
		System.out.println(productDTO);
		
		String username = authentication.getName();
		productDTO.setName(username);
		
		productService.updateProduct(productDTO);
		
		return "redirect:/product/productMain";
	}
	
	@PostMapping("/productDeletePro")
	public String productDeletePro(@RequestBody ProductDTO productDTO) {
		System.out.println("ProductController productDeletePro()");
		System.out.println(productDTO);
		
		productService.deleteProduct(productDTO);
		
		return "redirect:/product/productMain";
	}

	
	
	
	
	
	
	// --------  소요량 관리 -----------
	
	@GetMapping("/requiredMain")
	public String requiredMain(Model model, HttpServletRequest request,PageDTO pageDTO) {
		System.out.println("ProductController requiredMain()");
		
		
		ProductDTO productDTO = new ProductDTO();
		
		String requiredCode;
		// productCode 생성
				Integer requiredLastNum = productService.getRequiredLastNum();

				if (requiredLastNum == null) {
					requiredCode = "REQ001";
				} else {
				    int nextNum = requiredLastNum + 1;
				    if (nextNum < 10) {
				    	requiredCode = String.format("REQ00%d", nextNum);
				    } else if (nextNum < 100) {
				    	requiredCode = String.format("REQ0%d", nextNum);
				    } else {
				    	requiredCode = String.format("REQ%d", nextNum);
				    }
				}
				
				productDTO.setRequiredCode(requiredCode);
				model.addAttribute("productDTO", productDTO);
				
				// 검색 기능
				pageDTO.setSearch1(request.getParameter("search1"));
				pageDTO.setSearch2(request.getParameter("search2"));
				String productType = (String)request.getParameter("search5");
				System.out.println(pageDTO);
				int productType1 = 100;
				if(productType == null) {
					productType1 = 100;
				} else {
					productType1 = Integer.parseInt(request.getParameter("search5"));
				}
				pageDTO.setSearch0(productType1);

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
				
				List<ProductDTO> requiredList = productService.getRequiredList(pageDTO);
				
				int count =  productService.getRequiredCount(pageDTO);
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
				
				model.addAttribute("requiredList", requiredList);
				model.addAttribute("pageDTO", pageDTO);
		return "product/requiredMain";
	}
	//소요량 팝업
	@GetMapping("/requiredPopUp")
	public String requiredPopUp(Model model, HttpServletRequest request,PageDTO pageDTO) {
		System.out.println("ProductController requiredPopUp()");
		
		
		// 검색 기능
		pageDTO.setSearch1(request.getParameter("search1"));
		pageDTO.setSearch2(request.getParameter("search2"));
		String productType = (String)request.getParameter("search5");
		System.out.println(pageDTO);
		int productType1 = 100;
		if(productType == null) {
			productType1 = 100;
		} else {
			productType1 = Integer.parseInt(request.getParameter("search5"));
		}
		pageDTO.setSearch0(productType1);

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
		
		List<ProductDTO> requiredList = productService.getRequiredList(pageDTO);
		
		int count =  productService.getRequiredCount(pageDTO);
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
		
		model.addAttribute("requiredList", requiredList);
		model.addAttribute("pageDTO", pageDTO);
		return "product/requiredPopUp";
	}
	
	@PostMapping("/requiredInsert")
	public String requiredInsert(ProductDTO productDTO) {
		System.out.println("ProductionController requiredInsert()");
		System.out.println(productDTO);
		
		productService.insertRequired(productDTO);
		
		return "redirect:/product/requiredMain";
		}
	
	
	@PostMapping("/requiredUpdate")
	public String requiredUpdate(ProductDTO productDTO) {
		System.out.println("ProductController requiredUpdate()");
		System.out.println(productDTO);
		
		productService.updateRequired(productDTO);
		
		return "redirect:/product/requiredMain";
	}
	
	@PostMapping("/requiredDelete")
	public String requiredDelete(@RequestBody ProductDTO productDTO) {
		System.out.println("ProductController requiredDelete()");
		System.out.println(productDTO);
		
		productService.deleteRequired(productDTO);
		
		return "redirect:/product/requiredMain";
	}
	//소요량 추가 -> 완제품 선택 팝업
	@GetMapping("/requiredInsertPopUp1")
	public String requiredInsertPopUp1(Model model, HttpServletRequest request,PageDTO pageDTO) {
		System.out.println("ProductController requiredInsertPopUp1()");
		
		// 검색 기능
				pageDTO.setSearch1(request.getParameter("search1"));
				pageDTO.setSearch2(request.getParameter("search2"));
				String productType = (String)request.getParameter("search5");
				System.out.println(pageDTO);
				int productType1 = 100;
				if(productType == null) {
					productType1 = 100;
				} else {
					productType1 = Integer.parseInt(request.getParameter("search5"));
				}
				pageDTO.setSearch0(productType1);

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
				
				List<ProductDTO> productList = productService.getProductList(pageDTO);
				
				int count =  productService.getProductCount(pageDTO);
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
		return "product/requiredInsertPopUp1";
	}
	
	//소요량 추가 ->자재 팝업
		@GetMapping("/requiredInsertPopUp2")
		public String requiredInsertPopUp2(Model model, HttpServletRequest request,PageDTO pageDTO) {
			System.out.println("ProductController requiredInsertPopUp2()");
			
			// 검색 기능
			pageDTO.setSearch1(request.getParameter("search1"));
			pageDTO.setSearch2(request.getParameter("search2"));
			String productType = (String)request.getParameter("search5");
			System.out.println(pageDTO);
			int productType1 = 100;
			if(productType == null) {
				productType1 = 100;
			} else {
				productType1 = Integer.parseInt(request.getParameter("search5"));
			}
			pageDTO.setSearch0(productType1);

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
			
			List<ProductDTO> productList = productService.getProductList(pageDTO);
			
			int count =  productService.getProductCount(pageDTO);
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
			return "product/requiredInsertPopUp2";
		}
	
	
}
