package com.mie.model;

public class Group {
	
	private int groupId;
	private String name;
	private int accessCode;
	private int numMembers;
	
	public Group() { }
	
	public Group(String name, int accessCode, int numMembers) {
		this.name = name;
		this.accessCode = accessCode;
		this.numMembers = numMembers;
	}
	
	public int getGroupId() {
		return groupId;
	}
	
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAccessCode() {
		return accessCode;
	}
	
	public void setAccessCode(int accessCode) {
		this.accessCode = accessCode;
	}
	
	public int getNumMembers() {
		return numMembers;
	}
	
	public void setNumMembers(int numMembers) {
		this.numMembers = numMembers;
	}
	
	@Override
	public String toString() {
		return "Group [groupId=" + groupId + ", name=" + name
				+ ", accessCode=" + accessCode + ", numMembers=" + numMembers + "]";
	}

}
