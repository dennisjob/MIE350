package com.mie.model;

import java.util.ArrayList;
import java.util.Arrays;

public class Group {
	
	private int groupId;
	private String name;
	private String accessCode;
	private ArrayList<String> membersList;
	
	public Group(int groupId, String name, String accessCode, String members) {
		this.groupId = groupId;
		this.name = name;
		this.accessCode = accessCode;
		membersList = new ArrayList<String>(Arrays.asList(members.split(",")));
	}
	
	public int getGroupId() {
		return groupId;
	}
	
	public String getName() {
		return name;
	}
	
	public String getAccessCode() {
		return accessCode;
	}
	
	public ArrayList<String> getMembersList() {
		return membersList;
	}
	
	@Override
	public String toString() {
		return "Group [groupId=" + groupId + ", name=" + name
				+ ", accessCode=" + accessCode + ", membersList=" + membersList + "]";
	}

}
