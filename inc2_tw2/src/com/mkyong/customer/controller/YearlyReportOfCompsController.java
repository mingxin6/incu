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

public class YearlyReportOfCompsController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//
		String year = request.getParameter("key");
		System.out.println("in YearlyReportOfComps ----year=" + year);
		//

		request.setAttribute("year", year);
		//
		ArrayList comps = new ArrayList();
		MySQLAccess o = new MySQLAccess();
		try {
			comps = o.readMonthlyReportsByYear(year);
		} catch (Exception e) {
			e.printStackTrace();
		}

		CalculateTotal.getTotal(comps);
		
		String output = request.getParameter("output");
		if (output.equals("excel")) {
			HashMap mp = new HashMap();
			mp.put("year", year);
			mp.put("comps", comps);
			return new ModelAndView("YearlyReportOfCompsConfirmedExcelController", "mp", mp);
		} else {
			return new ModelAndView("YearlyReportsOfAllComps", "comps", comps);
		}
		
	
	}

	

}