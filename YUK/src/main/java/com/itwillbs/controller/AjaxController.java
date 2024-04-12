package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OrdercontractDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ProductionDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.OrdercontractService;
import com.itwillbs.service.ProductService;
import com.itwillbs.service.ProductionService;

@RestController
public class AjaxController {
	@Inject
	ProductionService productionService; 
	@Inject
    OrdercontractService ordercontractService;
	@Inject
	ProductService productService;
	@Inject
	MemberService memberService;
	
	
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
	public ResponseEntity<?> updatePer(@RequestBody ProductionDTO productionDTO, Authentication authentication) {
	    System.out.println("ProductionController updatePer()");
	    
		String username = authentication.getName();
		productionDTO.setName(username);	
		
		ProductionDTO productionDTO2 = productionService.getPib(productionDTO);
		if(productionDTO2.getPibStatus() == 0) {
			productionService.updatePer(productionDTO);
			// 성공 응답 보내기
			// 단순 문자열 "success"를 JSON 형식으로 반환하는 예시
			return ResponseEntity.ok().body("{\"message\":\"success\"}");
		} else {
			return ResponseEntity.badRequest().body("{\"message\":\"Operation not allowed\"}");
		}
		
	}
	
	// 실적 삭제
	@PostMapping("/production/perDeletePro")
	public ResponseEntity<?> perDeletePro(@RequestBody ProductionDTO productionDTO) {
	    System.out.println("ProductionController perDeletePro()");
	    
		ProductionDTO productionDTO2 = productionService.getPib(productionDTO);
		if(productionDTO2.getPibStatus() == 0) {
			productionService.deletePer(productionDTO);
			// 성공 응답 보내기
			// 단순 문자열 "success"를 JSON 형식으로 반환하는 예시
			return ResponseEntity.ok().body("{\"message\":\"success\"}");
		} else {
			return ResponseEntity.badRequest().body("{\"message\":\"Operation not allowed\"}");
		}
			
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

	@PostMapping("/production/lineDeletePro")
	public ResponseEntity<?> lineUpdatelineDeleteProPro(@RequestBody ProductionDTO productionDTO, HttpSession session, RedirectAttributes redirectAttributes) {
		System.out.println("ProductionController lineDeletePro()");
		System.out.println(productionDTO);
		
		ProductionDTO productionDTO2 = productionService.getLine(productionDTO);
		if(productionDTO2.getLineStatus() != 1) {
			productionService.deleteLine(productionDTO);
			return ResponseEntity.ok().body("{\"message\":\"success\"}");
		} else {
	        redirectAttributes.addFlashAttribute("errorMessage", "가동중인 라인은 수정/삭제가 불가능합니다.");
	        return ResponseEntity.badRequest().body("{\"message\":\"Operation not allowed\"}");
		}
	}
	
	//불량률 - 메인
	@GetMapping("/production/performanceAmount")
	public ResponseEntity<List<ProductionDTO>> performanceAmount(ProductionDTO productionDTO) {
		List<ProductionDTO> performanceAmount = productionService.performanceAmount(productionDTO);
		ResponseEntity<List<ProductionDTO>> entity = new ResponseEntity<List<ProductionDTO>>(performanceAmount, HttpStatus.OK);
		return entity;
	}
	
	//완제품 재고량 - 메인
	@GetMapping("/product/productVol")
	public ResponseEntity<List<ProductionDTO>> productVol(ProductDTO productDTO) {
		List<ProductionDTO> productVol = productService.productVol(productDTO);
		ResponseEntity<List<ProductionDTO>> entity = new ResponseEntity<List<ProductionDTO>>(productVol, HttpStatus.OK);
		return entity;
	}
	//식자재 재고량 - 메인
		@GetMapping("/product/productVol2")
		public ResponseEntity<List<ProductionDTO>> productVol2(ProductDTO productDTO) {
			List<ProductionDTO> productVol2 = productService.productVol2(productDTO);
			ResponseEntity<List<ProductionDTO>> entity = new ResponseEntity<List<ProductionDTO>>(productVol2, HttpStatus.OK);
			return entity;
	}
	//포장자재 재고량 - 메인
		@GetMapping("/product/productVol3")
		public ResponseEntity<List<ProductionDTO>> productVol3(ProductDTO productDTO) {
			List<ProductionDTO> productVol3 = productService.productVol3(productDTO);
			ResponseEntity<List<ProductionDTO>> entity = new ResponseEntity<List<ProductionDTO>>(productVol3, HttpStatus.OK);
			return entity;
				}
	
	//수주량 - 메인
	@GetMapping("/contract/contractVolChart")
	public ResponseEntity<List<OrdercontractDTO>> contractVolChart(OrdercontractDTO ordercontractDTO) {
		System.out.println(ordercontractDTO);
		List<OrdercontractDTO> contractVolChart = ordercontractService.getContractVol(ordercontractDTO);
		ResponseEntity<List<OrdercontractDTO>> entity = new ResponseEntity<List<OrdercontractDTO>>(contractVolChart, HttpStatus.OK);
		return entity;
	}
		
	//발주량 - 메인
	@GetMapping("/order/orderVolChart")
	public ResponseEntity<List<OrdercontractDTO>> orderVolChart(OrdercontractDTO ordercontractDTO) {
		System.out.println(ordercontractDTO);
		List<OrdercontractDTO> orderVolChart = ordercontractService.orderVolChart(ordercontractDTO);
		ResponseEntity<List<OrdercontractDTO>> entity = new ResponseEntity<List<OrdercontractDTO>>(orderVolChart, HttpStatus.OK);
		return entity;
	}
		
	@GetMapping("/member/idCheck")
	public ResponseEntity<String> idCheck(MemberDTO memberDTO){
		String id = memberDTO.getId();
		MemberDTO memberDTO2 = memberService.checkMember(id);
		String result = "";
		if(memberDTO2 != null) {
			result = "iddup";
		} else {
			result = "idok";
		}
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("/member/pNumberCheck")
	public ResponseEntity<String> pNumberCheck(MemberDTO memberDTO){
		String phone = memberDTO.getPhone();
		MemberDTO memberDTO2 = memberService.pNumberCheck(phone);
		String result = "";
		if(memberDTO2 != null) {
			result = "pdup";
		} else {
			result = "pok";
		}
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	
}
