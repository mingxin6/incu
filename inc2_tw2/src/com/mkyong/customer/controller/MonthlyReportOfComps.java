package com.mkyong.customer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.db.MySQLAccess;

public class MonthlyReportOfComps implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//
		String yearmonth = request.getParameter("key");
		System.out.println("in MonthlyReportOfComps ----yearmonth=" + yearmonth);
		//

		request.setAttribute("yearmonth", yearmonth);
		//
		ArrayList comps = new ArrayList();
		MySQLAccess o = new MySQLAccess();
		try {
			comps = o.readMonthlyReportsByYearMonth(yearmonth);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("MonthlyReportsOfAllComps", "comps", comps);
	}

}