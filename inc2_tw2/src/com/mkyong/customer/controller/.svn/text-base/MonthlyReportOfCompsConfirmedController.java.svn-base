package com.mkyong.customer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.db.MySQLAccess;

public class MonthlyReportOfCompsConfirmedController implements Controller {

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
			comps = o.readMonthlyReportsConfirmedByYearMonth(yearmonth);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String output = request.getParameter("output");
		if (output.equals("excel")) {
			HashMap mp = new HashMap();
			mp.put("yearmonth", yearmonth);
			mp.put("comps", comps);
			return new ModelAndView("MonthlyReportOfCompsConfirmedExcelController", "mp", mp);
		} else {
			return new ModelAndView("MonthlyReportOfCompsConfirmed", "comps", comps);
		}
	}

}