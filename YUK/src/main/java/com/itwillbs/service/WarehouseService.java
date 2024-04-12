package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.WarehouseDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ProductionDTO;
import com.itwillbs.domain.WarehouseDTO;

@Service
public class WarehouseService {	
	@Inject
	private WarehouseDAO warehouseDAO;

	public void insertWarehouse(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService insertWarehouse()");
		warehouseDAO.insertWarehouse(warehouseDTO);
	}//insertWarehouse()
	
	
	public List<WarehouseDTO> getWarehouseList(PageDTO pageDTO) {
		System.out.println("WarehouseService getWarehouseList()");
		
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
		
		return warehouseDAO.getWarehouseList(pageDTO);
	}//getWarehouseList()
	


	public void updateWarehouse(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService updateWarehouse()");
		warehouseDAO.updateWarehouse(warehouseDTO);
	}//updateWarehouse()
	

	public void deleteWarehouse(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService deleteWarehouse()");
		warehouseDAO.deleteWarehouse(warehouseDTO);		
	}//deleteWarehouse()

	public Integer getWarehouseLastNum() {
		System.out.println("WarehouseService getWarehouseLastNum()");
		return warehouseDAO.getWarehouseLastNum();
	}//getWarehouseLastNum()
	
	public int getWarehouseCount(PageDTO pageDTO) {
		System.out.println("WarehouseService getWarehouseCount()");
		return warehouseDAO.getWarehouseCount(pageDTO);
	}//getWarehouseCount()
	
	public WarehouseDTO getWarehouse(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService getWarehouse()");	
		return warehouseDAO.getWarehouse(warehouseDTO);
	}
	
	public WarehouseDTO getWarehouseList2(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService getWarehouseList2()");
		
		return warehouseDAO.getWarehouseList2(warehouseDTO);
	}//getWarehouseList2()
	
	
  //--------------------------------------------------------------------
	
	

	public void insertStock(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService insertStock()");	
		warehouseDAO.insertStock(warehouseDTO);		
	}//insertStock()

	public List<WarehouseDTO> getStockList(PageDTO pageDTO) {
		System.out.println("WarehouseService getstockList()");	
		
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
				
		return warehouseDAO.getStockList(pageDTO);
	}//getstockList()

	public void updateStock(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService updateStock()");		
		warehouseDAO.updateStock(warehouseDTO);		
	}//updateStock()

	public ResponseEntity<?> stockUpdatePro(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService stockUpdatePro()");
		System.out.println(warehouseDTO);
//		warehouseDTO = warehouseDAO.collectStockList(warehouseDTO);//
//		int curVol = warehouseDAO.getWh_stockFromWh_cd(warehouseDTO);
		int sumVol = warehouseDAO.getSvolFromPro_cd(warehouseDTO);//창고의 현재 총 보유량
		int maxVol = warehouseDAO.getMvolFromPro_cd(warehouseDTO);//창고의 최대 보유량
//		int maxVol = 10000;
		int proVol = warehouseDAO.getPvolFromPro_cd(warehouseDTO);//품목의 적재량
		int realAmount = warehouseDTO.getRealAmount();//품목이 적재량을 대체할 실사량
		System.out.println("sumVol" + sumVol);
		System.out.println("maxVol" + maxVol);
		System.out.println("proVol" + proVol);
		System.out.println("realAmount"+realAmount);
		if(sumVol - proVol + realAmount <= maxVol) {
			
			warehouseDAO.resultVol(warehouseDTO);//
			return new ResponseEntity<>("처리 완료", HttpStatus.OK);
		}else {
			return new ResponseEntity<>("창고 최대 보유량 초과", HttpStatus.BAD_REQUEST);
		}
	
	}//stockUpdatePro()

	public int getStockCount(PageDTO pageDTO) {
		System.out.println("WarehouseService getStockCount()");	
		return warehouseDAO.getStockCount(pageDTO);
	}//getStockCount()

	public List<WarehouseDTO> getWhList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int EndRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow -1);
		pageDTO.setEndRow(EndRow);
		
		return warehouseDAO.getWhList(pageDTO);
	}

	public int getWhCount(PageDTO pageDTO) {
		return warehouseDAO.getWhCount(pageDTO);
	}

	public Integer getProductLastNum() {
		System.out.println("WarehouseService getProductLastNum()");
		return warehouseDAO.getProductLastNum();
	}//getProductLastNum()
}