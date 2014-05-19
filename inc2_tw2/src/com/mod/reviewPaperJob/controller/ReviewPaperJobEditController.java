package com.mod.reviewPaperJob.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.model.Company;
import com.model.ReviewPaperResult;

public class ReviewPaperJobEditController extends SimpleFormController {
	public ReviewPaperJobEditController() {
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
		return new ModelAndView(new RedirectView("reviewPaperJobList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String reviewPaperResultUid = request.getParameter("reviewPaperResultUid");
	
		MySQLAccessReviewPaperJob o = new MySQLAccessReviewPaperJob();
		ReviewPaperResult reviewPaperResult = o.findReviewPaperJob(reviewPaperResultUid);
		request.setAttribute("reviewPaperResult", reviewPaperResult);
		
		// --------------------------------------------------------------
		String compID = reviewPaperResult.getCompanyUid();
		//System.out.println("compID=" + compID);
		Company comp = new Company();
		MySQLAccessCompany_B0 o2 = new MySQLAccessCompany_B0();
		
			comp = o2.findNewApply(compID);
			comp.setCompStatusRS(request);
		
		request.setAttribute("comp", comp);
		 
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