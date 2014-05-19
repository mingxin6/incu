package com.mkyong.customer.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.model.User;
import com.utils.DateUtil;
import com.vo.VOQuarterlyReportCondition;

public class QuarterlyReportConfirmedController extends SimpleFormController {

	public QuarterlyReportConfirmedController() {
		setCommandClass(VOQuarterlyReportCondition.class);
		setCommandName("voQuarterlyReportCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		String output = request.getParameter("output");
		 System.out.println("in QuarterlyReportConfirmedController output===="+output);
				 
		VOQuarterlyReportCondition voQuarterlyReportCondition = (VOQuarterlyReportCondition) command;
		// System.out.println("compListCondition.getCompName()~~~~~~>>>>" + VOMonthlyReportCondition.getCompName());

		HttpSession session = request.getSession(false);
		// User user = (User) session.getAttribute("user");

		// -------------------------------------------------------------
		TreeMap mp = new TreeMap();
		MySQLAccess o = new MySQLAccess();
		try {
			mp = o.readAggregateQuarterlyReports(voQuarterlyReportCondition);// /!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("quarterlyreportlist", mp);
		request.setAttribute("years", SelectYearMonth.getYears());
		request.setAttribute("quarters", SelectYearMonth.getQuarters());

		//
		session.setAttribute("voQuarterlyReportCondition", voQuarterlyReportCondition);
		//

		
//		if (output.equals("excel")) {
//			 System.out.println("in QuarterlyReportConfirmedController output===nn="+output);
//			return new ModelAndView("QuarterlyReportExcelController", "mp", mp);
//		} else {

			return new ModelAndView("myHistoryQuarterlyConfirmedForm", "voQuarterlyReportCondition",
					voQuarterlyReportCondition);
//		}

	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);

		// User user = (User) session.getAttribute("user");

		VOQuarterlyReportCondition voQuarterlyReportCondition = (VOQuarterlyReportCondition) session
				.getAttribute("voQuarterlyReportCondition");

		if (voQuarterlyReportCondition == null) {
			// voMonthlyReportCondition = new VOMonthlyReportCondition();
			DateUtil x = new DateUtil();
			voQuarterlyReportCondition = x.getInitQuarterlyReportCondition();

			session.setAttribute("voQuarterlyReportCondition", voQuarterlyReportCondition);
		}
		return voQuarterlyReportCondition;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();

		referenceData.put("years", SelectYearMonth.getYears());
		referenceData.put("quarters", SelectYearMonth.getQuarters());
		// -------------------------------------------------------------
		// ArrayList ar = new ArrayList();
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		VOQuarterlyReportCondition voQuarterlyReportCondition = (VOQuarterlyReportCondition) session
				.getAttribute("voQuarterlyReportCondition");
		if (voQuarterlyReportCondition == null) {
			// voMonthlyReportCondition = new VOMonthlyReportCondition();
			DateUtil x = new DateUtil();
			voQuarterlyReportCondition = x.getInitQuarterlyReportCondition();
		}

		System.out.println("!!!!====>" + voQuarterlyReportCondition.fromYear + "Q"
				+ voQuarterlyReportCondition.fromQuarter + "---->" + voQuarterlyReportCondition.toYear + "Q"
				+ voQuarterlyReportCondition.toQuarter);

		TreeMap mp = new TreeMap();
		MySQLAccess o = new MySQLAccess();
		try {
			mp = o.readAggregateQuarterlyReports(voQuarterlyReportCondition);
		} catch (Exception e) {
			e.printStackTrace();
		}

		referenceData.put("quarterlyreportlist", mp);

		return referenceData;
	}
}