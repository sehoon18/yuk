package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Service
public class ProductService {
	@Inject
	ProductDAO productDAO;

	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		return productDAO.getProductList(pageDTO);
	}

	public List<ProductDTO> getRequiredList(ProductDTO productDTO) {
		return productDAO.getRequiredList(productDTO);
	}

	public List<ProductDTO> getSearchProductList(ProductDTO productDTO) {
		return productDAO.getSearchProductList(productDTO);
	}

	public List<ProductDTO> getSearchRequiredList(ProductDTO productDTO) {
		return productDAO.getSearchRequiredList(productDTO);
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
	
	
	
}
