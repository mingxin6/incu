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

public class CompanyDetailViewController_B implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		String compID = request.getParameter("compID");
		System.out.println("compID=" + compID);

		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		Company	comp = o.findNewApply(compID);
		comp.setCompStatusRS(request);
		comp.setDomainRS(request);
		comp.setKindRS(request);
		comp.setInnoKindRS(request);
		return new ModelAndView("companyDetailView_B", "comp", comp);
	}

}