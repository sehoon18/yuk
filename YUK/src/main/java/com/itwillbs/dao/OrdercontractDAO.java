package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OrdercontractDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductionDTO;


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
		
}
