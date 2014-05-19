package com.mod.company.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mkyong.customer.controller.Selects;
import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.model.Company;

public class CompanyDetailEditController_B extends SimpleFormController {

	public CompanyDetailEditController_B() {
		setCommandClass(Company.class);
		setCommandName("comp");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Company comp = (Company) command;
		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();

		o.updateCompanyB0(comp, request);
		// o.updateCompanyDocuments(comp, request);

		// return new ModelAndView(new RedirectView("compList_B.htm"));
		// return new ModelAndView(getSuccessView(), "comp", comp);
		return new ModelAndView(new RedirectView("compDetailView_B.htm?compID=" + comp.getUid()));

	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String uid = request.getParameter("compID");
		// String uid = request.getParameter("uid");
		// System.out.println("uid=" + uid);
		// request.setAttribute("pagetype", "edit");

		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();

		Company comp = o.readCompanyB0ByUniqueID(uid);// readCompByID(uid);
		comp.setCompStatusRS(request);
		return comp;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("statusCond", Selects.getCompanyStatusConditionB0(request));
		referenceData.put("compKind", Selects.getCompanyKind(request));
		referenceData.put("compDomain", Selects.getCompanyDomain(request));
		referenceData.put("innoKind", Selects.getInnoKind(request));
		return referenceData;
	}
}