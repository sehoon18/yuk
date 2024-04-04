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

import com.itwillbs.domain.ClientDTO;
import com.itwillbs.domain.ProductionDTO;
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
	public String client(Model model, HttpServletRequest request) {
		System.out.println("ClientController client()");
		
		ClientDTO clientDTO = new ClientDTO();
		
		// 검색어 가져오기
		String clientCode = request.getParameter("clientCode");
		clientDTO.setClientCode(clientCode);
		String clientName = request.getParameter("clientName");
		clientDTO.setClientName(clientName);
		
		List<ClientDTO> clientList;
	
		if(clientCode == null && clientName == null) {
			clientList = clientService.getClientList();
		}else {
			clientList = clientService.getSearchClientList(clientDTO);
		}
		

		model.addAttribute("clientList", clientList);
		return "client/client";
	}
	
	@PostMapping("/clientPro")
	public String clientPro(ClientDTO clientDTO, HttpSession session) {
		System.out.println("ClientController clientPro()");
		System.out.println(clientDTO);
		
		String id = (String)session.getAttribute("id");
		//clientDTO.setName("");
		
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
	
	//거래처 상세페이지
	@PostMapping("/clientDetailPopupUpdate")
	public String clientDetailPopupUpdate(HttpServletRequest request, Model model) {
		System.out.println("ClientController clientDetailPopupUpdate");
		
		ClientDTO clientDTO = new ClientDTO();
		
		ClientDTO clientDTO2 = clientService.getClientDetailUpdate(clientDTO);
		if(clientDTO2 != null) {
			clientService.updateClient(clientDTO);
			return "redirect:client/client";
		}else {
			return "redirect:/client/clientDetailPopup";
		}	
		
	}
	
	// 작업지시 등록
		@PostMapping("/insertClient")
		public String insertClient(ClientDTO clientDTO) {
			System.out.println("ClientController insertClient()");
			
			System.out.println(clientDTO);
			clientService.insertClient(clientDTO);
			
			return "client/clientAddPopup";
		}
	
	
	//거래처 등록 팝업
	@GetMapping("/clientAddPopup")
	public String clientAddPopup(ClientDTO clientDTO, HttpSession session) {
		System.out.println("ClientController clientAddPopup()");
		System.out.println(clientDTO);
		clientService.insertClient(clientDTO);
		
		return "client/clientAddPopup";
		
		
	}
	
	//거래처코드 조회
	@GetMapping("/clientCodePopup")
	public String clientCodePopup(Model model, HttpServletRequest request) {
		System.out.println("ClientController clientCodePopup()");
		ClientDTO clientDTO = new ClientDTO();
		System.out.println(clientDTO);
		
		// 검색어 가져오기
		String clientCode = request.getParameter("clientCode");
		clientDTO.setClientCode(clientCode);
		String clientName = request.getParameter("clientName");
		clientDTO.setClientName(clientName);
		
		List<ClientDTO> clientList;
		
		if(clientCode == null && clientName == null) {
			clientList = clientService.getClientList();
		}else {
			clientList = clientService.getSearchClientList(clientDTO);
		}
		
		model.addAttribute("clientList", clientList);
		
		
		return "client/clientCodePopup";
	}
	
}
