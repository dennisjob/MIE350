package com.mie.controller;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mie.dao.GroupDao;
import com.mie.dao.PostDao;
import com.mie.model.Group;
import com.mie.model.Post;

public class GroupServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		GroupDao dao = new GroupDao();
		
		String forward = "/GroupsBlank.jsp";
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		int userId = Integer.parseInt((String) session.getAttribute("userId"));

		if (action.equalsIgnoreCase("create")) {
			
			Group group = new Group();
			group.setAccessCode(createAccessCode());
			group.setName(request.getParameter("name"));
			group.setNumMembers(0);
			dao.addGroup(group, userId);
			
		} else if (action.equalsIgnoreCase("delete")) {
			
			dao.deleteGroup(Integer.parseInt((String)request.getParameter("groupId")));
			
		} else if (action.equalsIgnoreCase("addMember")) {
			
			int groupId = Integer.parseInt((String)request.getParameter("groupId"));
			Group group = dao.getGroupById(groupId);
			dao.addUserToGroup(group, userId);
			
		} else if (action.equalsIgnoreCase("listPosts")) {
			
			int groupId = Integer.parseInt((String)request.getParameter("groupId"));
			PostDao postDao = new PostDao();
			List<Post> groupPosts = postDao.getGroupPosts(groupId);
			request.setAttribute("posts", groupPosts);
			forward = "/Group" + groupId + ".jsp";
			
		}
		
		List<Group> userGroups = dao.getUsersGroups(userId);
		request.setAttribute("groups", userGroups);
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
	}
	
	public int createAccessCode() {
		GroupDao dao = new GroupDao();
		boolean exists = true;
		int code = 0;
		
		do {
			code = (int)(Math.random() * (2147483647 + 1)); // 2147483647 is the max. value for a Long Integer in MS Access
			exists = dao.accessCodeExists(code);
		} while (exists);
		
		return code;
	}

}
