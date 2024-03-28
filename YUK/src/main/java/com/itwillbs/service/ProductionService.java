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

	public void insertInstruction(ProductionDTO productionDTO) {
		// 라인 상태 변경
		productionDAO.switchLineStatus(productionDTO);
		// 작업 지시 insert
		productionDAO.insertInstruction(productionDTO);
	}

	public List<ProductionDTO> getInstructionList() {
		return productionDAO.getInstructionList();
	}

	public List<ProductionDTO> getPerformanceList() {
		return productionDAO.getPerformanceList();
	}

	public List<ProductionDTO> getProductList() {
		return productionDAO.getProductList();
	}

	public void updateLine(ProductionDTO productionDTO) {
		productionDAO.updateLine(productionDTO);
	}

	public void deleteLine(ProductionDTO productionDTO) {
		productionDAO.deleteLine(productionDTO);
	}

	public ProductionDTO getInstruction(ProductionDTO productionDTO) {
		return productionDAO.getInstruction(productionDTO);
	}

	public void updateInstruction(ProductionDTO productionDTO) {
		productionDAO.updateInstruction(productionDTO);
	}

	public void deleteInstruction(ProductionDTO productionDTO) {
		productionDAO.deleteInstruction(productionDTO);
	}


}
