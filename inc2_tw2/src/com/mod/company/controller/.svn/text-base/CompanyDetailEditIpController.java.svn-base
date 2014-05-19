package com.mod.company.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;
import com.mkyong.customer.controller.Selects;
import com.model.Company;

public class CompanyDetailEditIpController extends SimpleFormController {

	public CompanyDetailEditIpController() {
		setCommandClass(Company.class);
		setCommandName("comp");
	}

	/**
	 * useless, kept for reference
	 */
	@Override
	protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse res, Object obj,
			BindException errors) throws Exception {

		// System.out
		// .println("processFormSubmissionprocessFormSubmissionprocessFormSubmissionprocessFormSubmission !!!!");
		// CompanyDetailEditIpValidator validator =
		// (CompanyDetailEditIpValidator) getValidator();
		// validator.validateHttpRequestParameters(req, errors);

		// ... more your code ...
		String[] myno = request.getParameterValues("myno");
		String[] myname = request.getParameterValues("myname");
		String[] mycountry = request.getParameterValues("mycountry");
		String[] mydate = request.getParameterValues("mydate");
		if (myno != null) {
			for (int i = 0; i < myno.length; i++) {
				if (myno[i].trim().equals("")) {
					errors.reject("userid.userpwd.invalid");
				}

				System.out.println("xxxooo  vv  newIp=>" + myno[i] + "," + myname[i] + "," + mycountry[i] + ","
						+ mydate[i]);
			}
		}

		if (!errors.hasErrors()) {
			// return new ModelAndView(new RedirectView(getSuccessView()));
			return onSubmit(request, res, obj, errors);
		}

		return super.processFormSubmission(request, res, obj, errors);
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Company comp = (Company) command;
		MySQLAccess o = new MySQLAccess();
		o.updateIP(comp, request);
		// return new ModelAndView(getSuccessView(), "comp", comp);
		return new ModelAndView(new RedirectView("compDetailView.htm?compID=" + comp.uid));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String uid = request.getParameter("uid");
		request.setAttribute("pagetype", "edit");

		Company comp = new Company();
		MySQLAccess o = new MySQLAccess();
		try {
			comp = o.readCompByUniqueID(uid);
			comp.setCompStatusRS(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return comp;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("statusCond", Selects.getCompanyStatusConditionB0(request));
		return referenceData;
	}
}