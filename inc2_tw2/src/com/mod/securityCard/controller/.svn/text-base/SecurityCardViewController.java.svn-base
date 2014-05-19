package com.mod.securityCard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.securityCard.controller.MySQLAccessSecurityCard;
import com.model.SecurityCard;

public class SecurityCardViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		SecurityCard obj = new SecurityCard();
		MySQLAccessSecurityCard o = new MySQLAccessSecurityCard();
		
			obj = o.findSecurityCardById(uid);
			obj.setEntityStatusRS(request);
			
	
		return new ModelAndView("securityCardView", "securityCard", obj);
	}
}
