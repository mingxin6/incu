package com.mod.staff.controller;

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
import com.model.User;
import com.vo.VOYearMonthCondition;

public class StaffListController extends SimpleFormController {

	public StaffListController() {
		setCommandClass(VOYearMonthCondition.class);
		setCommandName("voYearMonthCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) command;
		ArrayList ar = new ArrayList();
		MySQLAccessStaff o = new MySQLAccessStaff();
		try {
			ar = o.findAllStaffs(null);
			for (int i = 0; i < ar.size(); i++) {
				A a = (A) ar.get(i);
				a.setEntityStatusRS(request);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("staffList", ar);
		return new ModelAndView("staffList", "voYearMonthCondition", voYearMonthCondition);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) session.getAttribute("voYearMonthCondition");
		if (voYearMonthCondition == null)
			voYearMonthCondition = new VOYearMonthCondition();
		return voYearMonthCondition;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		
		VOYearMonthCondition c = (VOYearMonthCondition) session.getAttribute("voYearMonthCondition");
		if (c == null)
			c = new VOYearMonthCondition();

		
		MySQLAccessStaff o = new MySQLAccessStaff();
		ArrayList ar = o.findAllStaffs(null);
		for (int i = 0; i < ar.size(); i++) {
			A a = (A) ar.get(i);
			a.setEntityStatusRS(request);
		}
		Map referenceData = new HashMap();
		referenceData.put("staffList", ar);
		return referenceData;
	}
}