package com.mkyong.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;
import com.entity.Problems;

public class ProblemsEditController extends SimpleFormController {

	public ProblemsEditController() {
		setCommandClass(Problems.class);
		setCommandName("pro");
	}
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		Problems pro = (Problems) command;
		MySQLAccess o = new MySQLAccess();
		try {
			o.updateProblems(pro);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("problemsList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String id = request.getParameter("aid");
		Problems pro = new Problems();
		MySQLAccess o = new MySQLAccess();
		try {
			pro = o.selectProblemsById(Integer.parseInt(id));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pro;
	}
}