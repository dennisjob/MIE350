package com.mie.controller;

import java.io.IOException;
import java.text.ParseException;

import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mie.dao.AppDao;
import com.mie.model.Application;

public class AppServlet extends HttpServlet {
	/**
	 * This class handles all add/delete/update functions of the application servlet.
	 * 
	 * These are variables that lead to the appropriate JSP pages. INSERT leads
	 * to the Add A Student page. EDIT leads to the Edit A Student page.
	 * LIST_STUDENT_PUBLIC leads to the public listing of students.
	 * LIST_STUDENT_ADMIN leads to the admin-only listing of students (for them
	 * to modify student information).
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String TRACKER = "/tracker.jsp";
	

	private AppDao dao;

	/**
	 * Constructor for this class.
	 */
	public AppServlet() {
		super();
		dao = new AppDao();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		/**
		 * This class retrieves the appropriate 'action' found on the JSP pages:
		 * 
		 * - delete will direct the servlet to let the user delete a student in
		 * the database. - insert will direct the servlet to let the user add a
		 * new student to the database. - edit will direct the servlet to let
		 * the user edit student information in the database. - listStudent will
		 * direct the servlet to the public listing of all students in the
		 * database. - listStudentAdmin will direct the servlet to the admin
		 * listing of all students in the database.
		 */
		String forward = "";
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		int userId = Integer.parseInt((String) session.getAttribute("userId"));
		

		if (action.equalsIgnoreCase("DeleteApp")) {
			int appId = Integer.parseInt(request.getParameter("appId"));
			dao.deleteApplication(appId);
			
		} else if (action.equalsIgnoreCase("InsertApp")) {
			Application app = new Application();
			app.setAppId(Integer.parseInt(request.getParameter("appId")));
			app.setCompany((request.getParameter("company")));
			app.setUserId(userId);
			app.setUrl((request.getParameter("url")));
			String date = request.getParameter("date");
			Date date1 = Date.valueOf(date);
			app.setDeadline(date1);
			app.setInterview(Integer.parseInt(request.getParameter("interview")));
			app.setJob(Integer.parseInt(request.getParameter("joboffer")));
			app.setIndustry(request.getParameter("industry"));
			app.setPosition(request.getParameter("position"));
			
			dao.addApplication(app);
			
			
		} else if (action.equalsIgnoreCase("UpdateApp")) {
			Application app = new Application();
			app.setAppId(Integer.parseInt(request.getParameter("appId")));
			app.setCompany((request.getParameter("company")));
			app.setUserId(userId);
			app.setUrl((request.getParameter("url")));
			String date = request.getParameter("date");
			Date date1 = Date.valueOf(date);
			app.setDeadline(date1);
			app.setInterview(Integer.parseInt(request.getParameter("interview")));
			app.setJob(Integer.parseInt(request.getParameter("joboffer")));
			app.setIndustry(request.getParameter("industry"));
			app.setPosition(request.getParameter("position"));
			
			dao.updateApplication(app);}
			
			
		forward = TRACKER;
		request.setAttribute("applications", dao.getUserApps(userId));

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	
}
