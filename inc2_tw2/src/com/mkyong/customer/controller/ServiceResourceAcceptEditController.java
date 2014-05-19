package com.mkyong.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;

public class ServiceResourceAcceptEditController extends SimpleFormController {
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String categorize = request.getParameter("categorize");
		String sraid = request.getParameter("sraid");
		String action = request.getParameter("action");
		
		MySQLAccess o = new MySQLAccess();
		try {
			o.updateServiceResourceAcceptStatus(sraid,action);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ModelAndView(new RedirectView("serviceResourceAcceptList.htm?categorize="+categorize));

	}

}
