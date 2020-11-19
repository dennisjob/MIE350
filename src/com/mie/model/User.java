package com.mie.model;

public class User {
	
	private int userId;
	private String name;
	private String email;
	private String password;
	
	public User() { }
	
	public User(String name, String email, String password, int numGroups) {
		this.name = name;
		this.email = email;
		this.password = password;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name
				+ ", email=" + email + ", password=" + password + "]";
	}

}
