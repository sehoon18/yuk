package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/warehouse/*")
public class WarehouseController {
	
	@Inject
	MemberService memberService;

	//창고 관리
	@GetMapping("/warehouse")
	public String warehouse() {
		System.out.println("WarehouseController warehouse()");
		return "warehouse/warehouse";
	}
	
	//재고 관리
	@GetMapping("/stock")
	public String stock() {
		System.out.println("WarehouseController stock()");
		return "warehouse/stock";
	}

	//창고코드 조회
	@GetMapping("/warehouseCodePopup")
	public String warehouseCodePopup() {
		System.out.println("WarehouseController warehouseCodePopup()");
		return "warehouse/warehouseCodePopup";
	}
	
	//재고코드 조회
	@GetMapping("/stockCodePopup")
	public String stockCodePopup() {
		System.out.println("WarehouseController stockCodePopup()");
		return "warehouse/stockCodePopup";
	}
	

	
	
}
