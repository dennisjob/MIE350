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

import com.mie.dao.RoundDao;
import com.mie.model.Round;

public class RoundServlet extends HttpServlet {
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
	

	private RoundDao dao;

	/**
	 * Constructor for this class.
	 */
	public RoundServlet() {
		super();
		dao = new RoundDao();
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
		

		if (action.equalsIgnoreCase("DeleteRound")) {
			int roundId = Integer.parseInt(request.getParameter("roundId"));
			dao.deleteRound(roundId);
			
		} else if (action.equalsIgnoreCase("InsertRound")) {
			Round round = new Round();
			round.setRoundId(Integer.parseInt(request.getParameter("roundId")));
			round.setAppId(Integer.parseInt(request.getParameter("appId")));
			round.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
			round.setUserId(Integer.parseInt(request.getParameter("userId")));
			String time = request.getParameter("time");
			Timestamp date = Timestamp.valueOf(time);
			round.setRoundType(request.getParameter("roundtype"));
			round.setLocation(request.getParameter("location"));
			round.setAssessorName(request.getParameter("assessor"));
			
			dao.addRound(round);
			
			
		} else if (action.equalsIgnoreCase("UpdateRound")) {
			Round round = new Round();
			round.setRoundId(Integer.parseInt(request.getParameter("roundId")));
			round.setAppId(Integer.parseInt(request.getParameter("appId")));
			round.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
			round.setUserId(Integer.parseInt(request.getParameter("userId")));
			String time = request.getParameter("time");
			Timestamp date = Timestamp.valueOf(time);
			round.setRoundType(request.getParameter("roundtype"));
			round.setLocation(request.getParameter("location"));
			round.setAssessorName(request.getParameter("assessor"));
			
			dao.updateRound(round);}
			
			
		forward = TRACKER;
		request.setAttribute("rounds", dao.getUsersRounds(userId));

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	
}
