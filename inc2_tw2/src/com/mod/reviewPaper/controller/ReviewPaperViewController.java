package com.mod.reviewPaper.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.model.ReviewPaper;

public class ReviewPaperViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("ReviewPaperViewController *****************");
		String reviewPaperUid = request.getParameter("reviewPaperUid");
		ReviewPaper reviewPaper = new MySQLAccessReviewPaper().findReviewPaperByReviewPaperUid(reviewPaperUid);

		System.out.println("reviewPaper id=" + reviewPaper.getReviewPaperUid());

		reviewPaper.setStatusRS(request);

		System.out.println("ReviewPaperViewController *****************2");
		
		// HashMap map= reviewPaper.getMp();
		Iterator it = reviewPaper.getMp().keySet().iterator();
		
		System.out.println("ReviewPaperViewController *****************3");
		while (it.hasNext()) {// 每個企業
			System.out.println("ReviewPaperViewController *****************4");
			Object key = it.next();
//			Object val = reviewPaper.getMp().remove(key);
			ReviewCompany reviewCompany = (ReviewCompany) key;
			reviewCompany.setFinalPassRS(request);
//			reviewPaper.getMp().put(reviewCompany, (HashMap) val);
		}
		System.out.println("ReviewPaperViewController *****************5");
		return new ModelAndView("reviewPaperView", "reviewPaper", reviewPaper);
	}

}