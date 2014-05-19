package com.mod.financialOfficer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.financialOfficer.controller.MySQLAccessFinancialOfficer;

public class FinancialOfficerDeleteController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		try {
			new MySQLAccessFinancialOfficer().deleteFinancialOfficer(uid, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("financialOfficerList.htm"));
	}
}
