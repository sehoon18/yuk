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
		
		public void insertOrder(OrdercontractDTO orderDTO) {
			sqlSession.insert(namespace + ".insertOrder", orderDTO);
		}
		public List<OrdercontractDTO> getOrderList() {
			System.out.println("OrdercontractDAO getOrderList()");
			return sqlSession.selectList(namespace + ".getOrderList");
		}
		public List<OrdercontractDTO> getContractList() {
			System.out.println("OrdercontractDAO getContractList()");
			return sqlSession.selectList(namespace + ".getContractList");
		}
		
		
}
