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
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;
import com.model.MonthlyReport;
import com.utils.KeyMaker;

public class MonthlyReportTransferController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//
		String yearmonth = request.getParameter("xxx");
		System.out.println("in MonthlyReportTransferController ----yearmonth=" + yearmonth);
		//

		request.setAttribute("yearmonth", yearmonth);
		//
		ArrayList monthlyReports = new ArrayList();
		MySQLAccess o = new MySQLAccess();
		try {
			monthlyReports = o.readMonthlyReportsByYearMonth(yearmonth);
			
			
			for(int i=0;i<monthlyReports.size();i++){
				MonthlyReport monthlyReport =(MonthlyReport)monthlyReports.get(i);
				monthlyReport.uid=KeyMaker.newKey();
				o.insertConfirmedMonthlyReport(monthlyReport);
				
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView(new RedirectView("MonthlyReport.htm"));
		
		
//		return new ModelAndView("MonthlyReportsOfAllComps", "comps", comps);
	}

}