package com.itwillbs.domain;

public class MemberDTO {	
	private String id;		//아이디
	private String name;	//사용자명
	private String pass;	//비밀번호
	private String phone;	//전화번호
	private int permission; //권한
	
	
	
	@Override
	public String toString() {
		return "MemberDTO [name=" + name + ", id=" + id + ", pass=" + pass + ", phone=" + phone + ", permission="
				+ permission + "]";
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
	
	
	
	

}
