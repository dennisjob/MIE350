package com.mie.model;

public class Company {
	
	private int companyId;
	private int userId;
	private String name;
	private String url;
	private String connection;
	
	public Company(){}
	
	public Company(int companyId, int userId, String name, String url, String connection) {
		this.companyId = companyId;
		this.userId = userId;
		this.name = name;
		this.url = url;
		this.connection = connection;
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
	public String getConnection(){
		return connection;
	}
	
	
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	public void setConnection(String connection){
		this.connection = connection;
	}

}
