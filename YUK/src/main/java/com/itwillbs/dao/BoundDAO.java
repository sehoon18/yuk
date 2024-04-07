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
	
	public List<BoundDTO> getInBoundBoardList2(PageDTO pageDTO) {
		System.out.println("BoundDAO getInBoundBoardList2()");
		return sqlSession.selectList(namespace + ".getInBoundBoardList2", pageDTO);
	}//getInBoundBoardList2()
	
	public int getInBoundBoardCount(PageDTO pageDTO) {
		System.out.println("BoundDAO getInBoundBoardCount()");
			return sqlSession.selectOne(namespace + ".getInBoundBoardCount", pageDTO);
	}//getInBoundBoardCount()
	
	public int getInBoundBoardCount2(PageDTO pageDTO) {
		System.out.println("BoundDAO getInBoundBoardCount2()");
			return sqlSession.selectOne(namespace + ".getInBoundBoardCount2", pageDTO);
	}//getInBoundBoardCount2()
	
	public BoundDTO getPro_cdFromOrd_cd(BoundDTO boundDTO) {
		System.out.println("BoundDAO getPro_cdFromOrd_cd()");
			return sqlSession.selectOne(namespace + ".pro_cdFromOrd_cd", boundDTO);
	}//getPro_cdFromOrd_cd()
	
	public BoundDTO getOrd_cdFromMib_cd(BoundDTO boundDTO) {
		System.out.println("BoundDAO getOrd_cdFromMib_cd()");
			return sqlSession.selectOne(namespace + ".ord_cdFromMib_cd", boundDTO);
	}//getOrd_cdFromMib_cd()

	public void inBoundPro1(BoundDTO boundDTO) {
		System.out.println("BoundDAO inBoundPro1()");
		sqlSession.update(namespace + ".inBoundPro1", boundDTO);
	}//inBoundPro1()
	
	public void inBoundPro1_1(BoundDTO boundDTO) {
		System.out.println("BoundDAO inBoundPro1_1()");
		sqlSession.update(namespace + ".inBoundPro1_1", boundDTO);
	}//inBoundPro1_1()
	
	public void inBoundPro1_2(BoundDTO boundDTO) {
		System.out.println("BoundDAO inBoundPro1_2");
		sqlSession.update(namespace + ".inBoundPro1_2", boundDTO);
	}//inBoundPro1_2()
	
	public void inBoundPro2(BoundDTO boundDTO) {
		System.out.println("BoundDAO inBoundPro2()");
		sqlSession.update(namespace + ".inBoundPro2", boundDTO);
	}//inBoundPro2()
	
	public List<BoundDTO> getOutBoundBoardList(PageDTO pageDTO) {
		System.out.println("BoundDAO getOutBoundBoardList()");
		return sqlSession.selectList(namespace + ".getOutBoundBoardList", pageDTO);
	}//getOutBoundBoardList()
	
	public int getOutBoundBoardCount(PageDTO pageDTO) {
		System.out.println("BoundDAO getOutBoundBoardCount()");
		return sqlSession.selectOne(namespace + ".getOutBoundBoardCount", pageDTO);
	}//getOutBoundBoardCount()
	
	public BoundDTO getCon_cdFromOb_cd(BoundDTO boundDTO) {
		System.out.println("BoundDAO getCon_cdFromOb_cd()");
			return sqlSession.selectOne(namespace + ".con_cdFromOb_cd", boundDTO);
	}//getCon_cdFromOb_cd()
	
	public void outBoundPro(BoundDTO boundDTO) {
		System.out.println("BoundDAO outBoundPro()");
		sqlSession.update(namespace + ".outBoundPro", boundDTO);
	}//outBoundPro()
	
	public void outBoundPro_2(BoundDTO boundDTO) {
		System.out.println("BoundDAO outBoundPro_2");
		sqlSession.update(namespace + ".outBoundPro_2", boundDTO);
	}//outBoundPro_2()
	

}
