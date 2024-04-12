package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ClientDAO;
import com.itwillbs.domain.ClientDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class ClientService {
	@Inject
	private ClientDAO clientDAO;
	
	//
	public void insertClient(ClientDTO clientDTO) {
		System.out.println("ClientServie insertClient()");
		String clientCode;
		
		// clientCode 생성
//		Integer clientLastNum = clientDAO.getClinetLastNum();
//		if (clientLastNum == null) {
//			clientCode = "CL001";
//		}else {
//			int nextNum = clientLastNum + 1;
//			if (nextNum < 10) {
//				clientCode = String.format("CL00%00d", nextNum);
//			}else if (nextNum < 100) {
//				clientCode = String.format("CL0%d", nextNum);
//			}else {
//				clientCode = String.format("CL%d", nextNum);
//			}
//		}
//		clientDTO.setClientCode(clientCode);
		clientDAO.insertClient(clientDTO);
	}
	
	//
	public List<ClientDTO> getClientList(PageDTO pageDTO) {
		System.out.println("ClientServie getClientList()");
		
		// 시작하는 행번호 구하기
		int currentPage = pageDTO.getCurrentPage();
		int pageSize = pageDTO.getPageSize();
								
		int startRow = (currentPage - 1) * pageSize + 1;
								
		// 끝나는 행번호 구하기
		int endRow = startRow + pageSize - 1;
								
		// pageDTO에 저장
		// boardMapper => limit 시작행-1,개수
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return clientDAO.getClientList(pageDTO);
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


//	public List<ClientDTO> getClientPList(PageDTO pageDTO) {
//		System.out.println("ClientServie getClinetLastNum()");
//		
//		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
//		int EndRow = startRow + pageDTO.getPageSize() - 1;
//		
//		pageDTO.setStartRow(startRow -1);
//		pageDTO.setEndRow(EndRow);
//		
//		return clientDAO.getClientPList(pageDTO);
//	}

	public int getClientCount(PageDTO pageDTO) {
		System.out.println("ClientServie getClientCount()");
		return clientDAO.getClientCount(pageDTO);
	}
	
	public Integer getClinetLastNum() {
		System.out.println("ClientServie getClinetLastNum()");
		return clientDAO.getClinetLastNum();
	}

	public void deleteClient(ClientDTO clientDTO) {
		System.out.println("ClientServie deleteClient()");
		clientDAO.deleteClient(clientDTO);
		
	}


	
}
