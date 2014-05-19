package com.mod.securityCard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.A;
import com.model.SecurityCard;

public class SecurityCardAddController extends SimpleFormController {

	public SecurityCardAddController() {
		setCommandClass(SecurityCard.class);
		setCommandName("securityCard");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		SecurityCard obj = (SecurityCard) command;
		try {
			new MySQLAccessSecurityCard().insertSecurityCards(obj, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("securityCardList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
	
		SecurityCard obj = new SecurityCard();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("statuses", A.getEntityValidStatus(request));
		return referenceData;
	}
}
