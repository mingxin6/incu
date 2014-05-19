package com.mkyong.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class BlankViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//
//		String compName = request.getParameter("compID");
//		System.out.println("compName=" + compName);
//
////		String now = (new Date()).toString();
////		logger.info("Returning hello view with " + now);
//
//		Company comp = new Company();
//		MySQLAccess o = new MySQLAccess();
//		try {
//			comp = o.readCompByName(compName);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		return new ModelAndView("blank", "comp", null);
	}

}