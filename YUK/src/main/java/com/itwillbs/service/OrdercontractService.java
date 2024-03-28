package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.OrdercontractDAO;
import com.itwillbs.domain.BoundDTO;
import com.itwillbs.domain.OrdercontractDTO;
import com.itwillbs.domain.PageDTO;


	@Service
	public class OrdercontractService {
		
		@Inject
		OrdercontractDAO ordercontractDAO;
		
		public List<OrdercontractDTO> getOrderList() {
			return ordercontractDAO.getOrderList();
		}
		public List<OrdercontractDTO> getContractList() {
			return ordercontractDAO.getContractList();
		}
}
