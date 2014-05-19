package com.mod.company.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.db.MySQLAccessSec;
import com.model.CompanyIntro;

public class CompanyIntroListController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List<CompanyIntro> alist = new ArrayList<CompanyIntro>();
		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
			alist = mysqlDB.readCompanyIntroList();

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (alist.size() <= 0)
			request.setAttribute("IsShow", false);
		else
			request.setAttribute("IsShow", true);
		request.setAttribute("companyIntroList", alist);

		return new ModelAndView("companyIntroList");
	}

}
