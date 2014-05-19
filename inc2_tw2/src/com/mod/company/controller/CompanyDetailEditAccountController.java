package com.mod.company.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;
import com.mod.companyUser.controller.MySQLAccessCompanyUser;
import com.model.Company;
import com.model.CompanyUser;
import com.model.User;

public class CompanyDetailEditAccountController extends SimpleFormController {

	public CompanyDetailEditAccountController() {
		setCommandClass(Company.class);
		setCommandName("comp");
	}

	/**
	 * useless, kept for reference
	 */
	@Override
	protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse res, Object obj,
			BindException errors) throws Exception {

		// // System.out
		// // .println("processFormSubmissionprocessFormSubmissionprocessFormSubmissionprocessFormSubmission !!!!");
		// // CompanyDetailEditIpValidator validator =
		// // (CompanyDetailEditIpValidator) getValidator();
		// // validator.validateHttpRequestParameters(req, errors);
		//
		// // ... more your code ...
		// String[] myno = request.getParameterValues("myno");
		// String[] myname = request.getParameterValues("myname");
		// String[] mycountry = request.getParameterValues("mycountry");
		// String[] mydate = request.getParameterValues("mydate");
		// if (myno != null) {
		// for (int i = 0; i < myno.length; i++) {
		// if (myno[i].trim().equals("")) {
		// errors.reject("userid.userpwd.invalid");
		// }
		//
		// System.out.println("xxxooo  vv  newIp=>" + myno[i] + ","
		// + myname[i] + "," + mycountry[i] + "," + mydate[i]);
		// }
		// }

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

		o.updateAccount(comp, request);

		return new ModelAndView(new RedirectView("compDetailView.htm?compID=" + comp.uid));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String uid = request.getParameter("uid");
		request.setAttribute("pagetype", "edit");

		MySQLAccess o = new MySQLAccess();
		Company comp = o.readCompByUniqueID(uid);
		comp.setCompStatusRS(request);
		String compID = comp.getUid();

		// 帳號資料
		MySQLAccessCompanyUser o4 = new MySQLAccessCompanyUser();
		ArrayList compUsers = (ArrayList) o4.findCompanyUsersByCompId(compID);
		System.out.println("compUsers size=" + compUsers.size());
		if (compUsers.size() > 0) {
			CompanyUser cu = (CompanyUser) compUsers.get(0);
			cu.setEntityStatusRS(request);
			comp.setUserLoginId(cu.getUserLoginId());
			comp.setUserLoginPwdClearText("");
			comp.setAccountStatus(cu.getEntityStatusRS());
		} else {
			comp.setUserLoginId("");
			comp.setUserLoginPwdClearText("");
			comp.setAccountStatus("");
		}

		return comp;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		return referenceData;
	}
}