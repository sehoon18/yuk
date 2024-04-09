package com.itwillbs.domain;

import java.util.List;

public class MemberDTO {	
	private String id;		//아이디
	private String name;	//사용자명
	private String pass;	//비밀번호
	private String phone;	//전화번호
	private int permission; //권한
	
	private String name2;	//authentication
	// 시큐리티 로그인
	private List<AuthDTO> authList; // 시큐리티 권한
//	private String user_name;
//	private
	
	
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", name=" + name + ", pass=" + pass + ", phone=" + phone + ", permission="
				+ permission + ", name2=" + name2 + ", authList=" + authList + "]";
	}
	
	
	public String getName2() {
		return name2;
	}


	public void setName2(String name2) {
		this.name2 = name2;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPermission() {
		return permission;
	}
	public void setPermission(int permission) {
		this.permission = permission;
	}


	public List<AuthDTO> getAuthList() {
		return authList;
	}


	public void setAuthList(List<AuthDTO> authList) {
		this.authList = authList;
	}
	
	
	
	

}
