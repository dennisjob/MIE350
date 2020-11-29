package com.mie.controller;

import java.io.IOException;

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
	private static String POSTS = "/groups.jsp?group_id=";
	
	private PostDao dao;
	
	public PostServlet() {
		super();
		dao = new PostDao();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		
		String forward = "";
		String action = request.getParameter("action");
		
		// start session
		HttpSession session = request.getSession();
		int postId = Integer.parseInt((String) session.getAttribute("postId"));
		
		if (action.equalsIgnoreCase("delete")) {
			dao.deletePost(postId);
			forward = POSTS; //ask kyle for the name of the page 
			request.setAttribute("posts", dao.getAllPosts());
			
		} else if (action.equalsIgnoreCase("create")) {
			Post post = new Post();
			
			post.setGroupId(Integer.parseInt(request.getParameter("groupId")));
			post.setAuthorId(Integer.parseInt(request.getParameter("authorId")));
			post.setPostedTime(Timestamp.valueOf(request.getParameter("postedTime")));
			post.setContent(request.getParameter("content"));
			post.setUrl(request.getParameter("url"));
			dao.addPost(post);
			forward = POSTS; //ask kyle for the name of the page
			request.setAttribute("posts", dao.getAllPosts());
			
		} 
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
		
	}
	
	

}
