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
			return sqlSession.selectList(namespace + ".getOrderList", ordercontractDTO);
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
		public int getOrderCount(OrdercontractDTO ordercontractDTO) {
			return sqlSession.selectOne(namespace + ".getOrderCount", ordercontractDTO);
		}
		public int getContractCount(OrdercontractDTO ordercontractDTO) {
			return sqlSession.selectOne(namespace + ".getContractCount", ordercontractDTO);
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
		
		
}
