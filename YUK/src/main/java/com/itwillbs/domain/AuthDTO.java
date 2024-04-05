package com.itwillbs.domain;

public class AuthDTO {
	private String userid;
	private String auth;

	@Override
	public String toString() {
		return "AuthDTO [userid=" + userid + ", auth=" + auth + "]";
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
}
