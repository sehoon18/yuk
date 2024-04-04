package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ClientDAO;
import com.itwillbs.domain.ClientDTO;

@Service
public class ClientService {
	@Inject
	private ClientDAO clientDAO;
	
	//
	public void insertClient(ClientDTO clientDTO) {
		System.out.println("ClientServie insertClient()");
		
		clientDAO.insertClient(clientDTO);
	}
	
	//
	public List<ClientDTO> getClientList() {
		System.out.println("ClientServie getClientList()");
		
		return clientDAO.getClientList();
	}
	
	//
	public List<ClientDTO> getSearchClientList(ClientDTO clientDTO) {
		System.out.println("ClientServie getSearchClientList()");
		
		return clientDAO.getSearchClientList(clientDTO);
	}
	
	//상세페이지
	public List<ClientDTO> getClientDetail(ClientDTO clientDTO) {
		System.out.println("ClientServie getClientDetail()");
		
		return clientDAO.getClientDetail(clientDTO);
		
	}
	
	//상세페이지 수정 
	public ClientDTO getClientDetailUpdate(ClientDTO clientDTO) {
		System.out.println("ClientServie getClientDetailUpdate()");
		
		return clientDAO.getClientDetailUpdate(clientDTO);
	}

	public void updateClient(ClientDTO clientDTO) {
		System.out.println("ClientServie updateClient()");
		clientDAO.updateClient(clientDTO);
	}
	
	//상세페이지 수정2



	
}
