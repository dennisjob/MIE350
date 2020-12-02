package com.mie.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mie.dao.UserDao;
import com.mie.model.User;

public class LoginServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		/**
		 * Retrieve the entered email and password.
		 */
		User user = new User();
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));

		try {
			/**
			 * Try to see if the user can log in.
			 */
			user = UserDao.login(user);

			/**
			 * If the user exists in the database, assign session attributes to
			 * the current user.
			 */
			if (user != null) {
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", user);
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("name", user.getName());
				session.setAttribute("email", user.getEmail());
				request.setAttribute("currentSessionUser", user);
				request.setAttribute("userId", user.getUserId());
				request.setAttribute("name", user.getName());
				request.setAttribute("email", user.getEmail());
				
				RequestDispatcher rd=request.getRequestDispatcher("tracker");
				rd.forward(request, response);
				/**
				 * Redirect to the logged-in home page.
				 */
//				response.sendRedirect("tracker.jsp");

				/**
				 * Set a timeout variable of 1500 seconds (25 minutes) for this
				 * member who has logged into the system.
				 */
//				session.setMaxInactiveInterval(1500);
			} else {
				/**
				 * Forwards information to the front end that the login was invalid.
				 */
				String inv = "invalid";
				request.setAttribute("validLogin", inv);
				RequestDispatcher view = request.getRequestDispatcher("landing.jsp");
//				request.setAttribute("validLogin", false);
				view.forward(request, response);
			}
		} catch (Throwable theException) {
			/**
			 * Print out any errors.
			 */
			System.out.println(theException);
		}
	}

}
