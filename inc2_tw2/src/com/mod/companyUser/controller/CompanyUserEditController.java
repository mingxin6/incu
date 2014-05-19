package com.mod.companyUser.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.CompanyUser;
import com.model.User;

public class CompanyUserEditController extends SimpleFormController {

	public CompanyUserEditController() {
		setCommandClass(CompanyUser.class);
		setCommandName("companyUser");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		CompanyUser obj = (CompanyUser) command;

		System.out.println("companyUser uid=" + obj.getUid());

		MySQLAccessCompanyUser o = new MySQLAccessCompanyUser();

		o.updateCompanyUser(obj, request);

		return new ModelAndView(new RedirectView("companyUserView.htm?uid=" + obj.getUid()));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String uid = request.getParameter("uid");
		CompanyUser obj = new CompanyUser();
		MySQLAccessCompanyUser o = new MySQLAccessCompanyUser();
		try {
			obj = o.findCompanyUserById(uid);
			request.setAttribute("companyUser", obj);
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
