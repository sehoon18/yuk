package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductionDTO;

@Repository
public class ProductionDAO {
	@Inject
	SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.productionMapper"; 

	public void insertLine(ProductionDTO productionDTO) {
		sqlSession.insert(namespace + ".insertLine", productionDTO);
	}

	public List<ProductionDTO> getLineList() {
		return sqlSession.selectList(namespace + ".getLineList");
	}

	public ProductionDTO getLineCode(String lineCode) {
		return sqlSession.selectOne(namespace + ".getLineCode", lineCode);
	}

	public List<ProductionDTO> getConProList() {
		return sqlSession.selectList(namespace + ".getConProList");
	}

	public void insertInstruction(ProductionDTO productionDTO) {
		sqlSession.insert(namespace + ".insertInstruction", productionDTO);
	}
	
	
}
