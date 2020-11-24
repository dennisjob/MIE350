package com.mie.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mie.dao.UserDao;
import com.mie.model.User;

public class RegistrationServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		User user = new User();
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		
		/**
		 * Checks if user's account information is already in the database. If
		 * not, the user is added to the database and logged in. If they are,
		 * the user is logged in normally.
		 */
		try {
			if (UserDao.login(user) == null) {
				UserDao.addUser(user);
			}
			user = UserDao.getUser(user.getName(), user.getPassword(), user.getEmail());
			
			/**
			 * Assign session attributes to the new user.
			 */
			HttpSession session = request.getSession(true);
			session.setAttribute("currentSessionUser", user);
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("name", user.getName());
			session.setAttribute("email", user.getEmail());
			/**
			 * Redirect to the members-only home page.
			 */
			response.sendRedirect("tracker.jsp");

			/**
			 * Set a timeout variable of 1500 seconds (25 minutes) for this
			 * member who has logged into the system.
			 */
			session.setMaxInactiveInterval(1500);
			
		} catch (Throwable ex) {
			/**
			 * Print out any errors.
			 */
			System.out.println(ex);
		}
		
	}

}
