package com.mod.reviewPaper.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.mod.reviewPaperJob.controller.MySQLAccessReviewPaperJob;
import com.model.Company;
import com.model.ReviewPaper;
import com.model.ReviewPaperResult;

public class ReviewPaperJobController extends SimpleFormController {
	public ReviewPaperJobController() {
		setCommandClass(ReviewPaperResult.class);
		setCommandName("ReviewPaperResult");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		ReviewPaperResult obj = (ReviewPaperResult) command;
		MySQLAccessReviewPaperJob o = new MySQLAccessReviewPaperJob();
		try {
			o.updateReviewPaperResult(obj, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String reviewPaperUid = obj.getReviewPaperUid();
		
//		return new ModelAndView(new RedirectView("reviewPaperJobList.htm"));
		return new ModelAndView(new RedirectView("reviewPaperView.htm?reviewPaperUid="+reviewPaperUid));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String reviewPaperResultUid = request.getParameter("reviewPaperResultUid");

		MySQLAccessReviewPaperJob o = new MySQLAccessReviewPaperJob();
		ReviewPaperResult reviewPaperResult = o.findReviewPaperJob(reviewPaperResultUid);
		request.setAttribute("reviewPaperResult", reviewPaperResult);

		// --------------------------------------------------------------
		String compID = reviewPaperResult.getCompanyUid();
		// System.out.println("compID=" + compID);
		
		MySQLAccessCompany_B0 o2 = new MySQLAccessCompany_B0();
		Company	comp = o2.findNewApply(compID);
		comp.setResources(request);
		request.setAttribute("comp", comp);

		String reviewPaperUid = reviewPaperResult.getReviewPaperUid();
		
		MySQLAccessReviewPaper mySQLAccessReviewPaper=new MySQLAccessReviewPaper();
		ReviewPaper reviewPaper=mySQLAccessReviewPaper.findReviewPaperByReviewPaperUid(reviewPaperUid);
		reviewPaper.setStatusRS(request);
		
		request.setAttribute("reviewPaper", reviewPaper);
		
		request.setAttribute("reviewPaperUid", reviewPaperUid);
		request.setAttribute("reviewPaperTitle", reviewPaper.getTitle());
		
		request.setAttribute("reviewerName", request.getParameter("reviewerName"));
		
		
		
		return reviewPaperResult;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("comp", acceptedCompanies);
		return referenceData;
	}
}