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

	public void switchLineStatus(ProductionDTO productionDTO) {
		sqlSession.update(namespace + ".switchLineStatus", productionDTO);
	}
	
	public void insertInstruction(ProductionDTO productionDTO) {
		sqlSession.insert(namespace + ".insertInstruction", productionDTO);
	}

	public List<ProductionDTO> getInstructionList() {
		return sqlSession.selectList(namespace + ".getInstructionList");
	}

	public List<ProductionDTO> getPerformanceList() {
		return sqlSession.selectList(namespace + ".getPerformanceList");
	}

	public List<ProductionDTO> getProductList() {
		return sqlSession.selectList(namespace + ".getProductList");
	}

	public void updateLine(ProductionDTO productionDTO) {
		sqlSession.update(namespace + ".updateLine", productionDTO);
	}

	public void deleteLine(ProductionDTO productionDTO) {
		sqlSession.delete(namespace + ".deleteLine", productionDTO);
	}

	public ProductionDTO getInstruction(ProductionDTO productionDTO) {
		return sqlSession.selectOne(namespace + ".getInstruction", productionDTO);
	}

	public void updateInstruction(ProductionDTO productionDTO) {
		sqlSession.update(namespace + ".updateInstruction", productionDTO);
	}

	public void deleteInstruction(ProductionDTO productionDTO) {
		sqlSession.delete(namespace + ".deleteInstruction", productionDTO);
	}



	
	
}
