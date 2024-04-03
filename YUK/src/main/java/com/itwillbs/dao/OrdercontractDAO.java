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
		public List<OrdercontractDTO> getOrderList(OrdercontractDTO ordercontractDTO) {
			System.out.println("OrdercontractDAO getOrderList()");
			return sqlSession.selectList(namespace + ".getOrderList" ,ordercontractDTO);
		}
		public List<OrdercontractDTO> getContractList(OrdercontractDTO ordercontractDTO) {
			System.out.println("OrdercontractDAO getContractList()");
			return sqlSession.selectList(namespace + ".getContractList", ordercontractDTO);
		}
		public Integer getOrdLastNum() {
			return sqlSession.selectOne(namespace + ".getOrdLastNum");
		}
		public Integer getConLastNum() {
			return sqlSession.selectOne(namespace + ".getConLastNum");
		}
		
}
