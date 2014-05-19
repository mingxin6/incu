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

public class QuarterlyReportOfCompsController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//
		String yearQuarter = request.getParameter("key");
		System.out.println("in QuarterlyReportOfComps ----yearQuarter=" + yearQuarter);
		
		request.setAttribute("yearQuarter", yearQuarter);
		//
		ArrayList comps = new ArrayList();
		MySQLAccess o = new MySQLAccess();
		try {
			comps = o.readMonthlyReportsByYearQuarter(yearQuarter);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		CalculateTotal.getTotal(comps);
		
		String output = request.getParameter("output");
		if (output.equals("excel")) {
			HashMap mp = new HashMap();
			mp.put("yearQuarter", yearQuarter);
			mp.put("comps", comps);
			return new ModelAndView("QuarterlyReportOfCompsConfirmedExcelController", "mp", mp);
		} else {
			return new ModelAndView("QuarterlyReportsOfAllComps", "comps", comps);
		}
		
		

//		return new ModelAndView("QuarterlyReportsOfAllComps", "comps", comps);
	}

}