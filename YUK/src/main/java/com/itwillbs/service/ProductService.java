package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.ProductDTO;

@Service
public class ProductService {
	@Inject
	ProductDAO productDAO;

	public List<ProductDTO> getProductList(ProductDTO productDTO) {
		return productDAO.getProductList(productDTO);
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
	
	
	
}
