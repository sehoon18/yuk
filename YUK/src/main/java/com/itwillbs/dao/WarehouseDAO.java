package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ProductionDTO;
import com.itwillbs.domain.WarehouseDTO;

@Repository
public class WarehouseDAO {
	@Inject
	SqlSession sqlSession;	
	private static final String namespace = "com.itwillbs.mappers.warehouseMapper";

	public void insertWarehouse(WarehouseDTO warehouseDTO) {
		System.out.println("warehouseDAO insertWarehouse()");
		sqlSession.insert(namespace + ".insertWarehouse", warehouseDTO);		
	}//insertWarehouse()

	
	public List<WarehouseDTO> getWarehouseList(PageDTO pageDTO) {
		System.out.println("warehouseDAO getWarehouseList()");
		return sqlSession.selectList(namespace + ".getWarehouseList", pageDTO);
	}//getWarehouseList1()
	

	public void updateWarehouse(WarehouseDTO warehouseDTO) {
		System.out.println("warehouseDAO updateWarehouse()");
		sqlSession.update(namespace + ".updateWarehouse", warehouseDTO);	
	}//updateWarehouse()

	public void deleteWarehouse(WarehouseDTO warehouseDTO) {
		System.out.println("warehouseDAO deleteWarehouse()");
		sqlSession.delete(namespace + ".deleteWarehouse", warehouseDTO);		
	}//deleteWarehouse()

	public Integer getWarehouseLastNum() {
		System.out.println("warehouseDAO getWarehouseLastNum()");
		return sqlSession.selectOne(namespace + ".getWarehouseLastNum");
	}//getWarehouseLastNum()

	public int getWarehouseCount(PageDTO pageDTO) {
		System.out.println("warehouseDAO getWarehouseCount()");
		return sqlSession.selectOne(namespace + ".getWarehouseCount", pageDTO);
	}//getWarehouseCount()

	
  //-------------------------------------------------------------------------
	
	


	public void insertStock(WarehouseDTO warehouseDTO) {
		System.out.println("warehouseDAO insertStock()");
		sqlSession.insert(namespace + ".insertStock", warehouseDTO);	
	}//insertStock()
	
	public void updateStock(WarehouseDTO warehouseDTO) {
		System.out.println("warehouseDAO updateStock()");
		sqlSession.update(namespace + ".updateStock", warehouseDTO);	
	}//updateStock()	

	public List<WarehouseDTO> getStockList(PageDTO pageDTO) {
		System.out.println("warehouseDAO getStockList()");
		return sqlSession.selectList(namespace + ".getStockList", pageDTO);
	}//getStockList()


	public WarehouseDTO collectStockList(WarehouseDTO warehouseDTO) {
		System.out.println("warehouseDAO collectStockList()");
		return sqlSession.selectOne(namespace + ".collectStockList", warehouseDTO);
	}//collectStockList()

	public int getWh_stockFromWh_cd(WarehouseDTO warehouseDTO) {
		System.out.println("warehouseDAO getWh_stockFromWh_cd()");
		return sqlSession.selectOne(namespace + ".getWh_stockFromWh_cd", warehouseDTO);
	}//getWh_stockFromWh_cd()

	public void resultVol(WarehouseDTO warehouseDTO) {
		System.out.println("warehouseDAO resultVol()");
		System.out.println(warehouseDTO);
		sqlSession.update(namespace + ".resultVol", warehouseDTO);
	}//resultVol()

	public int getStockCount(PageDTO pageDTO) {
		System.out.println("warehouseDAO getStockCount()");
		return sqlSession.selectOne(namespace + ".getStockCount", pageDTO);
	}//getStockCount()


//	public Integer getProductLastNum() {
//		System.out.println("warehouseDAO getProductLastNum()");
//		return sqlSession.selectOne(namespace + ".getProductLastNum");
//	}//getProductLastNum()

//	public List<WarehouseDTO> getWhList(PageDTO pageDTO) {
//		return sqlSession.selectList(namespace + ".getWhList", pageDTO);
//	}

//	public int getWhCount(PageDTO pageDTO) {
//		return sqlSession.selectOne(namespace + ".getWhCount", pageDTO);
//	}


	public int getSvolFromPro_cd(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseDAO getSvolFromPro_cd()");
		return sqlSession.selectOne(namespace+".getSvolFromPro_cd", warehouseDTO);
	}//getSvolFromPro_cd()


	public int getMvolFromPro_cd(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseDAO getMvolFromPro_cd()");
		return sqlSession.selectOne(namespace+".getMvolFromPro_cd", warehouseDTO);
	}//getMvolFromPro_cd()


	public int getPvolFromPro_cd(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseDAO getPvolFromPro_cd()");
		return sqlSession.selectOne(namespace+".getPvolFromPro_cd", warehouseDTO);
	}//getPvolFromPro_cd()


	public WarehouseDTO getWarehouse(WarehouseDTO warehouseDTO) {
		System.out.println("WarehouseDAO getWarehouse()");
		return sqlSession.selectOne(namespace + ".getWarehouse", warehouseDTO);
	}

	public WarehouseDTO getWarehouseList2(WarehouseDTO warehouseDTO) {
		System.out.println("warehouseDAO getWarehouseList2()");
		return sqlSession.selectOne(namespace + ".getWarehouseList2", warehouseDTO);
	}//getWarehouseList2()




	
}
