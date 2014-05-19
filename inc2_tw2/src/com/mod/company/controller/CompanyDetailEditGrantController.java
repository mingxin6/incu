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

public class CompanyDetailEditGrantController extends SimpleFormController {

	public CompanyDetailEditGrantController() {
		setCommandClass(Company.class);
		setCommandName("comp");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Company comp = (Company) command;
		MySQLAccess o = new MySQLAccess();
		o.updateGrant(comp, request);
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