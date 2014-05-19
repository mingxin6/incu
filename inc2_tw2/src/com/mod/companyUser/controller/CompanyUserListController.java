package com.mod.companyUser.controller;

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

public class CompanyUserListController extends SimpleFormController {

	public CompanyUserListController() {
		setCommandClass(VOYearMonthCondition.class);
		setCommandName("voYearMonthCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) command;
		ArrayList ar = new ArrayList();
		MySQLAccessCompanyUser o = new MySQLAccessCompanyUser();
		try {
			ar = o.findAllCompanyUsers(null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("companyUserList", ar);
		return new ModelAndView("companyUserList", "voYearMonthCondition",
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
		HttpSession session = request.getSession(false);
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) session
				.getAttribute("voYearMonthCondition");
		if (voYearMonthCondition == null)
			voYearMonthCondition = new VOYearMonthCondition();

		ArrayList ar = new ArrayList();
		MySQLAccessCompanyUser o = new MySQLAccessCompanyUser();
		try {
			ar = o.findAllCompanyUsers(null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map referenceData = new HashMap();
		referenceData.put("companyUserList", ar);
		return referenceData;
	}
}