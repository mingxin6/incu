package com.mod.reviewer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.Reviewer;
import com.model.User;

public class ReviewerEditController extends SimpleFormController {

	public ReviewerEditController() {
		setCommandClass(Reviewer.class);
		setCommandName("reviewer");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {	
		Reviewer obj = (Reviewer) command;	
		MySQLAccessReviewer o = new MySQLAccessReviewer();
		try {
			o.updateReviewer(obj,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("reviewerView.htm?uid=" + obj.getUid()));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String uid = request.getParameter("uid");
		Reviewer obj = new Reviewer();
		MySQLAccessReviewer o = new MySQLAccessReviewer();
		try {
			obj = o.findReviewerById(uid);			
			request.setAttribute("reviewer", obj);
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
