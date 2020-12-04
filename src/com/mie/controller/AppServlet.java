package com.mie.controller;

import java.io.IOException;
import java.text.ParseException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mie.dao.AppDao;
import com.mie.dao.CompDao;
import com.mie.dao.RoundDao;
import com.mie.model.Application;
import com.mie.model.Company;
import com.mie.model.Round;
import com.mie.dao.UserDao;
import com.mie.model.User;

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
	private static String TRACKER = "tracker.jsp";
	

	private AppDao appdao;
	private CompDao compdao;
	private RoundDao rounddao;
	private UserDao userDao;

	/**
	 * Constructor for this class.
	 */
	public AppServlet() {
		super();
		appdao = new AppDao();
		compdao = new CompDao();
		rounddao = new RoundDao();
		userDao = new UserDao();
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
		System.out.println(action);
		HttpSession session = request.getSession();
//		int userId = Integer.parseInt((String) session.getAttribute("userId"));
		int userId = (Integer) session.getAttribute("userId");
//		try {
//			userId = (Integer) request.getAttribute("userId");
//		} catch (Exception e) {
//			userId = (Integer) session.getAttribute("userId");
//		}
		
		
		if (action!=null) {
			if (action.equalsIgnoreCase("DeleteApp")) {
				int appId = Integer.parseInt(request.getParameter("appId"));
				appdao.deleteApplication(appId);
				
			} else if (action.equalsIgnoreCase("InsertApp")) {
				System.out.println("Inserting App for user" + userId);
				Application app = new Application();
				//app.setAppId(Integer.parseInt(request.getParameter("appId")));
				app.setCompany((request.getParameter("company")));
				app.setUserId(userId);
				app.setUrl((request.getParameter("url")));
				String date = request.getParameter("date");
				Date date1 = Date.valueOf(date);
				app.setDeadline(date1);
				try {
					app.setInterview(Integer.parseInt(request.getParameter("interview")));
				} catch (Exception e) {
					app.setInterview(0);
				}
				try {
					app.setJob(Integer.parseInt(request.getParameter("joboffer")));
				} catch (Exception e) {
					app.setJob(0);
				}
				app.setIndustry(request.getParameter("industry"));
				app.setPosition(request.getParameter("position"));
				
				appdao.addApplication(app);
				
			} else if (action.equalsIgnoreCase("UpdateApp")) {
				Application app = new Application();
				app.setAppId(Integer.parseInt(request.getParameter("appId")));
				app.setCompany((request.getParameter("company")));
				app.setUserId(userId);
				app.setUrl((request.getParameter("url")));
				String date = request.getParameter("date");
				Date date1 = Date.valueOf(date);
				app.setDeadline(date1);
				try {
					app.setInterview(Integer.parseInt(request.getParameter("interview")));
				} catch (Exception e) {
					app.setInterview(0);
				}
				try {
					app.setJob(Integer.parseInt(request.getParameter("joboffer")));
				} catch (Exception e) {
					app.setJob(0);
				}
				app.setIndustry(request.getParameter("industry"));
				app.setPosition(request.getParameter("position"));
				
				appdao.updateApplication(app);
				
			} else if (action.equalsIgnoreCase("DeleteCompany")) {
				int companyId = Integer.parseInt(request.getParameter("companyId"));
				compdao.deleteCompany(companyId);
				
			} else if (action.equalsIgnoreCase("InsertCompany")) {
				Company comp = new Company();
				//comp.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
				comp.setUserId(userId);
				comp.setName(request.getParameter("name"));
				comp.setUrl(request.getParameter("url"));
				comp.setConnection(request.getParameter("connection"));
				
				compdao.addCompany(comp);
				
				
			} else if (action.equalsIgnoreCase("UpdateCompany")) {
				Company comp = new Company();
				comp.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
				comp.setUserId(userId);
				comp.setName(request.getParameter("name"));
				comp.setUrl(request.getParameter("url"));
				comp.setConnection(request.getParameter("connection"));
				
				compdao.updateCompany(comp);
				
			} else if (action.equalsIgnoreCase("DeleteRound")) {
				int roundId = Integer.parseInt(request.getParameter("roundId"));
				rounddao.deleteRound(roundId);
				
			} else if (action.equalsIgnoreCase("InsertRound")) {
				Round round = new Round();
				//round.setRoundId(Integer.parseInt(request.getParameter("roundId")));
				round.setAppId(Integer.parseInt(request.getParameter("appId")));
				round.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
				round.setUserId(userId);
				String time = request.getParameter("time");
				Timestamp date = Timestamp.valueOf(time);
				round.setDateTime(date);
				round.setRoundType(request.getParameter("roundtype"));
				round.setLocation(request.getParameter("location"));
				round.setAssessorName(request.getParameter("assessor"));
				
				rounddao.addRound(round);
				
				
			} else if (action.equalsIgnoreCase("UpdateRound")) {
				Round round = new Round();
				round.setRoundId(Integer.parseInt(request.getParameter("roundId")));
				round.setAppId(Integer.parseInt(request.getParameter("appId")));
				round.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
				round.setUserId(userId);
				String time = request.getParameter("time");
				Timestamp date = Timestamp.valueOf(time);
				round.setDateTime(date);
				round.setRoundType(request.getParameter("roundtype"));
				round.setLocation(request.getParameter("location"));
				round.setAssessorName(request.getParameter("assessor"));
				
				rounddao.updateRound(round);}
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
		
		forward = TRACKER;
		request.setAttribute("applications", appdao.getUserApps(userId));
		request.setAttribute("companies", compdao.getUserCompanies(userId));
		request.setAttribute("assessments", rounddao.getUsersRounds(userId));

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	
}
