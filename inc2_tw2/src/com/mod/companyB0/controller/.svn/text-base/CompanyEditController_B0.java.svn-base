package com.mod.companyB0.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;
import com.mkyong.customer.controller.SelectCompanyStatuses_B;
import com.model.Company;

public class CompanyEditController_B0 extends SimpleFormController {

	public CompanyEditController_B0() {
		setCommandClass(Company.class);
		setCommandName("comp");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Company comp = (Company) command;
		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		try {
			o.updateCompanyB0(comp, request);
			// o.updateCompanyDocuments(comp, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("compView_B0.htm?compID=" + comp.uid));
		// return new ModelAndView(getSuccessView(), "comp", comp);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String uid = request.getParameter("uid");
		System.out.println("uid=" + uid);
		request.setAttribute("pagetype", "edit");

		Company comp = new Company();
		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		
			comp = o.readCompanyB0ByUniqueID(uid);// readCompByID(uid);
			comp.setCompStatusRS(request);
		
		return comp;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("statusCond_B", SelectCompanyStatuses_B.get());
		return referenceData;
	}
}