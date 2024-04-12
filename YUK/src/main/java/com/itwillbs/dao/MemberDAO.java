package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AuthDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class MemberDAO {
	@Inject
	SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.memberMapper"; 

	public MemberDTO userCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".userCheck", memberDTO);
	}

	public List<MemberDTO> getMemberList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getMemberList",pageDTO);
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

	public int getMemberCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getMemberCount", pageDTO);
	}

	public MemberDTO checkMember(String id) {
		return sqlSession.selectOne(namespace + ".checkMember", id);
	}

	public MemberDTO pNumberCheck(String phone) {
		return sqlSession.selectOne(namespace + ".pNumberCheck", phone);
	}

}
