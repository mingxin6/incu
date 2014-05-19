package com.mod.company.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.mod.tag.controller.MySQLAccessTag;
import com.mod.talkNote.controller.MySQLAccessTalkNote;
import com.model.Company;
import com.model.TalkNotes;

public class CompanyAcceptController_B extends SimpleFormController {
	public CompanyAcceptController_B() {
		setCommandClass(Company.class);
		setCommandName("comp");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Company comp = (Company) command;
		String compID = comp.getUid();// request.getParameter("compID");
		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		o.receiveNewApplyB0(compID);

		return new ModelAndView(new RedirectView("compDetailView_B.htm?compID=" + compID));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String compID = request.getParameter("compID");
		System.out.println("compID=" + compID);
		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		Company comp = o.findNewApply(compID);
		comp.setCompStatusRS(request);
		return comp;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		return referenceData;
	}
}
