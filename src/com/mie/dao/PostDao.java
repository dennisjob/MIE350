package com.mie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mie.model.Post;
import com.mie.model.User;
import com.mie.util.DbUtil;
import java.sql.Timestamp;

public class PostDao {
	private Connection connection;

	public PostDao() {
		connection = DbUtil.getConnection();
	}
	
	public void addPost(Post post) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into Posts(PostID,PostTime,UserID,GroupID,PostContent,LinkToPost) values (?, ?, ?, ?, ?, ?)");
			preparedStatement.setInt(1, post.getPostId());
			preparedStatement.setTimestamp(2, post.getPostedTime());
			preparedStatement.setInt(3, post.getGroupId());
			preparedStatement.setInt(4, post.getAuthorId());
			preparedStatement.setString(5, post.getContent());
			preparedStatement.setString(6, post.getUrl());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deletePost(int postId) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from Posts where PostID = ?");
			preparedStatement.setInt(1, postId);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updatePost(Post post) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("update Posts set PostTime=?, UserId=?, GroupID=?, PostContent=?, LinkToPost=?"
							+ " where PostID=?");
			preparedStatement.setTimestamp(1, post.getPostedTime());
			preparedStatement.setInt(2, post.getAuthorId());
			preparedStatement.setInt(3, post.getGroupId());
			preparedStatement.setString(4, post.getContent());
			preparedStatement.setString(5, post.getUrl());
			preparedStatement.setInt(6, post.getPostId());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Post> getAllPosts() {
		List<Post> posts = new ArrayList<Post>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from Posts");
			while (rs.next()) {
				Post post = new Post();
				post.setPostId(rs.getInt("PostID"));
				post.setAuthorId(rs.getInt("UserID"));
				post.setGroupId(rs.getInt("GroupID"));
				post.setPostedTime(rs.getTimestamp("PostTime"));
				post.setContent(rs.getString("PostContent"));
				post.setUrl(rs.getString("LinkToPost"));
				posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return posts;
	}
	
	public List<Post> getGroupPosts(Integer groupId) {
		List<Post> posts = new ArrayList<Post>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from Posts where GroupID=" + groupId);
			while (rs.next()) {
				Post post = new Post();
				post.setPostId(rs.getInt("PostID"));
				post.setAuthorId(rs.getInt("UserID"));
				post.setGroupId(rs.getInt("GroupID"));
				post.setPostedTime(rs.getTimestamp("PostTime"));
				post.setContent(rs.getString("PostContent"));
				post.setUrl(rs.getString("LinkToPost"));
				posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return posts;
	}
	
	public List<Post> getUserPosts(Integer userId) {
		List<Post> posts = new ArrayList<Post>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from Posts where UserID=" + userId);
			while (rs.next()) {
				Post post = new Post();
				post.setPostId(rs.getInt("PostID"));
				post.setAuthorId(rs.getInt("UserID"));
				post.setGroupId(rs.getInt("GroupID"));
				post.setPostedTime(rs.getTimestamp("PostTime"));
				post.setContent(rs.getString("PostContent"));
				post.setUrl(rs.getString("LinkToPost"));
				posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return posts;
	}
		
	public Post getPost(Integer authorId, Timestamp postTime, String content, String url) {
		Post post = new Post();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Posts where UserID=? and PostTime=? and PostContent=? and LinkToPost=?");
			preparedStatement.setInt(1, authorId);
			preparedStatement.setTimestamp(2, postTime);
			preparedStatement.setString(3, content);
			preparedStatement.setString(4, url);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				post.setPostId(rs.getInt("PostID"));
				post.setAuthorId(rs.getInt("UserID"));
				post.setPostedTime(rs.getTimestamp("PostTime"));
				post.setContent(rs.getString("PostContent"));
				post.setUrl(rs.getString("LinkToPost"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return post;
	}
	
	public Post getPostById(int postId) {
		Post post = new Post();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Posts where PostID=?");
			preparedStatement.setInt(1, postId);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				post.setPostId(rs.getInt("PostID"));
				post.setAuthorId(rs.getInt("UserID"));
				post.setPostedTime(rs.getTimestamp("Postime"));
				post.setContent(rs.getString("PostContent"));
				post.setUrl(rs.getString("LinkToPost"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return post;
	}
	
	public boolean postIdExists(int postId) {
		boolean exists = false;
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from Posts where PostID=?");
			preparedStatement.setInt(1, postId);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				exists = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return exists;
	}
	
	
	

}
