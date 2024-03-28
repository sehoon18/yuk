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
import com.itwillbs.service.ClientService;

@Controller
@RequestMapping("/client/*")
public class ClientController {
	
	@Inject
	ClientService clientService;

	
	//거래처 관리
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
	public String clientDetailPopup() {
		System.out.println("ClientController clientDetailPopup()");
		return "client/clientDetailPopup";
	}
	
	//거래처 등록
	@GetMapping("/clientAddPopup")
	public String clientAddPopup(ClientDTO clientDTO, HttpSession session) {
		System.out.println("ClientController clientAddPopup()");
		
		clientService.insertClient(clientDTO);
		
		return "client/clientAddPopup";
		
		
	}
	
	//거래처코드 조회
	@GetMapping("/clientCodePopup")
	public String clientCodePopup(Model model, HttpServletRequest request) {
		System.out.println("ClientController clientCodePopup()");
	
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
		
		
		return "client/clientCodePopup";
	}
	
}
