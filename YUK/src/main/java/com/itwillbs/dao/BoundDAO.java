package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoundDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class BoundDAO {
	@Inject
	SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.boundMapper";

	public List<BoundDTO> getInBoundBoardList(PageDTO pageDTO) {
		System.out.println("BoundDAO getInBoundBoardList()");
		return sqlSession.selectList(namespace + ".getInBoundBoardList", pageDTO);
	}//getInBoundBoardList()
	
	public int getInBoundBoardCount(PageDTO pageDTO) {
		System.out.println("BoundDAO getInBoundBoardCount()");
		return sqlSession.selectOne(namespace + ".getInBoundBoardCount", pageDTO);
	}//getInBoundBoardCount()

}
