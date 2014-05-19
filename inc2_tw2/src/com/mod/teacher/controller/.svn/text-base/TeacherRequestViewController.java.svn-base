package com.mod.teacher.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.model.Teacher;

public class TeacherRequestViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		Teacher obj = new Teacher();
		MySQLAccessTeacher o = new MySQLAccessTeacher();
		try {
			obj = o.findTeacherById(uid);
			obj.setEntityStatusRS(request);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("teacherRequestView", "teacher", obj);
	}
}
