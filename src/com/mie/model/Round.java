package com.mie.model;

import java.sql.Timestamp;

public class Round {
	
	private int roundId;
	private int appId;
	private int companyId;
	private int userId;
	private Timestamp dateTime;
	private String roundType; // For example: phone screen, interview, online assessment, etc.
	private String location;
	private String assessorName;
	
	public Round() {  }
	
	public Round(int roundId, int appId, int companyId, int userId, Timestamp dateTime, 
			String roundType, String location, String assessorName) {
		this.roundId = roundId;
		this.appId = appId;
		this.companyId = companyId;
		this.userId = userId;
		this.dateTime = dateTime;
		this.roundType = roundType;
		this.location = location;
		this.assessorName = assessorName;
	}
	
	public int getRoundId() {
		return roundId;
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
	
	public Timestamp getDateTime() {
		return dateTime;
	}
	
	public String getRoundType() {
		return roundType;
	}
	
	public String getLocation() {
		return location;
	}
	
	public String getAssessorName() {
		return assessorName;
	}
	
	public void setRoundId(int roundId) {
		this.roundId = roundId;
	}
	
	public void setAppId(int appId) {
		this.appId = appId;
	}
	
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	
	public void setRoundType(String roundType) {
		this.roundType = roundType;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public void setAssessorName(String assessorName) {
		this.assessorName = assessorName;
	}
	
	@Override
	public String toString() {
		return "Assessment [roundId=" + roundId + ", appId=" + appId + ", companyId="
				+ companyId + ", userId=" + userId + ", dateTime=" + dateTime
				+ ", roundType" + roundType + ", location=" + location + ", assessorName"
				+ assessorName + "]";
	}

}
