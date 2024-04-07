package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AuthDTO;
import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAO {
	@Inject
	SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.memberMapper"; 

	public MemberDTO userCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".userCheck", memberDTO);
	}

	public List<MemberDTO> getMemberList(MemberDTO memberDTO) {
		return sqlSession.selectList(namespace + ".getMemberList",memberDTO);
	}

	public List<MemberDTO> searchMemberList(MemberDTO memberDTO) {
		return sqlSession.selectList(namespace + ".searchMemberList",memberDTO);
	}

	public void insertMember(MemberDTO memberDTO) {
		sqlSession.insert(namespace + ".insertMember",memberDTO);
	}

	public void updateMember(MemberDTO memberDTO) {
		System.out.println(memberDTO);
		sqlSession.update(namespace + ".updateMember",memberDTO);
	}

	public void deleteMember(MemberDTO memberDTO) {
		sqlSession.delete(namespace + ".deleteMember",memberDTO);
	}

	public MemberDTO getMember(String userid) {
		return sqlSession.selectOne(namespace + ".getMember", userid);
	}

	public void insertMemberAuth(AuthDTO authDTO) {
		sqlSession.insert(namespace + ".insertMemberAuth", authDTO);
	}

}
