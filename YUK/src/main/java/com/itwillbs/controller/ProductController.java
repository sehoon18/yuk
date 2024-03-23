package com.itwillbs.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@GetMapping("/productMain")
	public String productMain() {
		System.out.println("ProductController productMain()");
		return "product/productMain";
	}
	@GetMapping("/productPopUp")
	public String productPopUp() {
		System.out.println("ProductController productPopUp()");
		return "product/productPopUp";
	}
}
