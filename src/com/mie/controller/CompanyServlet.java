package com.mie.controller;

import java.io.IOException;
import java.text.ParseException;

import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mie.dao.CompDao;
import com.mie.model.Company;

public class CompanyServlet extends HttpServlet {
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
	

	private CompDao dao;

	/**
	 * Constructor for this class.
	 */
	public CompanyServlet() {
		super();
		dao = new CompDao();
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
		

		if (action.equalsIgnoreCase("DeleteCompany")) {
			int companyId = Integer.parseInt(request.getParameter("companyId"));
			dao.deleteCompany(companyId);
			
		} else if (action.equalsIgnoreCase("InsertCompany")) {
			Company comp = new Company();
			comp.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
			comp.setUserId(Integer.parseInt(request.getParameter("userId")));
			comp.setName(request.getParameter("name"));
			comp.setUrl(request.getParameter("url"));
			comp.setConnection(request.getParameter("connection"));
			
			dao.addCompany(comp);
			
			
		} else if (action.equalsIgnoreCase("UpdateCompany")) {
			Company comp = new Company();
			comp.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
			comp.setUserId(Integer.parseInt(request.getParameter("userId")));
			comp.setName(request.getParameter("name"));
			comp.setUrl(request.getParameter("url"));
			comp.setConnection(request.getParameter("connection"));
			
			dao.updateCompany(comp);}
			
			
		forward = TRACKER;
		request.setAttribute("companies", dao.getUserCompanies(userId));

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	
}