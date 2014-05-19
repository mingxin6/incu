package com.mod.company.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.mkyong.customer.controller.SelectCompanyStatuses_B;
import com.mkyong.customer.controller.Selects;
import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.model.Company;
import com.vo.VOCompListCondition_B;

public class CompanyListController_B extends SimpleFormController {

	public CompanyListController_B() {
		setCommandClass(VOCompListCondition_B.class);
		setCommandName("compListCondition_B");
	}

	void injectResource(ArrayList ar, HttpServletRequest request) {
		for (int i = 0; i < ar.size(); i++) {
			Company c = (Company) ar.get(i);
			c.setCompStatusRS(request);
			c.setDomainRS(request);
			c.setKindRS(request);
			c.setInnoKindRS(request);
		}
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		VOCompListCondition_B compListCondition_B = (VOCompListCondition_B) command;
		HttpSession session = request.getSession(false);
		// -------------------------------------------------------------

		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		ArrayList ar = o.readCompList_B0(compListCondition_B);
		injectResource(ar, request);

		request.setAttribute("compList", ar);
		request.setAttribute("statusCond_B", Selects.getCompanyStatusConditionB0(request));
		session.setAttribute("compListCondition_B", compListCondition_B);
		//
		return new ModelAndView("companyList_B", "compListCondition_B", compListCondition_B);

	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		VOCompListCondition_B voCompListCondition_B = new VOCompListCondition_B();
		voCompListCondition_B = (VOCompListCondition_B) session.getAttribute("compListCondition_B");
		if (voCompListCondition_B == null)
			voCompListCondition_B = new VOCompListCondition_B();
		return voCompListCondition_B;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		VOCompListCondition_B compListCondition_B = (VOCompListCondition_B) session.getAttribute("compListCondition_B");
		if (compListCondition_B == null) {
			compListCondition_B = new VOCompListCondition_B();
		}

		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		ArrayList ar = o.readCompList_B0(compListCondition_B);
		injectResource(ar, request);
		
		Map referenceData = new HashMap();
		referenceData.put("statusCond_B", Selects.getCompanyStatusConditionB0(request));
		referenceData.put("compList", ar);
		return referenceData;
	}
}