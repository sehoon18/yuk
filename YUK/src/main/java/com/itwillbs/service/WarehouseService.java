package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

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
	}

	public List<WarehouseDTO> getWarehouseList() {
		System.out.println("WarehouseService getWarehouseList()");
		
		return warehouseDAO.getWarehouseList();
	}

	public void insertStock(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService insertStock()");
		
		warehouseDAO.insertStock(warehouseDTO);
		
	}

	public List<WarehouseDTO> getstockList() {
		System.out.println("WarehouseService getstockList()");
		
		return warehouseDAO.getStockList();
	}

	public List<WarehouseDTO> getSearchStockList(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService getSearchStockList()");
		
		return warehouseDAO.getSearchStockList(warehouseDTO);
	}

	public List<WarehouseDTO> getStockCodeList() {
		System.out.println("WarehouseService getStockCodeList()");
		
		return warehouseDAO.getStockCodeList();
	}

	public List<WarehouseDTO> getSearchWarehouseList(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService getSearchWarehouseList()");
		
		return warehouseDAO.getSearchWarehouseList(warehouseDTO);
	}

	public void updateWarehouse(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService updateWarehouse()");
		
		warehouseDAO.updateWarehouse(warehouseDTO);
	}

	public void deleteWarehouse(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService deleteWarehouse()");
		
		warehouseDAO.deleteWarehouse(warehouseDTO);
		
	}

	public Integer getWarehouseLastNum() {
		System.out.println("WarehouseService getWarehouseLastNum()");
		return warehouseDAO.getWarehouseLastNum();
	}

	public void updateStock(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseService updateStock()");
		
		warehouseDAO.updateStock(warehouseDTO);
		
	}

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





}
