package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoundDAO;
import com.itwillbs.domain.BoundDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class BoundService {
	
	@Inject
	BoundDAO boundDAO;

	public List<BoundDTO> getInBoundBoardList(PageDTO pageDTO) {
		System.out.println("BoundService getInBoundBoardList()");
		
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
		
		return boundDAO.getInBoundBoardList(pageDTO);
	}//getInBoundBoardList()
	
	public int getInBoundBoardCount(PageDTO pageDTO) {
		System.out.println("BoundService getInBoundBoardCount()");
		
		return boundDAO.getInBoundBoardCount(pageDTO);
	}//getInBoundBoardCount()

	public void inBoundPro(BoundDTO boundDTO) {
		System.out.println("BoundService inBoundPro()");
		
		boundDAO.inBoundPro(boundDTO);
	}//inBoundPro()
	
	public List<BoundDTO> getOutBoundBoardList(PageDTO pageDTO) {
		System.out.println("BoundService getOutBoundBoardList()");
		
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
		
		return boundDAO.getOutBoundBoardList(pageDTO);
	}//getOutBoundBoardList()
	
	public int getOutBoundBoardCount(PageDTO pageDTO) {
		System.out.println("BoundService getOutBoundBoardCount()");
		
		return boundDAO.getOutBoundBoardCount(pageDTO);
	}//getOutBoundBoardCount()
	
	public void outBoundPro(BoundDTO boundDTO) {
		System.out.println("BoundService outBoundPro()");
		
		boundDAO.outBoundPro(boundDTO);
	}//outBoundPro()
	
}
