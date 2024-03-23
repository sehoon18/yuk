package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductionDAO;
import com.itwillbs.domain.ProductionDTO;

@Service
public class ProductionService {
	@Inject
	private ProductionDAO productionDAO; 
	
	public void insertLine(ProductionDTO productionDTO) {
		System.out.println("ProductionService insertLine()");
		
		productionDAO.insertLine(productionDTO);
	}

	public List<ProductionDTO> getLineList() {
		return productionDAO.getLineList();
	}

	public ProductionDTO getLineCode(String lineCode) {
		return productionDAO.getLineCode(lineCode);
	}

	public List<ProductionDTO> getConProList() {
		return productionDAO.getConProList();
	}

	public void insertInstruction(ProductionDTO productionDTO) {
		productionDAO.insertInstruction(productionDTO);
	}

}
