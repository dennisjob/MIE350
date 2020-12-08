package com.mie.model;

import java.sql.Timestamp;

import com.mie.dao.UserDao;

public class Post {
	
	private int postId;
	private int groupId;
	private int authorId;
	private Timestamp postTime;
	private String content;
	private String url;
	
	public Post() { }
	
	public Post(int postId, int groupId, int authorId, Timestamp postTime, String content, String url) {
		this.postId = postId;
		this.groupId = groupId;
		this.authorId = authorId;
		this.postTime = postTime;
		this.content = content;
		this.url = url;
	}
	
	public int getPostId() {
		return postId;
	}
	
	public void setPostId(int postId) {
		this.postId = postId;
	}
	
	public int getGroupId() {
		return groupId;
	}
	
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	
	public int getAuthorId() {
		return authorId;
	}
	
	public void setAuthorId (int authorId) {
		this.authorId = authorId;
	}
	
	public String getAuthorName() {
		UserDao dao = new UserDao();
		User user = dao.getUserById(this.authorId);
		//System.out.println(user.getName());
		return user.getName();
	}
	
	public Timestamp getPostedTime() {
		return postTime;
	}
	
	public void setPostedTime (Timestamp postTime) {
		this.postTime = postTime;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent (String content) {
		this.content = content;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Override
	public String toString() {
		return "Post [postId=" + postId + ", groupId=" + groupId
				+ ", authorId=" + authorId + ", postTime=" + postTime
				+ ", content=" + content + ", url=" + url + "]";
	}

}
