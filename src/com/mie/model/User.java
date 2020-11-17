package com.mie.model;

public class User {
	
	private int userId;
	private String name;
	private String email;
	private String password;
	private int numGroups;
	
	public User(int userId, String name, String email, String password, int numGroups) {
		this.userId = userId;
		this.name = name;
		this.email = email;
		this.password = password;
		this.numGroups = numGroups;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public String getName() {
		return name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public int getNumGroups() {
		return numGroups;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name
				+ ", email=" + email + ", password=" + password
				+ ", numGroups=" + numGroups + "]";
	}

}
