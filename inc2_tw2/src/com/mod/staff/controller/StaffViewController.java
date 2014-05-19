package com.mod.staff.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.model.Staff;

public class StaffViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//System.out.println("----->"+request.getRequestURI()+","+request.getParameter("language")+","+request.getParameter("uid"));
		
		String uid = request.getParameter("uid");

		MySQLAccessStaff o = new MySQLAccessStaff();

		Staff staff = o.findStaffById(uid);
		staff.setEntityStatusRS(request);
		
		ArrayList coveredstf = new ArrayList();
		String[] stfs = staff.getCoveredUserOfTalkNote();
		for (int i = 0; i < stfs.length; i++) {
			Staff cf = o.findStaffById(stfs[i]);
			coveredstf.add(cf);
		}

		request.setAttribute("coveredstf", coveredstf);

		return new ModelAndView("staffView", "staff", staff);
	}
}
