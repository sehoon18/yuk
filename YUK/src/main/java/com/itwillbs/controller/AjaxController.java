package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.ProductDTO;
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
	

	// 실적 수정
	@PostMapping("/production/updatePer")
	public ResponseEntity<?> updatePer(@RequestBody ProductionDTO productionDTO) {
	    System.out.println("ProductionController updatePer()");
	    System.out.println(productionDTO);

	    productionService.updatePer(productionDTO);
	    
	    // 성공 응답 보내기
	    // 단순 문자열 "success"를 JSON 형식으로 반환하는 예시
	    return ResponseEntity.ok().body("{\"message\":\"success\"}");
	}
	
	// 실적 삭제
	@PostMapping("/production/perDeletePro")
	public ResponseEntity<?> perDeletePro(@RequestBody ProductionDTO productionDTO) {
	    System.out.println("ProductionController perDeletePro()");
	    System.out.println(productionDTO);

	    productionService.deletePer(productionDTO);
	    
	    // 성공 응답 보내기
	    // 단순 문자열 "success"를 JSON 형식으로 반환하는 예시
	    return ResponseEntity.ok().body("{\"message\":\"success\"}");
	}

	// 소요량 가져오기
	@PostMapping("/production/getReq")
	public ResponseEntity<?> getReq(@RequestBody ProductionDTO productionDTO) {
	    System.out.println("ProductionController getReq()");
	    System.out.println(productionDTO);
	    
	    List<ProductDTO> reqList = productionService.getReq(productionDTO);
	    
	    // reqList를 JSON 형태로 응답
	    return ResponseEntity.ok().body(reqList);
	}

	
	
	
}
