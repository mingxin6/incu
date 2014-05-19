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
import com.vo.VOYearlyReportCondition;

public class YearlyReportConfirmedController extends SimpleFormController {

	public YearlyReportConfirmedController() {
		setCommandClass(VOYearlyReportCondition.class);
		setCommandName("voYearlyReportCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		VOYearlyReportCondition voYearlyReportCondition = (VOYearlyReportCondition) command;
		// System.out.println("compListCondition.getCompName()~~~~~~>>>>" + VOMonthlyReportCondition.getCompName());

		HttpSession session = request.getSession(false);
		//User user = (User) session.getAttribute("user");

		// -------------------------------------------------------------
		TreeMap mp = new TreeMap();
		MySQLAccess o = new MySQLAccess();
		try {
			mp = o.readAggregateYearlyReports( voYearlyReportCondition);///!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("yearlyreportlist", mp);
		//
		request.setAttribute("years", SelectYearMonth.getYears());
//		request.setAttribute("months", SelectYearMonth.getMonths());

		//
		session.setAttribute("voYearlyReportCondition", voYearlyReportCondition);
		//
		return new ModelAndView("myHistoryYearlyConfirmedForm", "voYearlyReportCondition", voYearlyReportCondition);

	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);

//		User user = (User) session.getAttribute("user");

		VOYearlyReportCondition voYearlyReportCondition = (VOYearlyReportCondition) session
				.getAttribute("voYearlyReportCondition");
		
		if (voYearlyReportCondition == null) {
			// voMonthlyReportCondition = new VOMonthlyReportCondition();
			DateUtil x = new DateUtil();
			voYearlyReportCondition = x.getInitYearlyReportCondition();
			
			System.out.println(this.getClass().getName()+">>>>"+voYearlyReportCondition.fromYear+"-->"+voYearlyReportCondition.toYear);

			session.setAttribute("voYearlyReportCondition", voYearlyReportCondition);
		}
		return voYearlyReportCondition;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();

		referenceData.put("years", SelectYearMonth.getYears());
//		referenceData.put("months", SelectYearMonth.getMonths());
		// -------------------------------------------------------------
		// ArrayList ar = new ArrayList();
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		VOYearlyReportCondition voYearlyReportCondition = (VOYearlyReportCondition) session
				.getAttribute("voYearlyReportCondition");
		if (voYearlyReportCondition == null){
//			voMonthlyReportCondition = new VOMonthlyReportCondition();
			DateUtil x = new DateUtil();
			voYearlyReportCondition = x.getInitYearlyReportCondition();
		}

		TreeMap mp = new TreeMap();
		MySQLAccess o = new MySQLAccess();
		try {
			mp = o.readAggregateYearlyReports( voYearlyReportCondition);
		} catch (Exception e) {
			e.printStackTrace();
		}

		referenceData.put("yearlyreportlist", mp);

		return referenceData;
	}
}