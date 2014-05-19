package com.mod.reviewPaper.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.mod.reviewer.controller.MySQLAccessReviewer;
import com.model.Company;
import com.model.ReviewPaper;

public class ReviewPaperAddController extends SimpleFormController {
	public ReviewPaperAddController() {
		setCommandClass(ReviewPaper.class);
		setCommandName("ReviewPaper");
	}

	@Override
	protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse res, Object obj,
			BindException errors) throws Exception {
		String[] compChecked = request.getParameterValues("compChecked");
		if (compChecked == null) {
			errors.reject("reuired.compay");
		}

		String[] p_reviewerChecked = request.getParameterValues("p_reviewerChecked");
		if (p_reviewerChecked == null) {
			errors.reject("required.paper.reviewer");
		}

		String[] m_reviewerChecked = request.getParameterValues("m_reviewerChecked");
		if (m_reviewerChecked == null) {
			errors.reject("required.meeting.reviewer");
		}

		if (!errors.hasErrors()) {
			return onSubmit(request, res, obj, errors);
		}

		return super.processFormSubmission(request, res, obj, errors);
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		String[] compChecked = request.getParameterValues("compChecked");
		String[] p_reviewerChecked = request.getParameterValues("p_reviewerChecked");
		String[] m_reviewerChecked = request.getParameterValues("m_reviewerChecked");

		ReviewPaper reviewPaper = (ReviewPaper) command;
		System.out.println("reviewPaper title=" + reviewPaper.getTitle());

		MySQLAccessReviewPaper o = new MySQLAccessReviewPaper();
		o.insertReviewPaper(reviewPaper, request, compChecked, p_reviewerChecked, m_reviewerChecked);

		// VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) command;
		// ArrayList ar = new ArrayList();
		// MySQLAccessReviewPaper o = new MySQLAccessReviewPaper();
		// try {
		// ar = o.findAcceptedCompanies();
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		// request.setAttribute("parkingLotList", ar);
		return new ModelAndView(new RedirectView("reviewPaperList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		// HttpSession session = request.getSession(false);
		// VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition)
		// session.getAttribute("voYearMonthCondition");
		// if (voYearMonthCondition == null)
		// voYearMonthCondition = new VOYearMonthCondition();

		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();

		ArrayList acceptedCompanies = o.findAcceptedCompaniesB0();
		for(int i=0;i<acceptedCompanies.size();i++){
			Company comp=(Company)acceptedCompanies.get(i);
			comp.setCompStatusRS(request);
		}
		

		request.setAttribute("compList", acceptedCompanies);

		// --------------------------------------------------------------
		MySQLAccessReviewer o2 = new MySQLAccessReviewer();
		ArrayList reviewers = o2.findAllReviewers();
		request.setAttribute("reviewerList", reviewers);

		// System.out.println("=======>>>>reviewerList ====>=" + reviewers.size());

		// String[] revId = new String[reviewers.size()];
		// String[] revName = new String[reviewers.size()];
		// for (int i = 0; i < reviewers.size(); i++) {
		// Reviewer r = (Reviewer) reviewers.get(i);
		// revId[i]=r.getUid();
		// revName[i]=r.getName();
		// }

		// --------------------------------------------------------------
		ReviewPaper reviewPaper = new ReviewPaper();
		return reviewPaper;

	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		// ArrayList acceptedCompanies = new ArrayList();
		// MySQLAccessReviewPaper o = new MySQLAccessReviewPaper();
		// try {
		// acceptedCompanies = o.findAcceptedCompanies();
		// } catch (Exception e) {
		// e.printStackTrace();
		// }

		Map referenceData = new HashMap();
		// referenceData.put("comp", acceptedCompanies);
		return referenceData;
	}
}