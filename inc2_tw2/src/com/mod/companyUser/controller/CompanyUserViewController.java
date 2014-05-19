package com.mod.companyUser.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.model.CompanyUser;

public class CompanyUserViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		CompanyUser obj = new CompanyUser();
		MySQLAccessCompanyUser o = new MySQLAccessCompanyUser();
		try {
			obj = o.findCompanyUserById(uid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("companyUserView", "companyUser", obj);
	}
}
