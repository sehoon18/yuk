package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.AuthDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class MemberService {
	@Inject
	MemberDAO memberDAO;

	public MemberDTO userCheck(MemberDTO memberDTO) {
		return memberDAO.userCheck(memberDTO);
	}

	public List<MemberDTO> getMemberList(PageDTO pageDTO) {
		
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int EndRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow -1);
		pageDTO.setEndRow(EndRow);
		
		return memberDAO.getMemberList(pageDTO);
	}


	public void insertMember(MemberDTO memberDTO) {
		memberDAO.insertMember(memberDTO);
		
		AuthDTO authDTO = new AuthDTO();
		
		if(memberDTO.getPermission() == 0) {
			authDTO.setAuth("ROLE_ADMIN");
		} else if(memberDTO.getPermission() == 1) {
			authDTO.setAuth("ROLE_PRODUCT");
		} else if(memberDTO.getPermission() == 2) {
			authDTO.setAuth("ROLE_BOUND");
		} else if(memberDTO.getPermission() == 3) {
			authDTO.setAuth("ROLE_OC");
		} else if(memberDTO.getPermission() == 4) {
			authDTO.setAuth("ROLE_PRODUCTION");
		} else {
			authDTO.setAuth("ROLE_NONE");
		}
		authDTO.setId(memberDTO.getId());
		memberDAO.insertMemberAuth(authDTO);
	}

	public void updateMember(MemberDTO memberDTO) {
		System.out.println(memberDTO);
		memberDAO.updateMember(memberDTO);
	}

	public void deleteMember(MemberDTO memberDTO) {
		memberDAO.deleteMember(memberDTO);
	}

	public MemberDTO getMember(String id) {
		return memberDAO.getMember(id);
	}

	public int getMemberCount(PageDTO pageDTO) {
		return memberDAO.getMemberCount(pageDTO);
	}

	public MemberDTO checkMember(String id) {
		return memberDAO.checkMember(id);
	}

	public MemberDTO pNumberCheck(String phone) {
		return memberDAO.pNumberCheck(phone);
	}

}
