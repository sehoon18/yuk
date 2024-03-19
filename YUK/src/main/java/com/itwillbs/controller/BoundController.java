package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.service.BoundService;

@Controller
@RequestMapping("/bound/*")

public class BoundController {
	@Inject
	BoundService boundService;
	
	@GetMapping("/inBound")
	public String inBound() {
		System.out.println("BoundController inBound()");
		return "bound/inBound";
	}

}
