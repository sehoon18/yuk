package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberService {
	@Inject
	MemberDAO memberDAO;

	public MemberDTO userCheck(MemberDTO memberDTO) {
		return memberDAO.userCheck(memberDTO);
	}

	public List<MemberDTO> getMemberList(MemberDTO memberDTO) {
		return memberDAO.getMemberList(memberDTO);
	}

	public List<MemberDTO> searchMemberList(MemberDTO memberDTO) {
		return memberDAO.searchMemberList(memberDTO);
	}

	public void insertMember(MemberDTO memberDTO) {
		memberDAO.insertMember(memberDTO);
	}

	public void updateMember(MemberDTO memberDTO) {
		System.out.println(memberDTO);
		memberDAO.updateMember(memberDTO);
	}

	public void deleteMember(MemberDTO memberDTO) {
		memberDAO.deleteMember(memberDTO);
	}


}
