package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

	public ResponseEntity<?> inBoundPro1(BoundDTO boundDTO) {	//자재 입고 처리
		System.out.println("BoundService inBoundPro1()");
		String user_id1 = boundDTO.getUser_id();				//user_id 세팅1
		boundDTO = boundDAO.getWh_cdFromMib_cd(boundDTO);		//mib_cd로 창고정보 select
		boundDTO.setUser_id(user_id1);							//user_id 세팅2
		int curVol = boundDAO.getWh_stockFromWh_cd(boundDTO);	//창고 현재 보유량
		int maxVol = boundDTO.getWh_mvol();						//창고 최대 보유량
		int addVol = boundDTO.getOrd_vol();						//자재 입고량(발주량)
		if(curVol + addVol <= maxVol) {
			boundDAO.inBoundPro1(boundDTO);
			boundDTO = boundDAO.getOrd_cdFromMib_cd(boundDTO);	//mib_cd로 ord_cd select
			boundDAO.inBoundPro1_2(boundDTO);					//발주 진행상태 완료
			boundDTO = boundDAO.getPro_cdFromOrd_cd(boundDTO);	//ord_cd로 pro_cd, ord_vol select
			boundDAO.inBoundPro1_1(boundDTO);					//발주수량만큼 자재 적재량 증가
			return new ResponseEntity<>("입고 처리 완료", HttpStatus.OK);
		}else {
			return new ResponseEntity<>("창고 최대 보유량 초과", HttpStatus.BAD_REQUEST);
		}
	}//inBoundPro1()
	
	public ResponseEntity<?> inBoundPro2(BoundDTO boundDTO) {	//제품 입고 처리
		System.out.println("BoundService inBoundPro2()");
		String user_id2 = boundDTO.getUser_id();				//user_id 세팅1
		boundDTO = boundDAO.getWh_cdFromPib_cd(boundDTO);		//pib_cd로 창고정보 select
		boundDTO.setUser_id(user_id2);							//user_id 세팅2
		int curVol2 = boundDAO.getWh_stockFromWh_cd(boundDTO);	//창고 현재 보유량
		int maxVol2 = boundDTO.getWh_mvol();					//창고 최대 보유량
		int addVol2 = boundDTO.getActual_completion_amount();	//제품 입고량(양품 실적수량)
		if(curVol2 + addVol2 <= maxVol2) {
			boundDAO.inBoundPro2(boundDTO);
			boundDTO = boundDAO.getPer_cdFromPib_cd(boundDTO);	//pib_cd로 per_cd select
			boundDTO = boundDAO.getPro_cdFromPer_cd(boundDTO);	//per_cd로 pro_cd, actual_completion_amount select
			boundDAO.inBoundPro2_1(boundDTO);					//실적수량만큼 제품 적재량 증가
			return new ResponseEntity<>("입고 처리 완료", HttpStatus.OK);
		}else {
			return new ResponseEntity<>("창고 최대 보유량 초과", HttpStatus.BAD_REQUEST);
		}
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
	
	public ResponseEntity<?> outBoundPro(BoundDTO boundDTO) {	//제품 출고 처리
		System.out.println("BoundService outBoundPro()");
		String user_id3 = boundDTO.getUser_id();				//user_id 세팅1
		boundDTO = boundDAO.getPro_cdFromOb_cd(boundDTO);		//ob_cd로 ob_cd, con_cd, pro_cd, pro_vol, con_vol select
		boundDTO.setUser_id(user_id3);							//user_id 세팅2
		int proVol = boundDTO.getPro_vol();						//제품 적재량(재고량)
		int conVol = boundDTO.getCon_vol();						//제품 출고량(수주량)
		if(proVol >= conVol) {
			boundDAO.outBoundPro(boundDTO);
			boundDAO.outBoundPro_2(boundDTO);					//수주 진행상태 완료
			boundDAO.outBoundPro_1(boundDTO);					//수주수량만큼 제품 적재량 감소
			return new ResponseEntity<>("출고 처리 완료", HttpStatus.OK);
		}else {
			return new ResponseEntity<>("제품 재고 보유량 부족", HttpStatus.BAD_REQUEST);
		}
	}//outBoundPro()
	
}
