package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.ProductionDTO;
import com.itwillbs.service.ProductionService;

@Controller
@RequestMapping("/popup/*")
public class PopupController {
	@Inject
	private ProductionService productionService;

	@GetMapping("/contractpop")
	public String contractpop(ProductionDTO productionDTO, Model model) {
		
		List<ProductionDTO> getConProList = productionService.getConProList();
		model.addAttribute("getConProList", getConProList);
		
		return "popup/contractpop";
	}
	
	@GetMapping("/linepop")
	public String linepop(ProductionDTO productionDTO, Model model) {
		
		List<ProductionDTO> lineList = productionService.getLineList();
		model.addAttribute("lineList", lineList);
		
		return "popup/linepop";
	}
}
