package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.BoundDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoundService;

@Controller
@RequestMapping("/bound/*")

public class BoundController {
	
	@Inject
	BoundService boundService;
	
	//자재 입고
	@GetMapping("/inBound")
	public String inBound(HttpServletRequest request, PageDTO pageDTO, Model model) {
		System.out.println("BoundController inBound()");
		
		//검색어 가져오기
		String search1 = request.getParameter("search1");
		String search2 = request.getParameter("search2");
		String search3 = request.getParameter("search3");
		String search4 = request.getParameter("search4");
		//검색 옵션
		String select1 = request.getParameter("select1");
		
		// 한화면에 보여줄 글개수 설정
		int pageSize = 10;
		// pageNum 에 파라미터값을 가져오기
		String pageNum = request.getParameter("pageNum");
		String pageNum2 = request.getParameter("pageNum2");
		// pageNum이 없으면 "1"로 설정
		if(pageNum == null) {
			pageNum = "1";
		}
		if(pageNum2 == null) {
			pageNum2 = "1";
		}
		// pageNum => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		int currentPage2 = Integer.parseInt(pageNum2);
		
		// pageDTO 저장 
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setPageNum2(pageNum2);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setCurrentPage2(currentPage2);
		
		//검색어 추가
		pageDTO.setSearch1(search1);
		pageDTO.setSearch2(search2);
		pageDTO.setSearch3(search3);
		pageDTO.setSearch4(search4);
		//검색 옵션
		pageDTO.setSelect1(select1);
		
		//자재 입고
		List<BoundDTO> inBoundBoardList = boundService.getInBoundBoardList(pageDTO);
		//제품 입고
		List<BoundDTO> inBoundBoardList2 = boundService.getInBoundBoardList2(pageDTO);
		
		//페이징 작업
		//전체 글개수 구하기 int 리턴할형 count = getInBoundList()
		int count = boundService.getInBoundBoardCount(pageDTO);
		int count2 = boundService.getInBoundBoardCount2(pageDTO);
		//한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		//한 화면에 보여줄 시작페이지 구하기
		int startPage = (currentPage - 1)/pageBlock*pageBlock+1;
		int startPage2 = (currentPage2 - 1)/pageBlock*pageBlock+1;
		//한 화면에 보여줄 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
		int endPage2 = startPage2 + pageBlock - 1;
		//전체 페이지개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int pageCount2 = count2 / pageSize + (count2 % pageSize == 0 ? 0 : 1);
		//끝페이지, 전체 페이지수 비교 => 끝페이지가 크면 전체 페이지로 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		if(endPage2 > pageCount2) {
			endPage2 = pageCount2;
		}
		
		//pageDTO 저장
		pageDTO.setCount(count); //전체글개수 ${pageDTO.count}
		pageDTO.setCount2(count2); //전체글개수 ${pageDTO.count2}
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setStartPage2(startPage2);
		pageDTO.setEndPage(endPage);
		pageDTO.setEndPage2(endPage2);
		pageDTO.setPageCount(pageCount);
		pageDTO.setPageCount2(pageCount2);
	
		//model 저장
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("inBoundBoardList", inBoundBoardList);
		model.addAttribute("inBoundBoardList2", inBoundBoardList2);
		
		return "bound/inBound";
	
	} //inBound()
	
	//제품 입고
	@GetMapping("/inBound2")
	public String inBound2(HttpServletRequest request, PageDTO pageDTO, Model model) {
		System.out.println("BoundController inBound()");
		
		//검색어 가져오기
		String search5 = request.getParameter("search5");
		String search6 = request.getParameter("search6");
		String search7 = request.getParameter("search7");
		String search8 = request.getParameter("search8");
		//검색 옵션
		String select2 = request.getParameter("select2");
		
		// 한화면에 보여줄 글개수 설정
		int pageSize = 10;
		// pageNum 에 파라미터값을 가져오기
		String pageNum = request.getParameter("pageNum");
		String pageNum2 = request.getParameter("pageNum2");
		// pageNum이 없으면 "1"로 설정
		if(pageNum == null) {
			pageNum = "1";
		}
		if(pageNum2 == null) {
			pageNum2 = "1";
		}
		// pageNum => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		int currentPage2 = Integer.parseInt(pageNum2);
		
		// pageDTO 저장 
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setPageNum2(pageNum2);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setCurrentPage2(currentPage2);
		
		//검색어 추가
		pageDTO.setSearch5(search5);
		pageDTO.setSearch6(search6);
		pageDTO.setSearch7(search7);
		pageDTO.setSearch8(search8);
		//검색 옵션
		pageDTO.setSelect2(select2);
		
		//자재 입고
		List<BoundDTO> inBoundBoardList = boundService.getInBoundBoardList(pageDTO);
		//제품 입고
		List<BoundDTO> inBoundBoardList2 = boundService.getInBoundBoardList2(pageDTO);
		
		//페이징 작업
		//전체 글개수 구하기 int 리턴할형 count = getInBoundList()
		int count = boundService.getInBoundBoardCount(pageDTO);
		int count2 = boundService.getInBoundBoardCount2(pageDTO);
		//한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		//한 화면에 보여줄 시작페이지 구하기
		int startPage = (currentPage - 1)/pageBlock*pageBlock+1;
		int startPage2 = (currentPage2 - 1)/pageBlock*pageBlock+1;
		//한 화면에 보여줄 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
		int endPage2 = startPage2 + pageBlock - 1;
		//전체 페이지개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int pageCount2 = count2 / pageSize + (count2 % pageSize == 0 ? 0 : 1);
		//끝페이지, 전체 페이지수 비교 => 끝페이지가 크면 전체 페이지로 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		if(endPage2 > pageCount2) {
			endPage2 = pageCount2;
		}
		
		//pageDTO 저장
		pageDTO.setCount(count); //전체글개수 ${pageDTO.count}
		pageDTO.setCount2(count2); //전체글개수 ${pageDTO.count2}
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setStartPage2(startPage2);
		pageDTO.setEndPage(endPage);
		pageDTO.setEndPage2(endPage2);
		pageDTO.setPageCount(pageCount);
		pageDTO.setPageCount2(pageCount2);
	
		//model 저장
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("inBoundBoardList", inBoundBoardList);
		model.addAttribute("inBoundBoardList2", inBoundBoardList2);
		
		return "bound/inBound";
	
	} //inBound()
	
	//자재 입고 처리 기능
	@GetMapping("/inBoundPro1")
	@PostMapping("/inBoundPro1")
	public String inBoundPro1(BoundDTO boundDTO) {
		System.out.println("BoundController inBoundPro1()");
		boundService.inBoundPro1(boundDTO);
		
		return "redirect:/bound/inBound";
	}//inBoundPro1()
	
	//제품 입고 처리 기능
	@GetMapping("/inBoundPro2")
	@PostMapping("/inBoundPro2")
	public String inBoundPro2(BoundDTO boundDTO) {
		System.out.println("BoundController inBoundPro2()");
		boundService.inBoundPro2(boundDTO);
		
		return "redirect:/bound/inBound";
	}//inBoundPro2()
	
	//출고
	@GetMapping("/outBound")
	public String outBound(HttpServletRequest request, PageDTO pageDTO, Model model) {
		System.out.println("BoundController outBound()");
		
		//검색어 가져오기
		String search1 = request.getParameter("search1");
		String search2 = request.getParameter("search2");
		String search3 = request.getParameter("search3");
		String search4 = request.getParameter("search4");
		//검색 옵션
		String select1 = request.getParameter("select1");
		
		// 한화면에 보여줄 글개수 설정
		int pageSize = 10;
		// pageNum 에 파라미터값을 가져오기
		String pageNum = request.getParameter("pageNum");
		// pageNum이 없으면 "1"로 설정
		if(pageNum == null) {
			pageNum = "1";
		}
		// pageNum => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		
		// pageDTO 저장 
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		//검색어 추가
		pageDTO.setSearch1(search1);
		pageDTO.setSearch2(search2);
		pageDTO.setSearch3(search3);
		pageDTO.setSearch4(search4);
		//검색 옵션
		pageDTO.setSelect1(select1);
		
		List<BoundDTO> outBoundBoardList = boundService.getOutBoundBoardList(pageDTO);
		
		//페이징 작업
		//전체 글개수 구하기 int 리턴할형 count = getOutBoundBoardList()
		int count = boundService.getOutBoundBoardCount(pageDTO);
		//한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		//한 화면에 보여줄 시작페이지 구하기
		int startPage = (currentPage - 1)/pageBlock*pageBlock+1;
		//한 화면에 보여줄 끝페이지 구하기
		int endPage = startPage + pageBlock - 1;
		//전체 페이지개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		//끝페이지, 전체 페이지수 비교 => 끝페이지가 크면 전체 페이지로 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		//pageDTO 저장
		pageDTO.setCount(count); //전체글개수 ${pageDTO.count}
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
	
		//model 저장
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("outBoundBoardList", outBoundBoardList);
		
		return "bound/outBound";
	
	} //outBound()
	
	//출고 처리 기능
	@GetMapping("/outBoundPro")
	@PostMapping("/outBoundPro")
	public String outBoundPro(BoundDTO boundDTO) {
		System.out.println("BoundController outBoundPro()");
		
		boundService.outBoundPro(boundDTO);
		return "redirect:/bound/outBound";
	}//outBoundPro()

}
