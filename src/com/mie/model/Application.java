package com.mie.model;

public class Application {
	
	private int appId;
	private int companyId;
	private int userId;
	private String url;
	
	public Application(int appId, int companyId, int userId, String url) {
		this.appId = appId;
		this.companyId = companyId;
		this.userId = userId;
		this.url = url;
	}
	
	public int getAppId() {
		return appId;
	}
	
	public int getCompanyId() {
		return companyId;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public String getUrl() {
		return url;
	}

}
