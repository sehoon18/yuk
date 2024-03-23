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

import com.itwillbs.domain.ProductionDTO;
import com.itwillbs.service.ProductionService;

@Controller
@RequestMapping("/production/*")
public class ProductionController {
	@Inject
	private ProductionService productionService; 

	@GetMapping("/test")
	public String test() {
		System.out.println("ProductionController main()");
		return "production/test";
	}
	
	@GetMapping("/line")
	public String line(ProductionDTO productionDTO, Model model, HttpServletRequest request) {
		System.out.println("ProductionController line()");
		
		List<ProductionDTO> lineList = productionService.getLineList();
		model.addAttribute("lineList", lineList);
		
		return "production/line";
	}
	
	@PostMapping("/linePro")
	public String linePro(ProductionDTO productionDTO, HttpSession session) {
		System.out.println("ProductionController linePro()");
		System.out.println(productionDTO);
		
//		String id = (String)session.getAttribute("id");
		
		productionDTO.setName("hong123");		
		productionService.insertLine(productionDTO);
		
		return "redirect:/production/line";
		}
	
	@GetMapping("/perfomance")
	public String perfomance() {
		System.out.println("ProductionController perfomance()");
		return "production/perfomance";
	}

	@GetMapping("/instruction")
	public String instruction() {
		System.out.println("ProductionController instruction()");
		return "production/instruction";
	}

	@GetMapping("/insertInstruction")
	public String insertInstruction(ProductionDTO productionDTO) {
		System.out.println("ProductionController insertInstruction()");
		
		productionService.insertInstruction(productionDTO);
		
		return "production/instruction";
	}
	
	@GetMapping("/inspop")
	public String inspop() {
		System.out.println("ProductionController inspop()");
		return "production/inspop";
	}
}
