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

import com.itwillbs.domain.PageDTO;
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
	public String line(ProductionDTO productionDTO, Model model, HttpServletRequest request, PageDTO pageDTO) {
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
		
		// 검색 기능
		pageDTO.setSearch1(request.getParameter("search1"));
		pageDTO.setSearch2(request.getParameter("search2"));
		String lineStatus = (String)request.getParameter("search5");
		System.out.println(pageDTO);
		int lineStatus1 = 4;
		if(lineStatus == null) {
			lineStatus1 = 4;
		} else {
			lineStatus1 = Integer.parseInt(request.getParameter("search5"));
		}
		pageDTO.setSearch5(lineStatus1);

		// 페이징
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<ProductionDTO> lineList = productionService.getLineList(pageDTO);
		
		int count =  productionService.getLineCount(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock -1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(pageCount);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("lineList", lineList);
		model.addAttribute("pageDTO", pageDTO);

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
	public String performance(HttpServletRequest request, Model model, ProductionDTO productionDTO, PageDTO pageDTO) {
		System.out.println("ProductionController performance()");
		
		// perCode 생성
		Integer perLastNum = productionService.getPerLastNum();

		String perCode;
		if (perLastNum == null) {
			perCode = "PER001";
		} else {
		    int nextNum = perLastNum + 1;
		    if (nextNum < 10) {
		    	perCode = String.format("PER00%d", nextNum);
		    } else if (nextNum < 100) {
		    	perCode = String.format("PER0%d", nextNum);
		    } else {
		    	perCode = String.format("PER%d", nextNum);
		    }
		}
		
		productionDTO.setPerCode(perCode);
		model.addAttribute("productionDTO", productionDTO);
		
		// 검색 기능
		pageDTO.setSearch1(request.getParameter("search1"));
		pageDTO.setSearch2(request.getParameter("search2"));
		pageDTO.setSearch3(request.getParameter("search3"));
		pageDTO.setSearch4(request.getParameter("search4"));

		// 페이징
		int pageSize = 4;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<ProductionDTO> compInsList = productionService.getCompInstructionList(pageDTO);
		
		int count =  productionService.getComInsCount(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock -1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(pageCount);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("compInsList", compInsList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "production/performance";
	}

	// 작업지시 페이지
	@GetMapping("/instruction")
	public String instruction(HttpServletRequest request, Model model, ProductionDTO productionDTO, PageDTO pageDTO) {
		System.out.println("ProductionController instruction()");

		// 검색 기능
		pageDTO.setSearch1(request.getParameter("search1"));
		pageDTO.setSearch2(request.getParameter("search2"));
		pageDTO.setSearch3(request.getParameter("search3"));
		pageDTO.setSearch4(request.getParameter("search4"));

		String instructionStatus = (String)request.getParameter("search5");
		System.out.println(pageDTO);
		int instructionStatus1 = 4;
		if(instructionStatus == null) {	
			instructionStatus1 = 4;
		} else {
			instructionStatus1 = Integer.parseInt(request.getParameter("search5"));
		}
		pageDTO.setSearch5(instructionStatus1);

		// 페이징
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<ProductionDTO> instructionList = productionService.getInstructionList(pageDTO);
		
		int count =  productionService.getInsCount(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock -1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(pageCount);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("instructionList", instructionList);
		model.addAttribute("pageDTO", pageDTO);

		return "production/instruction";
	}

	// 작업지시 등록
	@PostMapping("/insertInstruction")
	public String insertInstruction(ProductionDTO productionDTO) {
		System.out.println("ProductionController insertInstruction()");
		System.out.println(productionDTO);
		productionDTO.setName("hong123");
		
		//원자재 소요
		productionService.useMaterial(productionDTO);
		
		// 작업지시 입력
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
	@PostMapping("/insertPer")
	public String insertPer(ProductionDTO productionDTO) {
		System.out.println("ProductionController insertPer()");
		
		productionService.insertPer(productionDTO);
		
		return "redirect:/production/performance";
	}

	
}
