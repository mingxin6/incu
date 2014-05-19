package com.mod.teacher.controller;

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

public class TeacherListController extends SimpleFormController {

	public TeacherListController() {
		setCommandClass(VOYearMonthCondition.class);
		setCommandName("voYearMonthCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) command;
		ArrayList ar = new ArrayList();
		MySQLAccessTeacher o = new MySQLAccessTeacher();
		try {
			ar = o.findAllTeachers(null);
			for (int i = 0; i < ar.size(); i++) {
				A a = (A) ar.get(i);
				a.setEntityStatusRS(request);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("teacherList", ar);
		return new ModelAndView("teacherList", "voYearMonthCondition", voYearMonthCondition);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
//		ResourceBundle resource = ResourceBundle.getBundle("com.properties.hj", (Locale) session
//				.getAttribute(Const.LocaleSessionKey));
//		System.out.print(resource.getString("my.consultant") + "!");

		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) session.getAttribute("voYearMonthCondition");
		if (voYearMonthCondition == null)
			voYearMonthCondition = new VOYearMonthCondition();
		return voYearMonthCondition;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) session.getAttribute("voYearMonthCondition");
		if (voYearMonthCondition == null)
			voYearMonthCondition = new VOYearMonthCondition();

		ArrayList ar = new ArrayList();
		MySQLAccessTeacher o = new MySQLAccessTeacher();
		try {
			ar = o.findAllTeachers(null);
			for (int i = 0; i < ar.size(); i++) {
				A a = (A) ar.get(i);
				a.setEntityStatusRS(request);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		Map referenceData = new HashMap();
		referenceData.put("teacherList", ar);
		return referenceData;
	}
}