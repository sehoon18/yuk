package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OrdercontractDTO;
import com.itwillbs.domain.PageDTO;


	@Repository
	public class OrdercontractDAO {
		@Inject
		SqlSession sqlSession;
		
		private static final String namespace = "com.itwillbs.mappers.orderMapper"; 
		
		public void insertOrder(OrdercontractDTO ordercontractDTO) {
			sqlSession.insert(namespace + ".insertOrder", ordercontractDTO);
		}
		public void insertContract(OrdercontractDTO ordercontractDTO) {
			sqlSession.insert(namespace + ".insertContract", ordercontractDTO);
		}
		public List<OrdercontractDTO> getOrderList(PageDTO pageDTO) {
			System.out.println("OrdercontractDAO getOrderList()");
			return sqlSession.selectList(namespace + ".getOrderList", pageDTO);
		}
		public List<OrdercontractDTO> getContractList(PageDTO pageDTO) {
			System.out.println("OrdercontractDAO getContractList()");
			return sqlSession.selectList(namespace + ".getContractList", pageDTO);
		}
		public Integer getOrdLastNum() {
			return sqlSession.selectOne(namespace + ".getOrdLastNum");
		}
		public Integer getConLastNum() {
			return sqlSession.selectOne(namespace + ".getConLastNum");
		}
		public void updateContract(OrdercontractDTO ordercontractDTO) {
			sqlSession.update(namespace + ".updateContract", ordercontractDTO);
		}
		public void updateOrder(OrdercontractDTO ordercontractDTO) {
			sqlSession.update(namespace + ".updateOrder", ordercontractDTO);
		}
		public void deleteOrder(OrdercontractDTO ordercontractDTO) {
			sqlSession.delete(namespace + ".deleteOrder", ordercontractDTO);
		}
		public void deleteContract(OrdercontractDTO ordercontractDTO) {
			sqlSession.delete(namespace + ".deleteContract", ordercontractDTO);
		}
		public OrdercontractDTO getOrder(OrdercontractDTO ordercontractDTO) {
			
			return sqlSession.selectOne(namespace+".getOrder",ordercontractDTO);
		}
		public OrdercontractDTO getContract(OrdercontractDTO ordercontractDTO) {
			
			return sqlSession.selectOne(namespace+".getContract",ordercontractDTO);
		}
		public int getOrderCount(PageDTO pageDTO) {
			return sqlSession.selectOne(namespace + ".getOrderCount", pageDTO);
		}
		public int getContractCount(PageDTO pageDTO) {
			return sqlSession.selectOne(namespace + ".getContractCount", pageDTO);
		}
		public List<OrdercontractDTO> getClientList1(PageDTO pageDTO) {
			System.out.println("OrdercontractDAO getClientList1()");
			return sqlSession.selectList(namespace + ".getClientList1", pageDTO);
		}
		public List<OrdercontractDTO> getClientList2(PageDTO pageDTO) {
			System.out.println("OrdercontractDAO getClientList2()");
			return sqlSession.selectList(namespace + ".getClientList2", pageDTO);
		}
		public List<OrdercontractDTO> getOrderList2(PageDTO pageDTO) {
			System.out.println("OrdercontractDAO getOrderList2()");
			return sqlSession.selectList(namespace + ".getOrderList2", pageDTO);
		}
		public List<OrdercontractDTO> getContractList2(PageDTO pageDTO) {
			System.out.println("OrdercontractDAO getContractList2()");
			return sqlSession.selectList(namespace + ".getContractList2", pageDTO);
		}
		public void insertMib(OrdercontractDTO ordercontractDTO) {
			sqlSession.insert(namespace + ".insertMib", ordercontractDTO);
		}
		public void deleteMib(OrdercontractDTO ordercontractDTO) {
			sqlSession.delete(namespace + ".deleteMib", ordercontractDTO);
		}
		public void insertOb(OrdercontractDTO ordercontractDTO) {
			sqlSession.insert(namespace + ".insertOb", ordercontractDTO);
		}
		public void deleteOb(OrdercontractDTO ordercontractDTO) {
			sqlSession.delete(namespace + ".deleteOb", ordercontractDTO);
		}
		public Integer getMibLastNum() {
			return sqlSession.selectOne(namespace + ".getMibLastNum");
		}
		public Integer getObLastNum() {
			return sqlSession.selectOne(namespace + ".getObLastNum");
		}
		public int getOrderCount2(PageDTO pageDTO) {
			
			return sqlSession.selectOne(namespace + ".getOrderCount2", pageDTO);
		}
		public int getContractCount2(PageDTO pageDTO) {
			
			return sqlSession.selectOne(namespace + ".getContractCount2", pageDTO);
		}
		public int getClientCount1(PageDTO pageDTO) {
			
			return sqlSession.selectOne(namespace + ".getClientCount1", pageDTO);
		}
		public int getClientCount2(PageDTO pageDTO) {
			
			return sqlSession.selectOne(namespace + ".getClientCount2", pageDTO);
		}
		public OrdercontractDTO getOrderform(OrdercontractDTO ordercontractDTO) {
			return sqlSession.selectOne(namespace+".getOrderform",ordercontractDTO);
		}
		public OrdercontractDTO getContractform(OrdercontractDTO ordercontractDTO) {
			return sqlSession.selectOne(namespace+".getContractform",ordercontractDTO);
		}
		public List<OrdercontractDTO> getContractVol(OrdercontractDTO ordercontractDTO) {
			return sqlSession.selectList(namespace + ".getContractVol", ordercontractDTO);
		}
		public List<OrdercontractDTO> orderVolChart(OrdercontractDTO ordercontractDTO) {
			return sqlSession.selectList(namespace + ".orderVolChart", ordercontractDTO);
		}
		
		
}
