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
	
	public List<BoundDTO> getInBoundBoardList2(PageDTO pageDTO) {
		System.out.println("BoundService getInBoundBoardList2()");
		
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
		
		return boundDAO.getInBoundBoardList2(pageDTO);
	}//getInBoundBoardList2()
	
	public int getInBoundBoardCount(PageDTO pageDTO) {
		System.out.println("BoundService getInBoundBoardCount()");
		
		return boundDAO.getInBoundBoardCount(pageDTO);
	}//getInBoundBoardCount()
	
	public int getInBoundBoardCount2(PageDTO pageDTO) {
		System.out.println("BoundService getInBoundBoardCount2()");
		
		return boundDAO.getInBoundBoardCount2(pageDTO);
	}//getInBoundBoardCount2()

	public void inBoundPro1(BoundDTO boundDTO) {	//자재 입고 처리
		System.out.println("BoundService inBoundPro1()");
		boundDAO.inBoundPro1(boundDTO);
		boundDTO = boundDAO.getOrd_cdFromMib_cd(boundDTO); //mib_cd로 ord_cd select
		boundDAO.inBoundPro1_2(boundDTO);
		boundDTO = boundDAO.getPro_cdFromOrd_cd(boundDTO); //ord_cd로 pro_cd, ord_vol, pro_vol select
		boundDAO.inBoundPro1_1(boundDTO);
		System.out.println(boundDTO);
	}//inBoundPro1()
	
	public void inBoundPro2(BoundDTO boundDTO) {
		System.out.println("BoundService inBoundPro2()");
		
		boundDAO.inBoundPro2(boundDTO);
	}//inBoundPro2()
	
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
	
	public void outBoundPro(BoundDTO boundDTO) { //제품 출고 처리
		System.out.println("BoundService outBoundPro()");
		
		boundDAO.outBoundPro(boundDTO);
		boundDTO = boundDAO.getCon_cdFromOb_cd(boundDTO); //ob_cd로 con_cd select
		boundDAO.outBoundPro_2(boundDTO);
	}//outBoundPro()
	
}
