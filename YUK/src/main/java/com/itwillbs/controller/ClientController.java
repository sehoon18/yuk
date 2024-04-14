package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.ClientDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WarehouseDTO;
import com.itwillbs.service.ClientService;

@Controller
@RequestMapping("/client/*")
public class ClientController {
	
	@Inject
	ClientService clientService;

	// 로그인 화면
	// http://localhost:8080/member/memberLogin
	
	//거래처 관리
	// http://localhost:8080/client/client
	@GetMapping("/client")
	public String client(Model model, HttpServletRequest request, PageDTO pageDTO) {
		System.out.println("ClientController client()");
		
		//검색어 가져오기
		String clientCode = request.getParameter("productCode");
		String clientName = request.getParameter("productName");
		
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
		pageDTO.setProductCode(clientCode);
		pageDTO.setProductName(clientName);
							
		List<ClientDTO> clientList = clientService.getClientList(pageDTO);
						
		//페이징 작업
		//전체 글개수 구하기 int 리턴할형 count = getStockList()
		int count = clientService.getClientCount(pageDTO);
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
		model.addAttribute("clientList", clientList);
		
		ClientDTO clientDTO = new ClientDTO();
				
		// clientCode 생성
		Integer clientLastNum = clientService.getClinetLastNum();
				
		if (clientLastNum == null) {
			clientCode = "CL001";
		}else {
			int nextNum = clientLastNum + 1;
			if(nextNum < 10) {
				clientCode = String.format("CL00%d", nextNum);
			}else if (nextNum < 100) {
				clientCode = String.format("CL0%d", nextNum);
			}else {
				clientCode = String.format("CL%d", nextNum);
			}
		}		
		clientDTO.setClientCode(clientCode);		
							
				
		return "client/client";
	}
	
	@PostMapping("/clientPro")
	public String clientPro(ClientDTO clientDTO,HttpServletRequest request, HttpSession session, Authentication authentication) {
		System.out.println("ClientController clientPro()");
		System.out.println(clientDTO);
		
		String clientCode = request.getParameter("clientCode");
		clientDTO.setClientCode(clientCode);
				
		clientService.insertClient(clientDTO);
		
		return "redirect:/client/client";
	}
	
	
	
	//거래처 상세페이지
	@GetMapping("/clientDetailPopup")
	public String clientDetailPopup(HttpServletRequest request, Model model) {
		System.out.println("ClientController clientDetailPopup()");
		ClientDTO clientDTO = new ClientDTO();
		
		String clientCode = request.getParameter("clientCode");
		clientDTO.setClientCode(clientCode);

		
		List<ClientDTO> clientDList;
		clientDList = clientService.getClientDetail(clientDTO);
		System.out.println("찾아따!!!"+clientDList);
		
		model.addAttribute("clientDList", clientDList);
		
		return "client/clientDetailPopup";
	}
	
	//거래처 상세페이지 수정
	@PostMapping("/clientDetailUpdate")
	public String clientDetailUpdate(HttpServletRequest request, Model model, Authentication authentication) {
		System.out.println("ClientController clientDetailUpdate");
		ClientDTO clientDTO = new ClientDTO();
		System.out.println(clientDTO);
		
		//클라이언트 정보 업데이트를 위해 필요한 데이터 수집
		String clientCode = request.getParameter("clientCode");
		String clientType = request.getParameter("clientType");
		String clientName = request.getParameter("clientName");
		String businessNumber = request.getParameter("businessNumber");
		String clientCEO = request.getParameter("clientCEO");
		int clientTelNumber = (Integer.parseInt(request.getParameter("clientTelNumber")));
		int clientFaxNumber = (Integer.parseInt(request.getParameter("clientFaxNumber")));
		String clientBusinessType = request.getParameter("clientBusinessType");
		String clientCategory = request.getParameter("clientCategory");
		String clientBasicAddress = request.getParameter("clientBasicAddress");
		String clientEmail = request.getParameter("clientEmail");
		String clientNote = request.getParameter("clientNote");
		
		//ClientDTO 객체에 데이터 설정
		clientDTO.setClientCode(clientCode);
		clientDTO.setClientType(clientType);
		clientDTO.setClientName(clientName);
		clientDTO.setBusinessNumber(businessNumber);
		clientDTO.setClientCEO(clientCEO);
		clientDTO.setClientTelNumber(clientTelNumber);
		clientDTO.setClientFaxNumber(clientFaxNumber);
		clientDTO.setClientBusinessType(clientBusinessType);
		clientDTO.setClientCategory(clientCategory);
		clientDTO.setClientBasicAddress(clientBasicAddress);
		clientDTO.setClientEmail(clientEmail);
		clientDTO.setClientNote(clientNote);
		
		System.out.println(clientDTO);
		
		String username = authentication.getName();
		clientDTO.setName(username);	
		// 클라이언트 정보 업데이트
		clientService.updateClient(clientDTO);
		// 수정된 클라이언트의 페이지로 리다이렉트
		return "redirect:/client/client?clientCode="+clientCode;
//		return "OK";
		
	}
	
	//거래처 등록 Pro
		@PostMapping("/insertClientPro")
		public String insertClientPro(HttpServletRequest request, ClientDTO clientDTO, Authentication authentication) {
			System.out.println("ClientController insertClientPro()");
			System.out.println(clientDTO);
			
			//클라이언트 정보 업데이트를 위해 필요한 데이터 수집
					String clientCode = request.getParameter("clientCode");
					String clientType = request.getParameter("clientType");
					String clientName = request.getParameter("clientName");
					String businessNumber = request.getParameter("businessNumber");
					String clientCEO = request.getParameter("clientCEO");
					int clientTelNumber = (Integer.parseInt(request.getParameter("clientTelNumber")));
					int clientFaxNumber = (Integer.parseInt(request.getParameter("clientFaxNumber")));
					String clientBusinessType = request.getParameter("clientBusinessType");
					String clientCategory = request.getParameter("clientCategory");
					String clientBasicAddress = request.getParameter("clientBasicAddress");
					String clientEmail = request.getParameter("clientEmail");
					String clientNote = request.getParameter("clientNote");
					
					//ClientDTO 객체에 데이터 설정
					clientDTO.setClientCode(clientCode);
					clientDTO.setClientType(clientType);
					clientDTO.setClientName(clientName);
					clientDTO.setBusinessNumber(businessNumber);
					clientDTO.setClientCEO(clientCEO);
					clientDTO.setClientTelNumber(clientTelNumber);
					clientDTO.setClientFaxNumber(clientFaxNumber);
					clientDTO.setClientBusinessType(clientBusinessType);
					clientDTO.setClientCategory(clientCategory);
					clientDTO.setClientBasicAddress(clientBasicAddress);
					clientDTO.setClientEmail(clientEmail);
					clientDTO.setClientNote(clientNote);
			
			String username = authentication.getName();
			clientDTO.setName(username);	
			// 거래처 입력
			clientService.insertClient(clientDTO);
			
			return "redirect:/client/clientAddPopup";
		}
		
		//거래처 등록 팝업
		@GetMapping("/clientAddPopup")
		public String clientAddPopup(ClientDTO clientDTO, Model model, Authentication authentication) {
			System.out.println("ClientController clientAddPopup()");
			System.out.println(clientDTO);
			
			// clientCode 생성
			Integer clientLastNum = clientService.getClinetLastNum();
			
			String clientCode;
			if (clientLastNum == null) {
				clientCode = "CL001";
			}else {
				int nextNum = clientLastNum + 1;
				if(nextNum < 10) {
					clientCode = String.format("CL00%d", nextNum);
				}else if (nextNum < 100) {
					clientCode = String.format("CL0%d", nextNum);
				}else {
					clientCode = String.format("CL%d", nextNum);
				}
			}
			clientDTO.setClientCode(clientCode);
			model.addAttribute("clientDTO", clientDTO);
			
			return "client/clientAddPopup";	
			
		}

	
	//거래처코드 조회
	@GetMapping("/clientCodePopup")
	public String clientCodePopup(ClientDTO clientDTO, PageDTO pageDTO, Model model, HttpServletRequest request) {
		System.out.println("ClientController clientCodePopup()");
		System.out.println(clientDTO);
		
		//검색어 가져오기
		String clientCode = request.getParameter("productCode");
		String clientName = request.getParameter("productName");
				
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
		pageDTO.setProductCode(clientCode);
		pageDTO.setProductName(clientName);
									
		List<ClientDTO> clientList = clientService.getClientList(pageDTO);
								
		//페이징 작업
		//전체 글개수 구하기 int 리턴할형 count = getStockList()
		int count = clientService.getClientCount(pageDTO);
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
		model.addAttribute("clientList", clientList);
						
		// clientCode 생성
		Integer clientLastNum = clientService.getClinetLastNum();
						
		if (clientLastNum == null) {
			clientCode = "CL001";
		}else {
			int nextNum = clientLastNum + 1;
			if(nextNum < 10) {
				clientCode = String.format("CL00%d", nextNum);
			}else if (nextNum < 100) {
				clientCode = String.format("CL0%d", nextNum);
			}else {
				clientCode = String.format("CL%d", nextNum);
			}
		}		
		clientDTO.setClientCode(clientCode);		
	
		return "client/clientCodePopup";
	}
	
	@PostMapping("/clientDeletePro")
	@ResponseBody
	public String clientDeletePro(ClientDTO clientDTO, Authentication authentication) {
		System.out.println("ClientController clientDeletePro()");
		System.out.println(clientDTO);
	
		String username = authentication.getName();
		clientDTO.setName(username);	
		
		clientService.deleteClient(clientDTO);
		
		return "redirect:/client/client";
	
}
}