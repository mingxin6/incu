package com.mkyong.customer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.model.MonthlyReport;
import com.model.User;
import com.utils.KeyMaker;

public class MyNewMonthlyReportController extends SimpleFormController {

	public MyNewMonthlyReportController() {
		setCommandClass(MonthlyReport.class);
		setCommandName("monthlyReport");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		MonthlyReport monthlyReport = (MonthlyReport) command;
		monthlyReport.uid = KeyMaker.newKey();
		monthlyReport.yearMonth=monthlyReport.year+"/"+monthlyReport.month;

//		System.out.println("MyNewMonthlyReportController nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
		
		MySQLAccess o = new MySQLAccess();
		try {
			o.insertMonthlyReport(monthlyReport); //!!!!!--------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}

		// return new ModelAndView(new RedirectView("compList.htm"));

		return new ModelAndView(getSuccessView(), "monthlyReport", monthlyReport);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		
		MonthlyReport monthlyReport = new MonthlyReport();
//		monthlyReport.compName=user.userComp;
//		monthlyReport.compId=user.compid;
		
		return monthlyReport;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {

		Map referenceData = new HashMap();

		referenceData.put("years", SelectYearMonth.getYears());
		referenceData.put("months", SelectYearMonth.getMonths());

		return referenceData;
	}
}