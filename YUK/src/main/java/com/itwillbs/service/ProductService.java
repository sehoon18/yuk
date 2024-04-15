package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ProductionDTO;

@Service
public class ProductService {
	@Inject
	ProductDAO productDAO;

	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow -1);
		pageDTO.setEndRow(endRow);
		
		return productDAO.getProductList(pageDTO);
	}

	public List<ProductDTO> getRequiredList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int EndRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow -1);
		pageDTO.setEndRow(EndRow);
		
		return productDAO.getRequiredList(pageDTO);
	}


	public void updateProduct(ProductDTO productDTO) {
		productDAO.updateProduct(productDTO);
	}

	public void deleteProduct(ProductDTO productDTO) {
		productDAO.deleteProduct(productDTO);
	}


	public Integer getProductLastNum() {
		return productDAO.getProductLastNum();
	}

	public void insertProduct(ProductDTO productDTO) {
		String productCode;
		// productCode 생성
				Integer productLastNum = productDAO.getProductLastNum();

				if (productLastNum == null) {
				    productCode = "PRO001";
				} else {
				    int nextNum = productLastNum + 1;
				    if (nextNum < 10) {
				    	productCode = String.format("PRO00%d", nextNum);
				    } else if (nextNum < 100) {
				    	productCode = String.format("PRO0%d", nextNum);
				    } else {
				    	productCode = String.format("PRO%d", nextNum);
				    }
				}
				
				productDTO.setProductCode(productCode);
				productDAO.insertProduct(productDTO);
	}

	public Integer getRequiredLastNum() {
		return productDAO.getRequiredLastNum();
	}

	public void insertRequired(ProductDTO productDTO) {
		
		String requiredCode;
		// productCode 생성
				Integer requiredLastNum = productDAO.getRequiredLastNum();

				if (requiredLastNum == null) {
					requiredCode = "REQ001";
				} else {
				    int nextNum = requiredLastNum + 1;
				    if (nextNum < 10) {
				    	requiredCode = String.format("REQ00%d", nextNum);
				    } else if (nextNum < 100) {
				    	requiredCode = String.format("REQ0%d", nextNum);
				    } else {
				    	requiredCode = String.format("REQ%d", nextNum);
				    }
				}
				
				productDTO.setRequiredCode(requiredCode);
				productDAO.insertRequired(productDTO);
	}

	public void updateRequired(ProductDTO productDTO) {
		productDAO.updateRequired(productDTO);
	}

	public void deleteRequired(ProductDTO productDTO) {
		productDAO.deleteRequired(productDTO);
	}

	public int getProductCount(PageDTO pageDTO) {
		return productDAO.getProductCount(pageDTO);
	}

	public int getRequiredCount(PageDTO pageDTO) {
		return productDAO.getRequiredCount(pageDTO);
	}

	public List<ProductionDTO> productVol(ProductDTO productDTO) {
		return productDAO.productVol(productDTO);
	}

	public List<ProductionDTO> productVol2(ProductDTO productDTO) {
		return productDAO.productVol2(productDTO);
	}

	public List<ProductionDTO> productVol3(ProductDTO productDTO) {
		return productDAO.productVol3(productDTO);
	}
	
	
	
}
