package com.mod.outsource.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.Outsource;

public class OutsourceEditController extends SimpleFormController {

	public OutsourceEditController() {
		setCommandClass(Outsource.class);
		setCommandName("outsource");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {	
		Outsource obj = (Outsource) command;
		
		System.out.println("outsource uid="+obj.getUid());
		
		MySQLAccessOutsource o = new MySQLAccessOutsource();
		try {
			o.updateOutsource(obj,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		

		return new ModelAndView(new RedirectView("outsourceView.htm?uid=" + obj.getUid()));
		
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String uid = request.getParameter("uid");
		Outsource obj = new Outsource();
		MySQLAccessOutsource o = new MySQLAccessOutsource();
		try {
			obj = o.findOutsourceById(uid);			
			request.setAttribute("outsource", obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		return referenceData;
	}
}
