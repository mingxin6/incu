package com.mkyong.customer.controller;

import java.io.IOException;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.db.MySQLAccess;
import com.vo.VOMonthlyReportCondition;

public class QuarterlyReportController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		// User user = (User) session.getAttribute("user");

		VOMonthlyReportCondition voMonthlyReportCondition = (VOMonthlyReportCondition) session
				.getAttribute("voMonthlyReportCondition");
		
		
//		System.out.println("in QuarterlyReportController ---->>>>> "+voMonthlyReportCondition);

		//
		TreeMap mp = new TreeMap();
		MySQLAccess o = new MySQLAccess();
		try {
			mp = o.readAggregateQuarterlyReports(voMonthlyReportCondition);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("myHistoryQuarterlyAggregatedForm", "quarterlyreportlist", mp);
	}

}