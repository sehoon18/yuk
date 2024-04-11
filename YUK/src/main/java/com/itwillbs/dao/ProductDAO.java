package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ProductionDTO;


@Repository
public class ProductDAO {
	@Inject
	SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.productMapper";

	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getProductList",pageDTO);
	}

	public List<ProductDTO> getRequiredList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getRequiredList",pageDTO);
	}


	public void updateProduct(ProductDTO productDTO) {
		sqlSession.update(namespace + ".updateProduct", productDTO);
	}

	public void deleteProduct(ProductDTO productDTO) {
		sqlSession.delete(namespace + ".deleteProduct", productDTO);
	}

	public Integer getProductLastNum() {
		return sqlSession.selectOne(namespace + ".getProductLastNum");
	}


	public void insertProduct(ProductDTO productDTO) {
		sqlSession.insert(namespace+ ".insertProduct",productDTO);
		
	}

	public Integer getRequiredLastNum() {
		return sqlSession.selectOne(namespace + ".getRequiredLastNum");
	}

	public void insertRequired(ProductDTO productDTO) {
		sqlSession.insert(namespace+ ".insertRequired",productDTO);
	}

	public void updateRequired(ProductDTO productDTO) {
		sqlSession.update(namespace + ".updateRequired", productDTO);		
	}

	public void deleteRequired(ProductDTO productDTO) {
		sqlSession.delete(namespace + ".deleteRequired", productDTO);
	}

	public int getProductCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getProductCount", pageDTO);
	}

	public int getRequiredCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getRequiredCount", pageDTO);
	}

	public List<ProductionDTO> productVol(ProductDTO productDTO) {
		return sqlSession.selectList(namespace + ".productVol", productDTO);
	}

	public List<ProductionDTO> productVol2(ProductDTO productDTO) {
		return sqlSession.selectList(namespace + ".productVol2", productDTO);
	}

	public List<ProductionDTO> productVol3(ProductDTO productDTO) {
		return sqlSession.selectList(namespace + ".productVol3", productDTO);
	} 

	
}
