package com.mie.model;

import java.sql.Timestamp;

public class Post {
	
	private int postId;
	private int groupId;
	private int authorId;
	private Timestamp postTime;
	private String content;
	private String url;
	
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
	
	public int getGroupId() {
		return groupId;
	}
	
	public int getAuthorId() {
		return authorId;
	}
	
	public Timestamp getPostedTime() {
		return postTime;
	}
	
	public String getContent() {
		return content;
	}
	
	public String getUrl() {
		return url;
	}
	
	@Override
	public String toString() {
		return "Post [postId=" + postId + ", groupId=" + groupId
				+ ", authorId=" + authorId + ", postTime=" + postTime
				+ ", content=" + content + ", url=" + url + "]";
	}

}
