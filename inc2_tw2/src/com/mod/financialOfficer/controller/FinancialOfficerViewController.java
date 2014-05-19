package com.mod.financialOfficer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.financialOfficer.controller.MySQLAccessFinancialOfficer;
import com.model.FinancialOfficer;

public class FinancialOfficerViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		FinancialOfficer obj = new FinancialOfficer();
		MySQLAccessFinancialOfficer o = new MySQLAccessFinancialOfficer();
		try {
			obj = o.findFinancialOfficerById(uid);
			
				obj.setEntityStatusRS(request);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("financialOfficerView", "financialOfficer", obj);
	}
}
