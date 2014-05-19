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

public class MyHistoryMonthlyReportController extends SimpleFormController {

	public MyHistoryMonthlyReportController() {
		setCommandClass(TreeMap.class);
		setCommandName("monthlyreportlist");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		HttpSession session = request.getSession(false);
		System.out.println("command.getClass().getName()--->" + command.getClass().getName());

		User user = (User) session.getAttribute("user");

		// MMM mmm = (MMM) command;
		// System.out.println("mmm.dotype=" + mmm.dotype);

		// -----------------------------------------------------------------------------
		// 依据过滤条件重抓资料

		// VOMonthlyReportCondition voMonthlyReportCondition = (VOMonthlyReportCondition) mmm
		// .getVoMonthlyReportCondition();

		TreeMap mp = new TreeMap();
		MySQLAccess o = new MySQLAccess();
		try {
//			mp = o.readHistoryMonthlyReports(user.compid);
			// mmm.setMonthlyreportlist(mp);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// -----------------------------------------------------------------------------

		//
		// request.setAttribute("years", SelectYearMonth.getYears());
		// request.setAttribute("months", SelectYearMonth.getMonths());

		// request.setAttribute("mmm", mmm);
		//
		// session.setAttribute("mmm", mmm);
		//
		return new ModelAndView("myHistoryMonthlyReportForm", "monthlyreportlist", mp);

	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		// MMM mmm = (MMM) session.getAttribute("mmm");

		// VOMonthlyReportCondition voMonthlyReportCondition = mmm.getVoMonthlyReportCondition();
		// if (voMonthlyReportCondition == null) {
		// DateUtil x = new DateUtil();
		// voMonthlyReportCondition = x.getInitMonthlyReportCondition();
		// mmm.setVoMonthlyReportCondition(voMonthlyReportCondition);
		// }

		TreeMap mp = new TreeMap();
		MySQLAccess o = new MySQLAccess();
		try {
			// VOMonthlyReportCondition voMonthlyReportCondition=new VOMonthlyReportCondition();
//			mp = o.readHistoryMonthlyReports(user.compid);
			// mmm.setMonthlyreportlist(mp);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// mmm = new MMM();
		return mp;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		System.out.println("referenceData--------!!!!!!");

		Map referenceData = new HashMap();

		// referenceData.put("years", SelectYearMonth.getYears());
		// referenceData.put("months", SelectYearMonth.getMonths());
		// -------------------------------------------------------------
		// ArrayList ar = new ArrayList();
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		// VOMonthlyReportCondition voMonthlyReportCondition = (VOMonthlyReportCondition) session
		// .getAttribute("voMonthlyReportCondition");
		// MMM mmm = (MMM) session.getAttribute("mmm");

		// if (mmm == null) {
		// mmm = new MMM();
		// }

		// VOMonthlyReportCondition voMonthlyReportCondition = mmm.getVoMonthlyReportCondition();
		// if (voMonthlyReportCondition == null) {
		// // voMonthlyReportCondition = new VOMonthlyReportCondition();
		// DateUtil x = new DateUtil();
		// voMonthlyReportCondition = x.getInitMonthlyReportCondition();
		// mmm.setVoMonthlyReportCondition(voMonthlyReportCondition);
		// }

		TreeMap mp = new TreeMap();
		MySQLAccess o = new MySQLAccess();
		try {
//			mp = o.readHistoryMonthlyReports(user.compid);
			// mmm.setMonthlyreportlist(mp);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// referenceData.put("mmm", mmm);
		referenceData.put("monthlyreportlist", mp);

		return referenceData;
	}
}