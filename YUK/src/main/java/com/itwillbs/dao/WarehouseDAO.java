package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.WarehouseDTO;

@Repository
public class WarehouseDAO {
	@Inject
	SqlSession sqlSession;	
	private static final String namespace = "com.itwillbs.mappers.warehouseMapper";

	public void insertWarehouse(WarehouseDTO warehouseDTO) {
		sqlSession.insert(namespace + ".insertWarehouse", warehouseDTO);
		
	}

	public List<WarehouseDTO> getWarehouseList() {	
		return sqlSession.selectList(namespace + ".getWarehouseList");
	}

	public void insertStock(WarehouseDTO warehouseDTO) {
		sqlSession.insert(namespace + ".insertStock", warehouseDTO);
		
	}

	public List<WarehouseDTO> getStockList() {
		return sqlSession.selectList(namespace + ".getStockList");
	}

	public List<WarehouseDTO> getStockCodeList() {
		return sqlSession.selectList(namespace + ".getStockCodeList");
	}

	public List<WarehouseDTO> getSearchStockList(WarehouseDTO warehouseDTO) {
		return sqlSession.selectList(namespace + ".getSearchStockList", warehouseDTO);
		
	}

	public List<WarehouseDTO> getSearchWarehouseList(WarehouseDTO warehouseDTO) {
		return sqlSession.selectList(namespace + ".getSearchWarehouseList", warehouseDTO);
	}






	
}
