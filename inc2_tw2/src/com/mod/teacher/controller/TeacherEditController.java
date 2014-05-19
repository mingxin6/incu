package com.mod.teacher.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.Teacher;
import com.model.User;

public class TeacherEditController extends SimpleFormController {

	public TeacherEditController() {
		setCommandClass(Teacher.class);
		setCommandName("teacher");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Teacher obj = (Teacher) command;

		System.out.println("teacher uid=" + obj.getUid());

		MySQLAccessTeacher o = new MySQLAccessTeacher();
		try {
			o.updateTeacher(obj, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("teacherView.htm?uid=" + obj.getUid()));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String uid = request.getParameter("uid");
		Teacher obj = new Teacher();
		MySQLAccessTeacher o = new MySQLAccessTeacher();
		try {
			obj = o.findTeacherById(uid);
			request.setAttribute("teacher", obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		return referenceData;
	}
}
