package com.mod.reviewPaperJob.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.ReviewPaper;
import com.model.ReviewPaperResult;
import com.model.User;

public class ReviewPaperJobListController extends SimpleFormController {
	public ReviewPaperJobListController() {
		setCommandClass(ReviewPaperResult.class);
		setCommandName("ReviewPaperResult");
	}

	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		// VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) command;
		// ArrayList ar = new ArrayList();
		// MySQLAccessReviewPaper o = new MySQLAccessReviewPaper();
		// try {
		// ar = o.findAcceptedCompanies();
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		// request.setAttribute("parkingLotList", ar);
		return new ModelAndView(new RedirectView("reviewPaperJobList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");

		// HttpSession session = request.getSession(false);
		// VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition)
		// session.getAttribute("voYearMonthCondition");
		// if (voYearMonthCondition == null)
		// voYearMonthCondition = new VOYearMonthCondition();
		//--------------------------------------------------------------
		MySQLAccessReviewPaperJob o=new MySQLAccessReviewPaperJob();
		ArrayList rec = o.findReviewPaperJobs(u.getUid());
		request.setAttribute("reviewPaperJobList", rec);

		//--------------------------------------------------------------
		ReviewPaperResult reviewPaperResult = new ReviewPaperResult();
		return reviewPaperResult;
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