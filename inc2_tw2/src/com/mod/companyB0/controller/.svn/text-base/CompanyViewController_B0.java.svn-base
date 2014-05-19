package com.mod.companyB0.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.db.MySQLAccess;
import com.model.Company;

public class CompanyViewController_B0 implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String compID = request.getParameter("compID");
		System.out.println("compID=" + compID);
		Company comp = new Company();
		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
					comp = o.readCompanyB0ByUniqueID(compID);
			comp.setCompStatusRS(request);
		

		return new ModelAndView("companyView_B0", "comp", comp);

		// HttpSession session = request.getSession(false);
		// User u = (User) session.getAttribute("user");
		// String uid = u.getUid();
		//
		// Company comp = new Company();
		// MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		// try {
		// comp = o.findCompanyByCreatorId(uid);
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		// if (comp != null) {
		// return new ModelAndView("companyView_B0", "comp", comp);
		// } else {
		// return new ModelAndView("companyView_B0_Fail");
		// }

	}

}