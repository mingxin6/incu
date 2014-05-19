package com.mod.administrator.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.Administrator;
import com.model.User;

public class AdministratorEditController extends SimpleFormController {

	public AdministratorEditController() {
		setCommandClass(Administrator.class);
		setCommandName("administrator");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {	
		Administrator obj = (Administrator) command;	
		MySQLAccessAdministrator o = new MySQLAccessAdministrator();
		try {
			o.updateAdministrator(obj,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("administratorView.htm?uid=" + obj.getUid()));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String uid = request.getParameter("uid");
		Administrator obj = new Administrator();
		MySQLAccessAdministrator o = new MySQLAccessAdministrator();
		try {
			obj = o.findAdministratorById(uid);			
			request.setAttribute("administrator", obj);
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
