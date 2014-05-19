package com.mod.company.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.model.Company;

public class CompanyWaitDetailViewController_B implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		String compID = request.getParameter("compID");
		System.out.println("compID=" + compID);

		Company comp = new Company();
		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		
			comp = o.findNewApply(compID);
			comp.setResources(request);
		

		return new ModelAndView("companyWaitDetailView_B", "comp", comp);
	}

}