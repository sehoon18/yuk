package com.itwillbs.service;


import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.itwillbs.dao.OrdercontractDAO;
import com.itwillbs.domain.OrdercontractDTO;



	@Service
	public class OrdercontractService {
		
		@Inject
		OrdercontractDAO ordercontractDAO;
		
		public List<OrdercontractDTO> getOrderList(OrdercontractDTO ordercontractDTO) {
			return ordercontractDAO.getOrderList(ordercontractDTO);
		}
		public List<OrdercontractDTO> getContractList(OrdercontractDTO ordercontractDTO) {
			return ordercontractDAO.getContractList(ordercontractDTO);
		}
		public void insertOrder(OrdercontractDTO ordercontractDTO) {
			System.out.println("OrdercontractService insertOrder()");
			ordercontractDAO.insertOrder(ordercontractDTO);
		}
		public void insertContract(OrdercontractDTO ordercontractDTO) {
			System.out.println("OrdercontractService insertContract()");
			ordercontractDAO.insertContract(ordercontractDTO);
		}
}
