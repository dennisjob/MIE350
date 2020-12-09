package com.mie.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mie.dao.AppDao;
import com.mie.dao.CompDao;
import com.mie.dao.RoundDao;
import com.mie.dao.UserDao;
import com.mie.model.Application;
import com.mie.model.Round;
import com.mie.model.User;

public class StatsServlet extends HttpServlet {
	
	private AppDao appDao;
	private RoundDao roundDao;
	private CompDao compDao;
	private UserDao userDao;
	final int N = 5; // Number of items that the front-end team wants to display
	final int M = 3; // Number of upcoming deadlines that the front-end team wants to display
	
	public StatsServlet() {
		appDao = new AppDao();
		roundDao = new RoundDao();
		compDao = new CompDao();
		userDao = new UserDao();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		DateFormat tsform = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		DateFormat dform = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date obj = new java.util.Date();
		Date currDate = Date.valueOf(dform.format(obj));
		Timestamp currTimestamp = Timestamp.valueOf(tsform.format(obj));
		
		// Top 5 Companies by Application Volume table
		HashMap<String, Integer> compMap = appDao.getGroupedAppCounts("CompName", userId);
		Pair compPair = topFive(compMap);
		request.setAttribute("companies", Arrays.toString(compPair.strArr));
		request.setAttribute("compCounts", Arrays.toString(compPair.countArr));
		
		// Top 5 Industries by Application Volume table
		HashMap<String, Integer> industryByAppsMap = appDao.getGroupedAppCounts("Industry", userId);
		Pair industryByAppsPair = topFive(industryByAppsMap);
		request.setAttribute("industriesByApps", Arrays.toString(industryByAppsPair.strArr));
		request.setAttribute("industryByAppCounts", Arrays.toString(industryByAppsPair.countArr));
		
		// Top 5 Industries by Interview table
		HashMap<String, Integer> industryByIntersMap = appDao.getGroupedInterviewCounts("Industry", userId);
		Pair industryByIntersPair = topFive(industryByIntersMap);
		request.setAttribute("industriesByInters", Arrays.toString(industryByIntersPair.strArr));
		request.setAttribute("industryByInterCounts", Arrays.toString(industryByIntersPair.countArr));
		
		// Upcoming Application Deadlines (only shows first 3 earliest deadlines from current day) and Counts
		List<Application> userApps = appDao.getUserAppsByDate(userId, currDate);
		request.setAttribute("upcomingAppsNum", userApps.size());
		request.setAttribute("pastAppsNum", appDao.getUserApps(userId).size() - userApps.size());
		Pair upcomingApps = upcomingThreeApps(userApps);
		request.setAttribute("upcomingApps", upcomingApps.strArr);
		request.setAttribute("upcomingAppDeadlines", upcomingApps.dateArr);
		
		// Upcoming Assessment (only shows first 3 earliest deadlines from current day) and Counts
		HashMap<String, Timestamp> userRounds = roundDao.getUsersRoundsByDate(userId, currTimestamp);
		request.setAttribute("upcomingAssNum", userRounds.size());
		request.setAttribute("pastAssNum", roundDao.getUsersRounds(userId).size() - userRounds.size());
		Pair upcomingRounds = upcomingThreeRounds(userRounds);
		request.setAttribute("upcomingAss", upcomingRounds.strArr); // TODO: Bushi I swear if you change this we're not friends.
		request.setAttribute("upcomingAssDeadlines", upcomingRounds.timestampArr);
		
		// Number of Tracked Companies
		request.setAttribute("compsNum", compDao.getUserCompanies(userId).size());
		
		// Conversion Rate (offers divided by applications)
		request.setAttribute("conversionRate", ((float) appDao.getUserOfferCount(userId) / appDao.getUserApps(userId).size()) * 100);
	
		User user = userDao.getUserById(userId);
		
		session.setAttribute("currentSessionUser", user);
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("name", user.getName());
		session.setAttribute("email", user.getEmail());
		request.setAttribute("currentSessionUser", user);
		request.setAttribute("userId", user.getUserId());
		request.setAttribute("name", user.getName());
		request.setAttribute("email", user.getEmail());
		
		RequestDispatcher view = request.getRequestDispatcher("dashboard.jsp");
		view.forward(request, response);
	}
	
	public Pair topFive(HashMap<String, Integer> map) {
		int n = map.size() > N ? N : map.size(); // returns 5 or less data points
		String[] strArr = new String[n];
		int[] countArr = new int[n];
		
		for (int i=0; i<n; i++) {
			Map.Entry<String, Integer> max = null;
			for (Map.Entry<String, Integer> j : map.entrySet()) {
			    if (max == null || j.getValue() > max.getValue()) {
			    	max = j;
			    }
			}
			strArr[i] = max.getKey();
			countArr[i] = max.getValue();
			map.remove(max.getKey());
		}
		return new Pair(strArr, countArr);
	}
	
	public Pair upcomingThreeApps(List<Application> apps) {
		int m = apps.size() > M ? M : apps.size(); // returns 3 or less applications
		ArrayList<String> strArr = new ArrayList<String>();
		ArrayList<Date> dateArr = new ArrayList<Date>();
		
		for (int i=0;i<m;i++) {
			Application earliestApp = null;
			for (Application j : apps) {
				Date date = j.getDeadline();
				if (earliestApp == null) {
					earliestApp = j;
				} else if (earliestApp.getDeadline().compareTo(date) > 0) {
					earliestApp = j;
				}
			}
			if (earliestApp == null) {
				return new Pair(strArr.toArray(new String[strArr.size()]), dateArr.toArray(new Date[dateArr.size()]));
			}
			strArr.add(earliestApp.getPosition() + " at " + earliestApp.getCompany());
			dateArr.add(earliestApp.getDeadline());
			apps.remove(earliestApp);
			
		}
		return new Pair(strArr.toArray(new String[strArr.size()]), dateArr.toArray(new Date[dateArr.size()]));
	}
	
	public Pair upcomingThreeRounds(HashMap<String, Timestamp> rounds) {
		int m = rounds.size() > M ? M : rounds.size(); // returns 3 or less applications
		ArrayList<String> strArr = new ArrayList<String>();
		ArrayList<Timestamp> timestampArr = new ArrayList<Timestamp>();
		
		for (int i=0;i<m;i++) {
			String earliestRound = null;
			for (String j : rounds.keySet()) {
				Timestamp timestamp = rounds.get(j);
				if (earliestRound == null) {
					earliestRound = j;
				} else if (rounds.get(earliestRound).compareTo(timestamp) > 0) {
					earliestRound = j;
				}
			}
			if (earliestRound == null) {
				return new Pair(strArr.toArray(new String[strArr.size()]), timestampArr.toArray(new Date[timestampArr.size()]));
			}
			strArr.add(earliestRound);
			timestampArr.add(rounds.get(earliestRound));
			rounds.remove(earliestRound);
			
		}
		return new Pair(strArr.toArray(new String[strArr.size()]), timestampArr.toArray(new Date[timestampArr.size()]));
	}

}

/**
 * Encapsulates Arrays being returned into class Pair.
 */
class Pair {
	
	String[] strArr;
	int[] countArr;
	Date[] dateArr;
	Timestamp[] timestampArr;
	
	Pair(String[] strArr, int[] countArr) {
		this.strArr = strArr;
		this.countArr = countArr;
	}
	
	Pair(String[] strArr, Date[] dateArr) {
		this.strArr = strArr;
		this.dateArr = dateArr;
	}
	
	Pair(String[] strArr, Timestamp[] timestampArr) {
		this.strArr = strArr;
		this.timestampArr = timestampArr;
	}
	
}