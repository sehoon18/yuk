package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.WarehouseDAO;
import com.itwillbs.domain.ProductDTO;
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





}
