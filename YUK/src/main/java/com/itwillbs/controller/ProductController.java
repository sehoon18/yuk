package com.itwillbs.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;


@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Inject
	ProductService productService;
	
	// --------  품목 관리 -----------
	
	@GetMapping("/productMain")
	public String productMain(Model model,HttpServletRequest request) {
		System.out.println("ProductController productMain()");
		
		ProductDTO productDTO = new ProductDTO();
		String productCode = request.getParameter("productCode");
		productDTO.setProductCode(productCode);
		String productName = request.getParameter("productName");
		productDTO.setProductName(productName);
		String productTypeParam = request.getParameter("productType");
		
		int productType = 100;
		if(productTypeParam != null && !productTypeParam.isEmpty()) {
			try {
				productType = Integer.parseInt(productTypeParam);
			}catch(NumberFormatException e) {
				e.printStackTrace();
			}
		}
		productDTO.setProductType(productType);
		System.out.println(productType);
		List<ProductDTO> productList;
		if(productCode == null && productName == null && productType == 100){
			productList = productService.getProductList(productDTO);
		}else {
			productList = productService.getSearchProductList(productDTO);
		}
		model.addAttribute("productList", productList);
		return "product/productMain";
	}
	@GetMapping("/productPopUp")
	public String productPopUp(Model model,HttpServletRequest request) {
		System.out.println("ProductController productPopUp()");
		
		ProductDTO productDTO = new ProductDTO();
		String productCode = request.getParameter("productCode");
		productDTO.setProductCode(productCode);
		String productName = request.getParameter("productName");
		productDTO.setProductName(productName);
		
		List<ProductDTO> productList;
		if(productCode == null && productName == null){
			productList = productService.getProductList(productDTO);
		}else {
			productList = productService.getSearchProductList(productDTO);
		}
		model.addAttribute("productList", productList);
		return "product/productPopUp";
	}
	
	
	
	
	
	
	
	// --------  소요량 관리 -----------
	
	@GetMapping("/requiredMain")
	public String requiredMain(Model model, HttpServletRequest request) {
		System.out.println("ProductController requiredMain()");
		
		ProductDTO productDTO = new ProductDTO();
		
		String requiredCode = request.getParameter("requiredCode");
		productDTO.setRequiredCode(requiredCode);
		String productName = request.getParameter("productName");
		productDTO.setProductName(productName);
		String requiredTypeParam = request.getParameter("productType");
		int productType = 100;
		if(requiredTypeParam != null && !requiredTypeParam.isEmpty()) {
			try {
				productType = Integer.parseInt(requiredTypeParam);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		productDTO.setProductType(productType);
		System.out.println(productType);
		System.out.println(productName);
		
		List<ProductDTO> requiredList;
		if(requiredCode == null && productName == null && requiredTypeParam == null ) {
			requiredList = productService.getRequiredList(productDTO);
		}else {
			requiredList = productService.getSearchRequiredList(productDTO);
		}
		model.addAttribute("requiredList",requiredList);
		return "product/requiredMain";
	}
	@GetMapping("/requiredPopUp")
	public String requiredPopUp(Model model, HttpServletRequest request) {
		System.out.println("ProductController requiredPopUp()");
		
		ProductDTO productDTO = new ProductDTO();
		
		String requiredCode = request.getParameter("requiredCode");
		productDTO.setRequiredCode(requiredCode);
		String productName = request.getParameter("productName");
		productDTO.setProductCode(productName);
		
		List<ProductDTO> requiredList;
		if(requiredCode == null && productName == null) {
			requiredList = productService.getRequiredList(productDTO);
		}else {
			requiredList = productService.getSearchRequiredList(productDTO);
		}
		model.addAttribute("requiredList",requiredList);
		return "product/requiredPopUp";
	}
	
	
	
	
	
	
	
	
	
}
