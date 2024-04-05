package com.itwillbs.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductionDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
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
		
		// instructionCode로 INS_CD, PRO_CD 가져오기
		productionDTO = productionDAO.getInstruction(productionDTO);
		
		// PRO_CD로 REQ_CD 가져오기
		List<ProductDTO> reqList = productionDAO.getReq(productionDTO);
		
		//원자재 소요
		for (int i = 0; i < reqList.size(); i++) {
			ProductDTO productDTO = new ProductDTO(); 
		    int fvol = reqList.get(i).getRequiredVol() * productionDTO.getInsVol(); // 소요량 * 지시수량
		    String productCode = reqList.get(i).getProductName();
		    productDTO.setProductCode(productCode);
		    int mvol = productionDAO.getProductVolToProCode(productCode);
		    int Lvol = mvol - fvol;	// 재고 - (소요량*지시수량)
		    productDTO.setProdcutVol(Lvol);
		    productionDAO.updateVol(productDTO); // 재고- (소요량*지시수량) 저장
		}

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
		
//		// 재고 추가
//		if(productionDTO.getPerGood() == 0) {
//			int proVol = productionDAO.getProductVolToProCode(productionDTO.getProductCode());
//			int fvol = proVol + productionDTO.getPerACA(); // 재고 + 양품수량
//			productionDTO.setVol(fvol);
//			productionDAO.addVol(productionDTO);
//		}
		
		Integer pibLastNum = productionDAO.getPibLastNum();
		String pibCode;
		if (pibLastNum == null) {
			pibCode = "PIB001";
		} else {
		    int nextNum = pibLastNum + 1;
		    if (nextNum < 10) {
		    	pibCode = String.format("PIB00%d", nextNum);
		    } else if (nextNum < 100) {
		    	pibCode = String.format("PIB0%d", nextNum);
		    } else {
		    	pibCode = String.format("PIB%d", nextNum);
		    }
		}
		productionDTO.setPibCode(pibCode);
		productionDAO.insertMib(productionDTO);
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
		
		// 재고 추가
		int proVol = productionDAO.getProductVolToProCode(productionDTO.getProductCode());	// 재고
		int ovol = productionDAO.getPerACAToPerCode(productionDTO);							// 원래 기입 실적
		int fvol = 0;																		// 최종 재고
		
		if(productionDTO.getPerGood() == 0) {
			if(productionDAO.getPerGood(productionDTO) == 0) {
				int cvol = productionDTO.getPerACA() - ovol; 	// 현재기입실적 - 원래기입실적
				fvol = proVol + cvol; 							// 재고 + 수정수량
			} else if (productionDAO.getPerGood(productionDTO) == 1) {
				fvol = proVol + productionDTO.getPerACA();		// 재고 + 현재기입실적
			}
			
		} else if(productionDTO.getPerGood() == 1) {
			if(productionDAO.getPerGood(productionDTO) == 0) {
				fvol = proVol - ovol; 		// 재고 + 현재기입실적
			} else if (productionDAO.getPerGood(productionDTO) == 1) {
				fvol = proVol;
			}
		}
		productionDTO.setVol(fvol);
		productionDAO.addVol(productionDTO);
		productionDAO.updatePer(productionDTO);
	}

	public Integer getPerLastNum() {
		return productionDAO.getPerLastNum();
	}

	public void deletePer(ProductionDTO productionDTO) {
		// 재고 감소
		String productCode = productionDAO.getProductCodeToPerCD(productionDTO);
		productionDTO.setProductCode(productCode);
		int proVol = productionDAO.getProductVolToProCode(productCode);		// 재고
		int ovol = productionDAO.getPerACAToPerCode(productionDTO);			// 원래 기입 실적
		int fvol = 0;														// 최종 재고
		if(productionDAO.getPerGood(productionDTO) == 0) {
			fvol = proVol - ovol;
			productionDTO.setVol(fvol);
			productionDAO.addVol(productionDTO);
		}
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

	public List<ProductDTO> getReq(ProductionDTO productionDTO) {
		return productionDAO.getReq(productionDTO);
	}

	public List<ProductionDTO> getReqDetail(ProductionDTO productionDTO) {
		return productionDAO.getReqDetail(productionDTO);
	}

}
