package com.mie.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Timestamp;


import java.util.List;

import com.mie.model.*;
import com.mie.dao.*;

public class PostServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static String POSTS = "GroupPosts.jsp";
	
	private PostDao dao;
	
	public PostServlet() {
		super();
		dao = new PostDao();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		
		String forward = "";
		String action = request.getParameter("action");
		String error = "none";
		
		// start session
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		if (action.equalsIgnoreCase("delete")) {
			try {
				int groupId = Integer.parseInt(request.getParameter("groupId"));
				int postId = Integer.parseInt(request.getParameter("postId"));
				dao.deletePost(postId);
				forward = POSTS; //ask kyle for the name of the page 
				request.setAttribute("posts", dao.getGroupPosts(groupId));
				GroupDao groupDao = new GroupDao();
				Group group = groupDao.getGroupById(groupId);
				request.setAttribute("curGroup", group);
			} catch (Exception e) {
				error = "Failed to delete the post.";
			}
			
		} else if (action.equalsIgnoreCase("create")) {
			try {
				Post post = new Post();
				int groupId = Integer.parseInt(request.getParameter("groupId"));
				post.setGroupId(groupId);
				post.setAuthorId(userId);
				Date date = new Date();
				post.setPostedTime(new java.sql.Timestamp(date.getTime()));
				post.setContent(request.getParameter("content"));
				post.setUrl(request.getParameter("url"));
				dao.addPost(post);
				forward = POSTS; //ask kyle for the name of the page
				request.setAttribute("posts", dao.getGroupPosts(groupId));
				GroupDao groupDao = new GroupDao();
				Group group = groupDao.getGroupById(groupId);
				request.setAttribute("curGroup", group);
			} catch (Exception e) {
				error = "Failed to create the post. Please ensure that all values entered are valid.";
			}
			
		} 
		UserDao userDao = new UserDao();
		User user = userDao.getUserById(userId);
		
		session.setAttribute("currentSessionUser", user);
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("name", user.getName());
		session.setAttribute("email", user.getEmail());
		request.setAttribute("currentSessionUser", user);
		request.setAttribute("userId", user.getUserId());
		request.setAttribute("name", user.getName());
		request.setAttribute("email", user.getEmail());

		GroupDao groupdao = new GroupDao();
		
		List<Group> userGroups = groupdao.getUsersGroups(userId);
		//System.out.println(userGroups);
		request.setAttribute("groups", userGroups);
		request.setAttribute("error", error);
		
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
		
	}
	
	

}
