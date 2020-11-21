package com.mie.model;

public class Application {
	
	private int appId;
	private int companyId;
	private int userId;
	private String url;
	
	public Application(){}
	
	public Application(int appId, int companyId, int userId, String url) {
		this.appId = appId;
		this.companyId = companyId;
		this.userId = userId;
		this.url = url;
	}
	
	public int getAppId() {
		return appId;
	}
	public void setAppId(int appid) {
		this.appId = appid;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyid) {
		this.companyId = companyid;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userid) {
		this.userId = userid;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

}
