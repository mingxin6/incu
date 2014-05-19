package com.mod.outsource.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.outsource.controller.MySQLAccessOutsource;
import com.model.Outsource;

public class OutsourceViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		Outsource obj = new Outsource();
		MySQLAccessOutsource o = new MySQLAccessOutsource();
		try {
			obj = o.findOutsourceById(uid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("outsourceView", "outsource", obj);
	}
}
