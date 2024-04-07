package com.itwillbs.domain;

public class AuthDTO {
	private String id;
	private String auth;

	@Override
	public String toString() {
		return "AuthDTO [id=" + id + ", auth=" + auth + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
}
