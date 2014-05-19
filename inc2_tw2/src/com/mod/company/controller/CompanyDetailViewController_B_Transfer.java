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
import com.mod.talkNote.controller.MySQLAccessTalkNote;
import com.model.Company;

public class CompanyDetailViewController_B_Transfer extends
		SimpleFormController {

	public CompanyDetailViewController_B_Transfer() {
		setCommandClass(Company.class);
		setCommandName("comp");
	}

	@Override
	protected ModelAndView processFormSubmission(HttpServletRequest request,
			HttpServletResponse res, Object obj, BindException errors)
			throws Exception {
		String compUid = request.getParameter("compUid");
		if (compUid == null || compUid.equals("")) {
			errors.reject("company.uid.required");
		} else {
			Company comp = null;
			MySQLAccess o = new MySQLAccess();
			try {
				comp = o.readCompByUniqueID(compUid);
				comp.setCompStatusRS(request);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (comp != null)
				errors.reject("company.uid.already.existed");
		}

		if (!errors.hasErrors()) {
			return onSubmit(request, res, obj, errors);
		}

		return super.processFormSubmission(request, res, obj, errors);
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		String newCompUid = request.getParameter("compUid");
		System.out.println("new compid=" + newCompUid);

		Company comp = (Company) command;
		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		try {
			o.updateComapnyIdForStatusTransfer(comp.uid, newCompUid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("compList_B.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		request.setAttribute("pagetype", "edit");

		String uid = request.getParameter("uid");
		System.out.println("uid=" + uid);
		Company comp = new Company();
		MySQLAccess o = new MySQLAccess();
		try {
			comp = o.readCompByUniqueID(uid);// readCompByID(uid);
			comp.setCompStatusRS(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return comp;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("statusCond_B", SelectCompanyStatuses_B.get());
		return referenceData;
	}

}