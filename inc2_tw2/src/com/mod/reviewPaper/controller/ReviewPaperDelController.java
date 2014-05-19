package com.mod.reviewPaper.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.view.RedirectView;

import com.model.ReviewPaper;

public class ReviewPaperDelController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String reviewPaperUid = request.getParameter("reviewPaperUid");
		MySQLAccessReviewPaper o = new MySQLAccessReviewPaper();
		o.deleteReviewPaperAndAllResults(reviewPaperUid);
		// return new ModelAndView("reviewPaperView");
		return new ModelAndView(new RedirectView("reviewPaperList.htm"));
	}

}