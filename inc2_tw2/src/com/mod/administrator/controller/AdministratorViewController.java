package com.mod.administrator.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.administrator.controller.MySQLAccessAdministrator;
import com.model.Administrator;

public class AdministratorViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		Administrator obj = new Administrator();
		MySQLAccessAdministrator o = new MySQLAccessAdministrator();
		try {
			obj = o.findAdministratorById(uid);
		
				obj.setEntityStatusRS(request);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("administratorView", "administrator", obj);
	}
}
