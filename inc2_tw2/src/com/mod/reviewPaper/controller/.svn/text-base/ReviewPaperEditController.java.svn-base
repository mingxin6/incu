package com.mod.reviewPaper.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
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
import com.model.ReviewPaperResult;
import com.model.Reviewer;

public class ReviewPaperEditController extends SimpleFormController {
	public ReviewPaperEditController() {
		setCommandClass(ReviewPaper.class);
		setCommandName("reviewPaper");
	}

	@Override
	protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse res, Object command,
			BindException errors) throws Exception {
		ReviewPaper reviewPaper = (ReviewPaper) command;
		String reviewPaperUid = reviewPaper.getReviewPaperUid();
		// System.out.println("reviewPaper===>" + reviewPaper.getReviewPaperUid());

		String[] compChecked = request.getParameterValues("compChecked");
		if (compChecked == null) {
			errors.reject("reuired.compay");
		} else {
			// 檢查是否有企業已存在於其他審查案中

			MySQLAccessReviewPaper o = new MySQLAccessReviewPaper();
			for (int i = 0; i < compChecked.length; i++) {
				String compId = compChecked[i];

				String[] a = compId.split("_");
				String cId = a[0];
				String cName = a[1];
				ArrayList ReviewPaperResults = o.findEntryWithCompanyId(cId);

				// System.out.println(cId +"  <<< has >>>"+ReviewPaperResults.size()+" recs");

				// reviewPaperUid

				HashSet xxx = new HashSet();
				for (int k = 0; k < ReviewPaperResults.size(); k++) {
					ReviewPaperResult r = (ReviewPaperResult) ReviewPaperResults.get(k);

					// System.out
					// .println(compId + "~~~~reviewPaperUid=" + reviewPaperUid + "<-->" + r.getReviewPaperUid());

					if (r.getReviewPaperUid().equals(reviewPaperUid)) {
						System.out.println("hit !!!");
						continue;
					}
					xxx.add(r.getReviewPaperUid()); // 此公司存在於其他的審查
				}

				Iterator it = xxx.iterator();
				while (it.hasNext()) {
					String myReviewPaperUid = (String) it.next();

					ReviewPaper rrr = o.findReviewPaperByReviewPaperUid(myReviewPaperUid);

					String[] errorArgs = new String[] { cName, rrr.getTitle() };
					errors.reject("comp.duplicate.in.other.review", errorArgs, "企業已存在於其他審查中");
				}
			}

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
			return onSubmit(request, res, command, errors);
		}

		return super.processFormSubmission(request, res, command, errors);
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		ReviewPaper reviewPaper = (ReviewPaper) command;
		String reviewPaperUid = reviewPaper.getReviewPaperUid();
		System.out.println("reviewPaper===>" + reviewPaper.getReviewPaperUid());

		String[] compChecked = request.getParameterValues("compChecked");
		// for (int i = 0; i < compChecked.length; i++) {
		// System.out.println("compChecked -->" + compChecked[i]);
		// }

		String[] p_reviewerChecked = request.getParameterValues("p_reviewerChecked");
		// for (int i = 0; i < p_reviewerChecked.length; i++) {
		// System.out.println("p_reviewerChecked -->" + p_reviewerChecked[i]);
		// }

		String[] m_reviewerChecked = request.getParameterValues("m_reviewerChecked");
		// for (int i = 0; i < m_reviewerChecked.length; i++) {
		// System.out.println("m_reviewerChecked -->" + m_reviewerChecked[i]);
		// }

		MySQLAccessReviewPaper o = new MySQLAccessReviewPaper();
		o.updateReviewPaper(reviewPaper, request, compChecked, p_reviewerChecked, m_reviewerChecked);

		// return new ModelAndView(new RedirectView("reviewPaperList.htm"));
		return new ModelAndView(new RedirectView("reviewPaperView.htm?reviewPaperUid=" + reviewPaperUid));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String reviewPaperUid = request.getParameter("reviewPaperUid");
		ReviewPaper reviewPaper = new MySQLAccessReviewPaper().findReviewPaperByReviewPaperUid(reviewPaperUid);
		reviewPaper.setStatusRS(request);
		Iterator it = reviewPaper.getMp().keySet().iterator();
		while (it.hasNext()) {// 每個企業
			ReviewCompany reviewCompany = (ReviewCompany) it.next();
			reviewCompany.setFinalPassRS(request);
		}
		
		
//		System.out.println(" bbbbbbbbbbbxxxxxxxxxxxx reviewPaper remark="+reviewPaper.getRemark());
		
		// --------------------------------------------------------------
		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		ArrayList acceptedCompanies = acceptedCompanies = o.findAcceptedAndReviewedCompaniesB0();
		for (int i = 0; i < acceptedCompanies.size(); i++) {
			Company comp = (Company) acceptedCompanies.get(i);
			comp.setCompStatusRS(request);
			comp.setDomainRS(request);
			comp.setKindRS(request);
			comp.setInnoKindRS(request);
			
			if (reviewPaper.hasCompanyUid(comp.getUid())) {
				comp.setExist(true);
			} else {
				comp.setExist(false);
			}
		}
		request.setAttribute("compList", acceptedCompanies);

		// --------------------------------------------------------------
		MySQLAccessReviewer o2 = new MySQLAccessReviewer();
		ArrayList reviewers = o2.findAllReviewers();
		for (int i = 0; i < reviewers.size(); i++) {
			Reviewer reviewer = (Reviewer) reviewers.get(i);
			if (reviewPaper.hasPaperReviewerUid(reviewer.getUid())) {
				reviewer.setExistPaperRiviewer(true);
			} else {
				reviewer.setExistPaperRiviewer(false);
			}

			if (reviewPaper.hasMeetingReviewerUid(reviewer.getUid())) {
				reviewer.setExistMeetingRiviewer(true);
			} else {
				reviewer.setExistMeetingRiviewer(false);
			}

		}
		request.setAttribute("reviewerList", reviewers);

		return reviewPaper;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("comp", acceptedCompanies);
		return referenceData;
	}
}