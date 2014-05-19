package com.mod.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.model.A;
import com.vo.VOYearMonthCondition;

public class MemberListController extends SimpleFormController {

	public MemberListController() {
		setCommandClass(VOYearMonthCondition.class);
		setCommandName("voYearMonthCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) command;
		ArrayList ar = new ArrayList();
		MySQLAccessMember o = new MySQLAccessMember();
		try {
			ar = o.findAllMembers();
			for (int i = 0; i < ar.size(); i++) {
				A a = (A) ar.get(i);
				a.setEntityStatusRS(request);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("memberList", ar);
		return new ModelAndView("memberList", "voYearMonthCondition",
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

		MySQLAccessMember o = new MySQLAccessMember();
		try {
			ar = o.findAllMembers();
			for (int i = 0; i < ar.size(); i++) {
				A a = (A) ar.get(i);
				a.setEntityStatusRS(request);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		referenceData.put("memberList", ar);
		return referenceData;
	}
}