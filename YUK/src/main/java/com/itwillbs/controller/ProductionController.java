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
		
		String lineCode = null;
		int lineNum = 0;
		boolean isUnique = false;

		while (!isUnique) {
		    lineNum++;
		    String newLineCode = "L" + lineNum;
		    if (productionService.getLineCode(newLineCode) == null) {
		        lineCode = newLineCode;
		        isUnique = true;
		    }
		}
		
//		String id = (String)session.getAttribute("id");
		
		productionDTO.setLineCode(lineCode);
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
	
	@GetMapping("/performance")
	public String perfomance(Model model) {
		System.out.println("ProductionController performance()");
		
		List<ProductionDTO> performanceList = productionService.getPerformanceList();
		model.addAttribute("performanceList", performanceList);
		
		
		return "production/performance";
	}

	@GetMapping("/instruction")
	public String instruction(Model model, ProductionDTO productionDTO) {
		System.out.println("ProductionController instruction()");
		
		List<ProductionDTO> instructionList = productionService.getInstructionList();
		model.addAttribute("instructionList", instructionList);
		
		return "production/instruction";
	}

	@PostMapping("/insertInstruction")
	public String insertInstruction(ProductionDTO productionDTO) {
		System.out.println("ProductionController insertInstruction()");
		
		productionDTO.setName("hong123");
		productionService.insertInstruction(productionDTO);
		
		return "production/instruction";
	}
	
	@GetMapping("/inspop")
	public String inspop() {
		System.out.println("ProductionController inspop()");
		return "production/inspop";
	}
	
	@GetMapping("/insDetailpop")
	public String insDetailpop(Model model, ProductionDTO productionDTO) {
		System.out.println("ProductionController insDetailpop()");
		 
		productionDTO = productionService.getInstruction(productionDTO);
		model.addAttribute("productionDTO", productionDTO);
		
		return "production/insDetailpop";
	}
	
	
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
}
