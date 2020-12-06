package com.mie.model;
import java.sql.Date;
public class Application {
	
	private int appId;
	private String company;
	private int userId;
	private String url;
	private Date deadline;
	private int interview;
	private int joboffer;
	private String industry;
	private String position;
	
	public Application(){}
	
	public Application(int appId, String company, int userId, String url, Date deadline, int interview, int joboffer, String industry, String position) {
		this.appId = appId;
		this.company = company;
		this.userId = userId;
		this.url = url;
		this.deadline = deadline;
		this.interview = interview;
		this.joboffer = joboffer;
		this.industry = industry;
		this.position = position;
	}
	
	public int getAppId() {
		return appId;
	}
	public void setAppId(int appid) {
		this.appId = appid;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
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
	public Date getDeadline(){
		return deadline;
	}
	public void setDeadline(Date deadline){
		this.deadline = deadline;
	}
	public int getInterview(){
		return interview;
	}
	public void setInterview(int interview){
		this.interview = interview;
	}
	public int getJob(){
		return joboffer;
	}
	public void setJob(int joboffer){
		this.joboffer = joboffer;
	}
	public String getIndustry(){
		return industry;
		
	}
	public void setIndustry(String industry){
		this.industry = industry;
	}
	public String getPosition(){
		return position;
	}
	public void setPosition(String position){
		this.position = position;
	}
	@Override
	public String toString() {
		return "Application [appId=" + appId + ", company=" + company
				+ ", userId=" + userId + ", url=" + url + ", deadline=" + deadline
				+ ", interview=" + interview + ", joboffer=" + joboffer
				+ ", industry=" + industry + ", position=" + position + "]";
	}

}
