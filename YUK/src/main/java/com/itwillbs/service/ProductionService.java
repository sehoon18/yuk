package com.itwillbs.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductionDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductionDTO;

@Service
public class ProductionService {
	@Inject
	private ProductionDAO productionDAO; 
	
	public void insertLine(ProductionDTO productionDTO) {
		System.out.println("ProductionService insertLine()");
		
		// lineCode 생성
		Integer lineLastNum = productionDAO.getLineLastNum();
		String lineCode;
		if (lineLastNum == null) {
		    lineCode = "L001";
		} else {
		    int nextNum = lineLastNum + 1;
		    if (nextNum < 10) {
		    	lineCode = String.format("L00%d", nextNum);
		    } else if (nextNum < 100) {
		    	lineCode = String.format("L0%d", nextNum);
		    } else {
		    	lineCode = String.format("L%d", nextNum);
		    }
		}
		
		productionDTO.setLineCode(lineCode);
		productionDAO.insertLine(productionDTO);
	}

	public List<ProductionDTO> getLineList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int EndRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow -1);
		pageDTO.setEndRow(EndRow);
		
		return productionDAO.getLineList(pageDTO);
	}

	public ProductionDTO getLineCode(String lineCode) {
		return productionDAO.getLineCode(lineCode);
	}

	public void insertInstruction(ProductionDTO productionDTO) {
		
		Integer insLastNum = productionDAO.getInsLastNum();
		String instructionCode;
		if (insLastNum == null) {
		    instructionCode = "INS001";
		} else {
		    int nextNum = insLastNum + 1;
		    if (nextNum < 10) {
		        instructionCode = String.format("INS00%d", nextNum);
		    } else if (nextNum < 100) {
		        instructionCode = String.format("INS0%d", nextNum);
		    } else {
		        instructionCode = String.format("INS%d", nextNum);
		    }
		}
		productionDTO.setInstructionCode(instructionCode);
		
		// 라인 상태 변경
		productionDAO.switchLineStatus(productionDTO);
		// 작업 지시 insert
		productionDAO.insertInstruction(productionDTO);
	}

	public List<ProductionDTO> getInstructionList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int EndRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow -1);
		pageDTO.setEndRow(EndRow);
		
		return productionDAO.getInstructionList(pageDTO);
	}

	public List<ProductionDTO> getPerformanceList() {
		return productionDAO.getPerformanceList();
	}

	public List<ProductionDTO> getProductList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int EndRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow -1);
		pageDTO.setEndRow(EndRow);
		
		return productionDAO.getProductList(pageDTO);
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
		ProductionDTO productionDTO2 = productionDAO.getInstruction(productionDTO);
		productionDAO.switchLineStatus0(productionDTO2); // 기존 라인 0(대기) 상태변경
		productionDAO.switchLineStatus(productionDTO); // 새로 입력된 라인 1(가동) 상태변경
		productionDAO.updateInstruction(productionDTO); // 작업지시 수정
	}

	public void deleteInstruction(ProductionDTO productionDTO) {
		productionDTO = productionDAO.getInstruction(productionDTO); // instructionCode로 line코드 생성
		productionDAO.switchLineStatus0(productionDTO); // 연결된 라인 상태를 0(대기)으로 변경
		productionDAO.deleteInstruction(productionDTO); // db에 작업지시 삭제
	}

	public void updateInsStatus(ProductionDTO productionDTO) {
		productionDTO = productionDAO.getInstruction(productionDTO); // instructionCode로 line코드 생성
		productionDAO.switchLineStatus0(productionDTO);// 연결된 라인 상태를 0(대기)으로 변경
		productionDAO.updateInsStatus(productionDTO); // 작업지시 상태 2(완료)로 변경
	}

	public Integer getInsLastNum() {
		return productionDAO.getInsLastNum();
	}

	public Integer setLineLastCode() {
		return productionDAO.setLineLastCode();
	}

	public List<ProductionDTO> getCompInstructionList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int EndRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow -1);
		pageDTO.setEndRow(EndRow);
		
		return productionDAO.getCompInstructionList(pageDTO);
	}

	public void insertPer(ProductionDTO productionDTO) {
		
		Integer perLastNum = productionDAO.getPerLastNum();
		String perCode;
		if (perLastNum == null) {
			perCode = "PER001";
		} else {
		    int nextNum = perLastNum + 1;
		    if (nextNum < 10) {
		    	perCode = String.format("PER00%d", nextNum);
		    } else if (nextNum < 100) {
		    	perCode = String.format("PER0%d", nextNum);
		    } else {
		    	perCode = String.format("PER%d", nextNum);
		    }
		}
		productionDTO.setPerCode(perCode);
		
		Timestamp Ttoday = new Timestamp(System.currentTimeMillis());
		String Stoday = new SimpleDateFormat("yyyy-MM-dd").format(Ttoday);
		productionDTO.setPerDate(Stoday);
		
		System.out.println(productionDTO);
		productionDAO.insertPer(productionDTO);
	}

	public List<ProductionDTO> getPerList(ProductionDTO productionDTO) {
		return productionDAO.getPerList(productionDTO);
	}

	public ProductionDTO getPerformance(ProductionDTO productionDTO) {
		return productionDAO.getPerformance(productionDTO);
	}

	public Integer getLineLastNum() {
		return productionDAO.getLineLastNum();
	}

	public void updatePer(ProductionDTO productionDTO) {
		productionDAO.updatePer(productionDTO);
	}

	public Integer getPerLastNum() {
		return productionDAO.getPerLastNum();
	}

	public void deletePer(ProductionDTO productionDTO) {
		productionDAO.deletePer(productionDTO);
	}

	// 페이징 라인 갯수
	public int getLineCount(PageDTO pageDTO) {
		return productionDAO.getLineCount(pageDTO);
	}

	public int getInsCount(PageDTO pageDTO) {
		return productionDAO.getInsCount(pageDTO);
	}

	public int getComInsCount(PageDTO pageDTO) {
		return productionDAO.getComInsCount(pageDTO);
	}

	public int getProCount(PageDTO pageDTO) {
		return productionDAO.getProCount(pageDTO);
	}

}
