package com.mkyong.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;
import com.entity.Provides;

public class ProvidesEditController extends SimpleFormController {

	public ProvidesEditController() {
		setCommandClass(Provides.class);
		setCommandName("pro");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		Provides pro = (Provides) command;
		MySQLAccess o = new MySQLAccess();
		try {
			o.updateProvides(pro);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("providesList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String id = request.getParameter("aid");
		Provides pro = new Provides();
		MySQLAccess o = new MySQLAccess();
		try {
			pro = o.selectProvidesById(Integer.parseInt(id));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pro;
	}
}