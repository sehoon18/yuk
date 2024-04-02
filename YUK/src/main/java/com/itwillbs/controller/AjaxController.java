package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.ProductionDTO;
import com.itwillbs.service.ProductionService;

@RestController
public class AjaxController {
	@Inject
	ProductionService productionService; 

	@GetMapping("/production/lineNameCheck")
	public ResponseEntity<String> lcCheck(ProductionDTO productionDTO){
		System.out.println(productionDTO);
		ProductionDTO productionDTO2 = productionService.getLineCode(productionDTO.getLineCode());
		System.out.println(productionDTO2);
		System.out.println(productionDTO2.getLineCode());
		String result = "";
		if(productionDTO2.getLineCode() != null) {
			result = "lcdup";
		} else {
			result = "lcok";
		}
		
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/production/getPerList")
	public List<ProductionDTO> getPerList(@RequestBody ProductionDTO productionDTO) {
		System.out.println(productionDTO);
		// data 처리 로직
		List<ProductionDTO> perList = productionService.getPerList(productionDTO);
		System.out.println(productionDTO);
		return perList;
	}
	
	
}
