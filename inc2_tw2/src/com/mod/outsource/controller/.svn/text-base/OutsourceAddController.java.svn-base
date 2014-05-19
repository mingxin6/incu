package com.mod.outsource.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.outsource.controller.MySQLAccessOutsource;
import com.model.ActivityRec;
import com.model.Outsource;

public class OutsourceAddController extends SimpleFormController {

	public OutsourceAddController() {
		setCommandClass(Outsource.class);
		setCommandName("outsource");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		Outsource obj = (Outsource) command;
		try {
			new MySQLAccessOutsource().insertOutsources(obj, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("outsourceList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		// String compName = request.getParameter("compName");
		// String compId = request.getParameter("compId");
		// request.setAttribute("compName", compName);
		Outsource obj = new Outsource();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("compId", request.getParameter("compId"));
		return referenceData;
	}
}
