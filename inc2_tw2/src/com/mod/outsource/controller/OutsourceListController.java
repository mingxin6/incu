package com.mod.outsource.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.vo.VOYearMonthCondition;

public class OutsourceListController extends SimpleFormController {

	public OutsourceListController() {
		setCommandClass(VOYearMonthCondition.class);
		setCommandName("voYearMonthCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) command;
		ArrayList ar = new ArrayList();
		MySQLAccessOutsource o = new MySQLAccessOutsource();
		try {
			ar = o.findAllOutsources();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("outsourceList", ar);
		return new ModelAndView("outsourceList", "voYearMonthCondition",
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

		MySQLAccessOutsource o = new MySQLAccessOutsource();
		try {
			ar = o.findAllOutsources();
		} catch (Exception e) {
			e.printStackTrace();
		}
		referenceData.put("outsourceList", ar);
		return referenceData;
	}
}