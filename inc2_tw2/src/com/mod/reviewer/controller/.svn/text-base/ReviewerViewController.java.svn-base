package com.mod.reviewer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.reviewer.controller.MySQLAccessReviewer;
import com.model.Reviewer;

public class ReviewerViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uid = request.getParameter("uid");
		Reviewer obj = new Reviewer();
		MySQLAccessReviewer o = new MySQLAccessReviewer();

		obj = o.findReviewerById(uid);
		obj.setEntityStatusRS(request);

		return new ModelAndView("reviewerView", "reviewer", obj);
	}
}
