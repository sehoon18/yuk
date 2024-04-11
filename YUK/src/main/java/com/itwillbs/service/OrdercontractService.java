package com.itwillbs.service;


import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.itwillbs.dao.OrdercontractDAO;
import com.itwillbs.domain.OrdercontractDTO;
import com.itwillbs.domain.PageDTO;



	@Service
	public class OrdercontractService {
		
		@Inject
		OrdercontractDAO ordercontractDAO;
		
		public List<OrdercontractDTO> getOrderList(PageDTO pageDTO) {
			
			int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
			int EndRow = startRow + pageDTO.getPageSize() - 1;
			
			pageDTO.setStartRow(startRow -1);
			pageDTO.setEndRow(EndRow);
		
			return ordercontractDAO.getOrderList(pageDTO);
		}

		public List<OrdercontractDTO> getContractList(PageDTO pageDTO) {
			
			int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
			int EndRow = startRow + pageDTO.getPageSize() - 1;
			
			pageDTO.setStartRow(startRow -1);
			pageDTO.setEndRow(EndRow);
		
			return ordercontractDAO.getContractList(pageDTO);
		}
			public List<OrdercontractDTO> getContractList2(PageDTO pageDTO) {
//			int currentPage = pageDTO.getCurrentPage();
			int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
			int EndRow = startRow + pageDTO.getPageSize() - 1;
			
			pageDTO.setStartRow(startRow -1);
			pageDTO.setEndRow(EndRow);
			
			return ordercontractDAO.getContractList2(pageDTO);
		}
			public List<OrdercontractDTO> getOrderList2(PageDTO pageDTO) {
//				int currentPage = pageDTO.getCurrentPage();
				int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
				int EndRow = startRow + pageDTO.getPageSize() - 1;
				
				pageDTO.setStartRow(startRow -1);
				pageDTO.setEndRow(EndRow);
				
				return ordercontractDAO.getOrderList2(pageDTO);
			}
			public List<OrdercontractDTO> getClientList(PageDTO pageDTO) {
//				int currentPage = pageDTO.getCurrentPage();
				int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
				int EndRow = startRow + pageDTO.getPageSize() - 1;
				
				pageDTO.setStartRow(startRow -1);
				pageDTO.setEndRow(EndRow);
				
				return ordercontractDAO.getClientList(pageDTO);
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
		
		public void updateOrder(OrdercontractDTO ordercontractDTO) {
			
			ordercontractDAO.updateOrder(ordercontractDTO);
		}
		public void updateContract(OrdercontractDTO ordercontractDTO) {
			
			ordercontractDAO.updateContract(ordercontractDTO);
		}
		public void deleteOrder(OrdercontractDTO ordercontractDTO) {
			ordercontractDAO.deleteOrder(ordercontractDTO);
		}
		public void deleteContract(OrdercontractDTO ordercontractDTO) {
			ordercontractDAO.deleteContract(ordercontractDTO);
		}
		public OrdercontractDTO getOrder(OrdercontractDTO ordercontractDTO) {
			
			return ordercontractDAO.getOrder(ordercontractDTO);
		}
		public OrdercontractDTO getContract(OrdercontractDTO ordercontractDTO) {
			
			return ordercontractDAO.getContract(ordercontractDTO);
		}
		public int getOrderCount(PageDTO pageDTO) {
			
			return ordercontractDAO.getOrderCount(pageDTO);
		}
		public int getContractCount(PageDTO pageDTO) {
			
			return ordercontractDAO.getContractCount(pageDTO);
		}
		public List<OrdercontractDTO> getContractVol(OrdercontractDTO ordercontractDTO) {
			 return ordercontractDAO.getContractVol(ordercontractDTO);
		}
		public List<OrdercontractDTO> orderVolChart(OrdercontractDTO ordercontractDTO) {
			return ordercontractDAO.orderVolChart(ordercontractDTO);
		}
		
		public void insertMib(OrdercontractDTO ordercontractDTO) {
			//mib_cd 생성
			Integer mibLastNum = ordercontractDAO.getMibLastNum();
			String mib_cd;
			if (mibLastNum == null) {
				mib_cd = "MIB001";
			} else {
			    int nextNum = mibLastNum + 1;
			    if (nextNum < 10) {
			    	mib_cd = String.format("MIB00%d", nextNum);
			    } else if (nextNum < 100) {
			    	mib_cd = String.format("MIB0%d", nextNum);
			    } else {
			    	mib_cd = String.format("MIB%d", nextNum);
			    }
			}
			ordercontractDTO.setMib_cd(mib_cd);
			//자재 입고 insert
			ordercontractDAO.insertMib(ordercontractDTO);
		}
		
		public void insertOb(OrdercontractDTO ordercontractDTO) {
			//ob_cd 생성
			Integer obLastNum = ordercontractDAO.getObLastNum();
			String ob_cd;
			if (obLastNum == null) {
				ob_cd = "OB001";
			} else {
			    int nextNum = obLastNum + 1;
			    if (nextNum < 10) {
			    	ob_cd = String.format("OB00%d", nextNum);
			    } else if (nextNum < 100) {
			    	ob_cd = String.format("OB0%d", nextNum);
			    } else {
			    	ob_cd = String.format("OB%d", nextNum);
			    }
			}
			ordercontractDTO.setOb_cd(ob_cd);
			//제품 출고 insert
			ordercontractDAO.insertOb(ordercontractDTO);
		}
		
		public void deleteMib(OrdercontractDTO ordercontractDTO) {
			ordercontractDAO.deleteMib(ordercontractDTO);
		}
		
		public void deleteOb(OrdercontractDTO ordercontractDTO) {
			ordercontractDAO.deleteOb(ordercontractDTO);
		}

		public int getOrderCount2(PageDTO pageDTO) {
			return ordercontractDAO.getOrderCount2(pageDTO);
		}

		public int getContractCount2(PageDTO pageDTO) {
			return ordercontractDAO.getContractCount2(pageDTO);
		}

		public int getClientCount(PageDTO pageDTO) {
			return ordercontractDAO.getClientCount(pageDTO);
		}
		
		public OrdercontractDTO getOrderform(OrdercontractDTO ordercontractDTO) {
			
			return ordercontractDAO.getOrderform(ordercontractDTO);
		}
		public OrdercontractDTO getContractform(OrdercontractDTO ordercontractDTO) {
			
			return ordercontractDAO.getContractform(ordercontractDTO);
		}
		
		
			
}
