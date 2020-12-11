package com.mie.controller;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mie.dao.GroupDao;
import com.mie.dao.PostDao;
import com.mie.dao.UserDao;
import com.mie.model.Group;
import com.mie.model.Post;
import com.mie.model.User;

public class GroupServlet extends HttpServlet {
	
	private UserDao userDao = new UserDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		GroupDao dao = new GroupDao();
		String forward = "GroupsBlank.jsp";
		String error = "none";
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");

		if (action!=null) {
			if (action.equalsIgnoreCase("create")) {
				try {
					Group group = new Group();
					group.setAccessCode(createAccessCode());
					group.setName(request.getParameter("name"));
					group.setNumMembers(0);
					System.out.println("userId"+userId);
					dao.addGroup(group, userId);
				} catch (Exception e) {
					error = "Failed to create group. Please ensure that group name entered was a valid value";
				}
				
			} else if (action.equalsIgnoreCase("delete")) {
				try {
					System.out.println("deleting" + Integer.parseInt((String)request.getParameter("groupId")));
					dao.deleteGroup(Integer.parseInt((String)request.getParameter("groupId")));
				} catch (Exception e) {
					error = "Failed to delete the group.";
				}
				
			} else if (action.equalsIgnoreCase("addMember")) {
				try {
					// need to use access code
					int groupId = Integer.parseInt((String)request.getParameter("groupId"));
					Group group = dao.getGroupById(groupId);
					dao.addUserToGroup(group, userId);
				} catch (Exception e) {
					error = "Could not add you to the group. Please check the access code";
				}
				
			} else if (action.equalsIgnoreCase("listPosts")) {
				try {
					int groupId = Integer.parseInt((String)request.getParameter("groupId"));
					PostDao postDao = new PostDao();
					GroupDao groupDao = new GroupDao();
					List<Post> groupPosts = postDao.getGroupPosts(groupId);
					//System.out.println(groupPosts);
					Group group = groupDao.getGroupById(groupId);
					request.setAttribute("posts", groupPosts);
					request.setAttribute("curGroup", group);
					forward = "GroupPosts.jsp";
				} catch (Exception e) {
					error = "Failed to retrieve posts for this page.";
				}
				
			}	
		}
		
		User user = userDao.getUserById(userId);
		
		session.setAttribute("currentSessionUser", user);
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("name", user.getName());
		session.setAttribute("email", user.getEmail());
		request.setAttribute("currentSessionUser", user);
		request.setAttribute("userId", user.getUserId());
		request.setAttribute("name", user.getName());
		request.setAttribute("email", user.getEmail());

		
		List<Group> userGroups = dao.getUsersGroups(userId);
		//System.out.println(userGroups);
		request.setAttribute("groups", userGroups);
		request.setAttribute("error", error);
		
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
