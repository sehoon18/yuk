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

	public void inBoundPro(BoundDTO boundDTO) {
		System.out.println("BoundDAO inBoundPro()");
		sqlSession.update(namespace + ".inBoundPro", boundDTO);
	}//inBoundPro()
	
	public List<BoundDTO> getOutBoundBoardList(PageDTO pageDTO) {
		System.out.println("BoundDAO getOutBoundBoardList()");
		return sqlSession.selectList(namespace + ".getOutBoundBoardList", pageDTO);
	}//getOutBoundBoardList()
	
	public int getOutBoundBoardCount(PageDTO pageDTO) {
		System.out.println("BoundDAO getOutBoundBoardCount()");
		return sqlSession.selectOne(namespace + ".getOutBoundBoardCount", pageDTO);
	}//getOutBoundBoardCount()
	
	public void outBoundPro(BoundDTO boundDTO) {
		System.out.println("BoundDAO outBoundPro()");
		sqlSession.update(namespace + ".outBoundPro", boundDTO);
	}//outBoundPro()

}
