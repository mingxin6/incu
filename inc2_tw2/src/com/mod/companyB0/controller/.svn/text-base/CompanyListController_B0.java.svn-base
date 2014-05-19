package com.mod.companyB0.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.model.Company;
import com.model.User;

public class CompanyListController_B0 implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		String uid = u.getUid();

		ArrayList ar = new ArrayList();
		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		
			ar = o.findCompanyB0ByMemberUid(uid);
			
			for(int i=0;i<ar.size();i++){
				Company comp=(Company)ar.get(i);
				comp.setCompStatusRS(request);
			}
	
		request.setAttribute("compList", ar);
		return new ModelAndView("companyList_B0");
	}
}