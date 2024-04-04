package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductionDTO;

@Repository
public class ProductionDAO {
	@Inject
	SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.productionMapper"; 

	public void insertLine(ProductionDTO productionDTO) {
		sqlSession.insert(namespace + ".insertLine", productionDTO);
	}

	public List<ProductionDTO> getLineList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getLineList", pageDTO);
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

	public List<ProductionDTO> getInstructionList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getInstructionList", pageDTO);
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

	public void switchLineStatus0(ProductionDTO productionDTO) {
		sqlSession.update(namespace + ".switchLineStatus0", productionDTO);
	}

	public void updateInsStatus(ProductionDTO productionDTO) {
		sqlSession.update(namespace + ".updateInsStatus", productionDTO);
	}

	public Integer getInsLastNum() {
		return sqlSession.selectOne(namespace + ".getInsLNum");
	}

	public Integer setLineLastCode() {
		return sqlSession.selectOne(namespace + ".setLineLastCode");
	}

	public List<ProductionDTO> getCompInstructionList(ProductionDTO productionDTO) {
		return sqlSession.selectList(namespace + ".getCompInstructionList", productionDTO);
	}

	public void insertPer(ProductionDTO productionDTO) {
		sqlSession.insert(namespace + ".insertPer", productionDTO);
	}

	public Integer getPerLastNum() {
		return sqlSession.selectOne(namespace + ".getPerLastNum");
	}

	public List<ProductionDTO> getPerList(ProductionDTO productionDTO) {
		return sqlSession.selectList(namespace + ".getPerList", productionDTO);
	}

	public ProductionDTO getPerformance(ProductionDTO productionDTO) {
		return sqlSession.selectOne(namespace + ".getPerformance", productionDTO);
	}

	public Integer getLineLastNum() {
		return sqlSession.selectOne(namespace + ".getLineLastNum");
	}

	public void updatePer(ProductionDTO productionDTO) {
		sqlSession.update(namespace + ".updatePer", productionDTO);
	}

	public void deletePer(ProductionDTO productionDTO) {
		sqlSession.delete(namespace + ".deletePer", productionDTO);
	}

	public int getLineCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getLineCount", pageDTO);
	}

	public int getInsCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getInsCount", pageDTO);
	}

}
