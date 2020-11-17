package com.mie.model;

public class Company {
	
	private int companyId;
	private int userId;
	private String name;
	private String url;
	
	public Company(int companyId, int userId, String name, String url) {
		this.companyId = companyId;
		this.userId = userId;
		this.name = name;
		this.url = url;
	}
	
	public int getCompanyId() {
		return companyId;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public String getName() {
		return name;
	}
	
	public String getUrl() {
		return url;
	}

}
