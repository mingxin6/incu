package com.mod.activityrec.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.ActivityRec;

public class ActivityRecAddController extends SimpleFormController {

	public ActivityRecAddController() {
		setCommandClass(ActivityRec.class);
		setCommandName("ActivityRec");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		ActivityRec obj = (ActivityRec) command;
		MySQLAccessActivityRec o = new MySQLAccessActivityRec();
		try {
			o.insertActivityRec(obj,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("activityRecList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String compName = request.getParameter("compName");
		String compId = request.getParameter("compId");
		// MySQLAccess o = new MySQLAccess();
		// PotentiallyCompanyNotes pcn =
		// o.selectPotentiallycCompanyNotesById(compId);
		// request.setAttribute("compName", pcn.companyName);
		request.setAttribute("compName", compName);
		ActivityRec obj = new ActivityRec();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("compId", request.getParameter("compId"));
		return referenceData;
	}
}
