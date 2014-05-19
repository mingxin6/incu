package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.vo.VOYearMonthCondition;

public class FeesListController extends SimpleFormController {

	public FeesListController() {
		setCommandClass(VOYearMonthCondition.class);
		setCommandName("voYearMonthCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) command;
		ArrayList ar = new ArrayList();
		MySQLAccess o = new MySQLAccess();
		try {
			ar = o.findFeesByYearMonth(voYearMonthCondition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("feesList", ar);
		//
		//
		HttpSession session = request.getSession(false);
		session.setAttribute("voYearMonthCondition", voYearMonthCondition);
		//
		
		request.setAttribute("selectYear", SelectYear.get());
		request.setAttribute("selectMonth", SelectMonth.get());
		
		
		return new ModelAndView("feesList", "voYearMonthCondition",
				voYearMonthCondition);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession(false);
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) session
				.getAttribute("voYearMonthCondition");
		if (voYearMonthCondition == null)
			voYearMonthCondition = new VOYearMonthCondition();
		return voYearMonthCondition;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		ArrayList ar = new ArrayList();

		HttpSession session = request.getSession(false);
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) session
				.getAttribute("voYearMonthCondition");
		if (voYearMonthCondition == null)
			voYearMonthCondition = new VOYearMonthCondition();

		MySQLAccess o = new MySQLAccess();
		try {
			ar = o.findFeesByYearMonth(voYearMonthCondition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		referenceData.put("feesList", ar);
		
		referenceData.put("selectYear", SelectYear.get());
		referenceData.put("selectMonth", SelectMonth.get());
		
		return referenceData;
	}
}