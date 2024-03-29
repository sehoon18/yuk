package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductDTO;


@Repository
public class ProductDAO {
	@Inject
	SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.productMapper";

	public List<ProductDTO> getProductList(ProductDTO productDTO) {
		return sqlSession.selectList(namespace + ".getProductList",productDTO);
	}

	public List<ProductDTO> getRequiredList(ProductDTO productDTO) {
		return sqlSession.selectList(namespace + ".getRequiredList",productDTO);
	}

	public List<ProductDTO> getSearchProductList(ProductDTO productDTO) {
		return sqlSession.selectList(namespace + ".getSearchProductList",productDTO);
	}

	public List<ProductDTO> getSearchRequiredList(ProductDTO productDTO) {
		return sqlSession.selectList(namespace + ".getSearchRequiredList",productDTO);
	} 

	
}
