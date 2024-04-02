package com.itwillbs.service;


import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.itwillbs.dao.OrdercontractDAO;
import com.itwillbs.domain.OrdercontractDTO;
import com.itwillbs.domain.ProductionDTO;



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
			
			Integer ordLastNum = ordercontractDAO.getOrdLastNum();
			String ord_cd;
			if (ordLastNum == null) {
			    ord_cd = "ORD001";
			} else {
			    int nextNum = ordLastNum + 1;
			    if (nextNum < 10) {
			    	ord_cd = String.format("ORD00%d", nextNum);
			    } else if (nextNum < 100) {
			    	ord_cd = String.format("ORD0%d", nextNum);
			    } else {
			    	ord_cd = String.format("ORD%d", nextNum);
			    }
			}
			
			ordercontractDTO.setOrd_cd(ord_cd);
			// 작업 지시 insert
			ordercontractDAO.insertOrder(ordercontractDTO);
		}
		public void insertContract(OrdercontractDTO ordercontractDTO) {
			
			Integer conLastNum = ordercontractDAO.getConLastNum();
			String con_cd;
			if (conLastNum == null) {
				con_cd = "CON001";
			} else {
			    int nextNum = conLastNum + 1;
			    if (nextNum < 10) {
			    	con_cd = String.format("CON00%d", nextNum);
			    } else if (nextNum < 100) {
			    	con_cd = String.format("CON0%d", nextNum);
			    } else {
			    	con_cd = String.format("CON%d", nextNum);
			    }
			}
			ordercontractDTO.setCon_cd(con_cd);
			// 작업 지시 insert
			ordercontractDAO.insertContract(ordercontractDTO);
		}
		public Integer getOrdLastNum() {
			return ordercontractDAO.getOrdLastNum();
		}
		public Integer getConLastNum() {
			return ordercontractDAO.getConLastNum();
		}

			
}
