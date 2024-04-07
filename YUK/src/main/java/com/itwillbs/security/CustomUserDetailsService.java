package com.itwillbs.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.CustomUser;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	@Inject
	private MemberService memberService;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		memberService = new MemberService();
		MemberDTO memberDTO = memberService.getMember(id);
		return memberDTO == null ? null : new CustomUser(memberDTO);
	}

}
