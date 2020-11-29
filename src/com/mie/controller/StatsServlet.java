package com.mie.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mie.dao.AppDao;

public class StatsServlet {
	
	final int N = 5; // Number of items that the front-end team wants to display
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		AppDao dao = new AppDao();
		
		HashMap<String, Integer> compMap = dao.getGroupedAppCounts("CompName");
		Pair compPair = topFive(compMap);
		request.setAttribute("companies", compPair.strArr);
		request.setAttribute("compCounts", compPair.countArr);
		
		HashMap<String, Integer> industryMap = dao.getGroupedAppCounts("Industry");
		Pair industryPair = topFive(industryMap);
		request.setAttribute("industries", industryPair.strArr);
		request.setAttribute("industryCounts", industryPair.countArr);
	}
	
	public Pair topFive(HashMap<String, Integer> map) {
		String[] strArr = new String[N];
		int[] countArr = new int[N];
		
		for (int i=0; i<N; i++) {
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

}

/**
 * Encapsulates Arrays being returned into class Pair.
 */
class Pair {
	
	String[] strArr;
	int[] countArr;
	
	Pair(String[] strArr, int[] countArr) {
		this.strArr = strArr;
		this.countArr = countArr;
	}
}