package com.mod.securityCard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.view.RedirectView;

import com.model.SecurityCard;

public class SecurityCardClearController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uid = request.getParameter("uid");

		MySQLAccessSecurityCard o = new MySQLAccessSecurityCard();
		SecurityCard obj = o.findSecurityCardById(uid);
		obj.setUsedBy("");

		o.updateSecurityCard(obj, request);

		return new ModelAndView(new RedirectView("securityCardView.htm?uid=" + obj.getUid()));

	}
}
