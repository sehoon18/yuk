package com.itwillbs.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	// 라인 페이지
	@GetMapping("/line")
	public String line(ProductionDTO productionDTO, Model model, HttpServletRequest request) {
		System.out.println("ProductionController line()");
		System.out.println(productionDTO);

		// lineCode 생성
		Integer lineLastNum = productionService.getLineLastNum();

		String lineCode;
		if (lineLastNum == null) {
		    lineCode = "L001";
		} else {
		    int nextNum = lineLastNum + 1;
		    if (nextNum < 10) {
		    	lineCode = String.format("L00%d", nextNum);
		    } else if (nextNum < 100) {
		    	lineCode = String.format("L0%d", nextNum);
		    } else {
		    	lineCode = String.format("L%d", nextNum);
		    }
		}
		
		productionDTO.setLineCode(lineCode);
		model.addAttribute("productionDTO", productionDTO);
		
		productionDTO.setLineCode(request.getParameter("lineCode"));
		productionDTO.setLineName(request.getParameter("lineName"));
		String lineStatus = (String)request.getParameter("lineStatus");
		int lineStatus1 = 4;
		if(lineStatus == null) {
			lineStatus1 = 4;
		} else {
			lineStatus1 = Integer.parseInt(request.getParameter("lineStatus"));
		}
		productionDTO.setLineStatus(lineStatus1);

		List<ProductionDTO> lineList = productionService.getLineList(productionDTO);
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
	
	@PostMapping("/lineUpdatePro")
	public String lineUpdatePro(ProductionDTO productionDTO, HttpSession session) {
		System.out.println("ProductionController lineUpdatePro()");
		System.out.println(productionDTO);
		
		productionService.updateLine(productionDTO);
		
		return "redirect:/production/line";
	}

	@PostMapping("/lineDeletePro")
	public String lineUpdatelineDeleteProPro(@RequestBody ProductionDTO productionDTO, HttpSession session) {
		System.out.println("ProductionController lineDeletePro()");
		System.out.println(productionDTO);
		
		productionService.deleteLine(productionDTO);
		
		return "redirect:/production/line";
	}
	
	// 생산실적 페이지
	@GetMapping("/performance")
	public String performance(HttpServletRequest request, Model model, ProductionDTO productionDTO) {
		System.out.println("ProductionController performance()");
		
		productionDTO.setInstructionCode(request.getParameter("instructionCode"));
		productionDTO.setProductCode(request.getParameter("productCode"));
		productionDTO.setsDate(request.getParameter("sDate"));
		productionDTO.seteDate(request.getParameter("eDate"));
		
		List<ProductionDTO> compInsList = productionService.getCompInstructionList(productionDTO);
		model.addAttribute("compInsList", compInsList);
		
		
		return "production/performance";
	}

	// 작업지시 페이지
	@GetMapping("/instruction")
	public String instruction(HttpServletRequest request, Model model, ProductionDTO productionDTO) {
		System.out.println("ProductionController instruction()");
		System.out.println(productionDTO);

		productionDTO.setInstructionCode(request.getParameter("instructionCode"));
		productionDTO.setProductCode(request.getParameter("productCode"));
		productionDTO.setsDate(request.getParameter("sDate"));
		productionDTO.seteDate(request.getParameter("eDate"));
		
		String instractionStatus = (String)request.getParameter("instractionStatus");
		System.out.println(instractionStatus);
		int instractionStatus1 = 4;
		if(instractionStatus == null) {
			instractionStatus1 = 4;
		} else {
			instractionStatus1 = Integer.parseInt(request.getParameter("instractionStatus"));
		}
		productionDTO.setInstractionStatus(instractionStatus1);
		List<ProductionDTO> instructionList = productionService.getInstructionList(productionDTO);
		model.addAttribute("instructionList", instructionList);
		System.out.println(productionDTO);

		return "production/instruction";
	}

	// 작업지시 등록
	@PostMapping("/insertInstruction")
	public String insertInstruction(ProductionDTO productionDTO) {
		System.out.println("ProductionController insertInstruction()");
		
		System.out.println(productionDTO);
		productionDTO.setName("hong123");
		productionService.insertInstruction(productionDTO);
		
		return "production/instruction";
	}
	
	// 작업지시 등록 팝업
	@GetMapping("/inspop")
	public String inspop(ProductionDTO productionDTO, Model model) {
		System.out.println("ProductionController inspop()");
		
		// instructionCode 생성
		Integer insLastNum = productionService.getInsLastNum();
		
		String instructionCode;
		if (insLastNum == null) {
		    instructionCode = "INS001";
		} else {
		    int nextNum = insLastNum + 1;
		    if (nextNum < 10) {
		        instructionCode = String.format("INS00%d", nextNum);
		    } else if (nextNum < 100) {
		        instructionCode = String.format("INS0%d", nextNum);
		    } else {
		        instructionCode = String.format("INS%d", nextNum);
		    }
		}
		productionDTO.setInstructionCode(instructionCode);
		model.addAttribute("productionDTO", productionDTO);
		
//		List<ProductionDTO> reqList = productionService.getReqList();
		
		return "production/inspop";
	}
	
	// 작업지시 상세
	@GetMapping("/insDetailpop")
	public String insDetailpop(Model model, ProductionDTO productionDTO) {
		System.out.println("ProductionController insDetailpop()");
		 
		productionDTO = productionService.getInstruction(productionDTO);
		model.addAttribute("productionDTO", productionDTO);
		
		return "production/insDetailpop";
	}
	
	// 작업지시 수정
	@PostMapping("/updateInstruction")
	public String updateInstruction(ProductionDTO productionDTO) {
		System.out.println("ProductionController updateInstruction()");
		System.out.println(productionDTO);
//		productionDTO.setName("hong123");
		
		Timestamp Ttoday = new Timestamp(System.currentTimeMillis());
		String Stoday = new SimpleDateFormat("yyyy-MM-dd").format(Ttoday);
		
		productionDTO.setInstructionDate(Stoday);
		productionService.updateInstruction(productionDTO);
		
		System.out.println(productionDTO);

		return "redirect:/production/insDetailpop?instructionCode=" + productionDTO.getInstructionCode();
	}
	
	@PostMapping("/deleteInstruction")
	public String deleteInstruction(ProductionDTO productionDTO) {
		System.out.println("ProductionController deleteInstruction()");
		System.out.println(productionDTO);
		
		productionService.deleteInstruction(productionDTO);
		System.out.println(productionDTO);
		
		return "redirect:/production/instruction";
	}
	
	// 작업지시 완료 버튼 기능
	@PostMapping("/updateInsStatus")
	public String updateInsStatus(ProductionDTO productionDTO) {
		System.out.println("ProductionController updateInsStatus()");
		
		productionService.updateInsStatus(productionDTO);
		
		return "redirect:/production/instruction";
	}
	
	
	// 실적등록
	@GetMapping("/perpop")
	public String perpop(Model model, ProductionDTO productionDTO) {
		System.out.println("ProductionController perpop()");
		
		// 작업상태 2(완료)인 작업지시 가져오기
		List<ProductionDTO> compInsList = productionService.getCompInstructionList(productionDTO);
		model.addAttribute("compInsList", compInsList);
		
		return "production/perpop";
	}
	
	// 실적등록
	@PostMapping("/insertPer")
	public String insertPer(ProductionDTO productionDTO) {
		System.out.println("ProductionController updateInsStatus()");
		
		productionService.insertPer(productionDTO);
		
		return "redirect:/production/performance";
	}
	
}
