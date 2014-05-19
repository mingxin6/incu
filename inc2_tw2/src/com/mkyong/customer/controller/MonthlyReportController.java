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
import com.vo.VOMonthlyReportCondition;

public class MonthlyReportController extends SimpleFormController {

	public MonthlyReportController() {
		setCommandClass(VOMonthlyReportCondition.class);
		setCommandName("voMonthlyReportCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		VOMonthlyReportCondition voMonthlyReportCondition = (VOMonthlyReportCondition) command;
		// System.out.println("compListCondition.getCompName()~~~~~~>>>>" + VOMonthlyReportCondition.getCompName());

		HttpSession session = request.getSession(false);
		//User user = (User) session.getAttribute("user");

		// -------------------------------------------------------------
		TreeMap mp = new TreeMap();
		MySQLAccess o = new MySQLAccess();
		try {
			mp = o.readAggregateMonthlyReports( voMonthlyReportCondition);///!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("monthlyreportlist", mp);
		//
		request.setAttribute("years", SelectYearMonth.getYears());
		request.setAttribute("months", SelectYearMonth.getMonths());

		//
		session.setAttribute("voMonthlyReportCondition", voMonthlyReportCondition);
		//
		return new ModelAndView("myHistoryMonthlyAggregatedForm", "voMonthlyReportCondition", voMonthlyReportCondition);

	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);

//		User user = (User) session.getAttribute("user");

		VOMonthlyReportCondition voMonthlyReportCondition = (VOMonthlyReportCondition) session
				.getAttribute("voMonthlyReportCondition");
		
		if (voMonthlyReportCondition == null) {
			// voMonthlyReportCondition = new VOMonthlyReportCondition();
			DateUtil x = new DateUtil();
			voMonthlyReportCondition = x.getInitMonthlyReportCondition();

			session.setAttribute("voMonthlyReportCondition", voMonthlyReportCondition);
		}
		return voMonthlyReportCondition;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();

		referenceData.put("years", SelectYearMonth.getYears());
		referenceData.put("months", SelectYearMonth.getMonths());
		// -------------------------------------------------------------
		// ArrayList ar = new ArrayList();
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		VOMonthlyReportCondition voMonthlyReportCondition = (VOMonthlyReportCondition) session
				.getAttribute("voMonthlyReportCondition");
		if (voMonthlyReportCondition == null){
//			voMonthlyReportCondition = new VOMonthlyReportCondition();
			DateUtil x = new DateUtil();
			voMonthlyReportCondition = x.getInitMonthlyReportCondition();
		}

		TreeMap mp = new TreeMap();
		MySQLAccess o = new MySQLAccess();
		try {
			mp = o.readAggregateMonthlyReports( voMonthlyReportCondition);
		} catch (Exception e) {
			e.printStackTrace();
		}

		referenceData.put("monthlyreportlist", mp);

		return referenceData;
	}
}