package com.mod.reviewPaper.controller;

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

import com.mod.company.controller.MySQLAccessCompany;
import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.mod.reviewer.controller.MySQLAccessReviewer;
import com.mod.talkNote.controller.MySQLAccessTalkNote;
import com.model.Company;
import com.model.ReviewPaper;
import com.model.TalkNotes;
import com.model.User;
import com.vo.VOReviewPaperSearchCondition;

public class ReviewPaperListController extends SimpleFormController {

	String condName = "ReviewPaperListController";

	public ReviewPaperListController() {
		setCommandClass(VOReviewPaperSearchCondition.class);
		setCommandName(condName);
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		VOReviewPaperSearchCondition c = (VOReviewPaperSearchCondition) command;
		HttpSession session = request.getSession(false);
		session.setAttribute(condName, c);
		// -----------------------------------------------------------
		MySQLAccessReviewPaper o = new MySQLAccessReviewPaper();
		ArrayList reviewPaperList = o.findReviewPapers(c);
		injectReviewResource(reviewPaperList, request);
		request.setAttribute("reviewPaperList", reviewPaperList);

		// ------------------------------------------------------------
		if (!c.isAtTab2()) {
			request.removeAttribute("tab2");
		} else {
			request.setAttribute("tab2", "tab2");
		}

		// Object tab2 = request.getParameter("tab2");
		// if (tab2 != null) {
		// request.setAttribute("tab2", tab2);
		// }
		// ------------------------------------------------------------
		request.setAttribute("statuses", ReviewPaper.getCaesStatus(request));

		return new ModelAndView(new RedirectView("reviewPaperList.htm"));
	}

	void injectCompanyResource(ArrayList ar, HttpServletRequest request) {
		for (int i = 0; i < ar.size(); i++) {
			Company c = (Company) ar.get(i);
			c.setCompStatusRS(request);
			
			c.setDomainRS(request);
			c.setKindRS(request);
			c.setInnoKindRS(request);
		}
	}

	void injectReviewResource(ArrayList ar, HttpServletRequest request) {
		for (int i = 0; i < ar.size(); i++) {
			ReviewPaper c = (ReviewPaper) ar.get(i);
			c.setStatusRS(request);
		}
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		VOReviewPaperSearchCondition c = (VOReviewPaperSearchCondition) session.getAttribute(condName);
		User u = (User) session.getAttribute("user");
		if (c == null) {
			c = new VOReviewPaperSearchCondition();
			c.setStatus("");
			c.setAtTab2(false);
			// request.removeAttribute("tab2");
		} else {
			c.setAtTab2(true);
		}

		MySQLAccessReviewPaper o = new MySQLAccessReviewPaper();
		ArrayList reviewPaperList = o.findReviewPapers(c);
		injectReviewResource(reviewPaperList, request);
		request.setAttribute("reviewPaperList", reviewPaperList);

		// --------------------------------------------------------------
		if (!c.isAtTab2()) {
			request.removeAttribute("tab2");
		} else {
			request.setAttribute("tab2", "tab2");
		}

		Object tab1 = request.getParameter("tab1");
		if (tab1 != null) {
			request.setAttribute("tab1", tab1);
		}

		// --------------------------------------------------------------
		MySQLAccessCompany_B0 o2 = new MySQLAccessCompany_B0();
		ArrayList acceptedCompanies = o2.findAcceptedCompaniesB0();
		injectCompanyResource(acceptedCompanies, request);
		request.setAttribute("compList", acceptedCompanies);
		// ---------------------------------------------
		return c;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("statuses", ReviewPaper.getCaesStatus(request));
		return referenceData;
	}
}