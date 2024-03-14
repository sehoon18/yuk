package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAO {
	@Inject
	SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.memberMapper"; 

	public MemberDTO userCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".userCheck", memberDTO);
	}
}
