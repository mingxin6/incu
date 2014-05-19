package com.mod.financialOfficer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.FinancialOfficer;
import com.model.User;

public class FinancialOfficerEditController extends SimpleFormController {

	public FinancialOfficerEditController() {
		setCommandClass(FinancialOfficer.class);
		setCommandName("financialOfficer");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {	
		FinancialOfficer obj = (FinancialOfficer) command;	
		MySQLAccessFinancialOfficer o = new MySQLAccessFinancialOfficer();
		try {
			o.updateFinancialOfficer(obj,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("financialOfficerView.htm?uid=" + obj.getUid()));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String uid = request.getParameter("uid");
		FinancialOfficer obj = new FinancialOfficer();
		MySQLAccessFinancialOfficer o = new MySQLAccessFinancialOfficer();
		try {
			obj = o.findFinancialOfficerById(uid);			
			request.setAttribute("financialOfficer", obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		return referenceData;
	}
}
