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
import org.springframework.web.servlet.view.RedirectView;

import com.mkyong.customer.controller.SelectCompanyStatuses_B;
import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.model.Company;
import com.vo.VOCompListCondition_B;

public class CompanyWaitListController_B extends SimpleFormController {

	public CompanyWaitListController_B() {
		setCommandClass(VOCompListCondition_B.class);
		setCommandName("compListCondition_B");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		VOCompListCondition_B cond = (VOCompListCondition_B) command;
		HttpSession session = request.getSession(false);

		// -------------------------------------------------------------
		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		ArrayList ar = o.readCompWaitList_B0(cond); // 取得狀態是通過審核者
		
		for(int i=0;i<ar.size();i++){
			Company comp=(Company)ar.get(i);
			comp.setCompStatusRS(request);
		}
		request.setAttribute("compList", ar);
		request.setAttribute("statusCond_B", SelectCompanyStatuses_B.get());
		session.setAttribute("compListCondition_B", cond);
		// return new ModelAndView("companyList_B", "compListCondition_B", cond);
		return new ModelAndView(new RedirectView("compWaitList_B.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		VOCompListCondition_B c = new VOCompListCondition_B();
		c = (VOCompListCondition_B) session.getAttribute("compListCondition_B");
		if (c == null)
			c = new VOCompListCondition_B();
		return c;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		VOCompListCondition_B c = (VOCompListCondition_B) session.getAttribute("compListCondition_B");
		if (c == null) {
			c = new VOCompListCondition_B();
		}

		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		ArrayList ar = o.readCompWaitList_B0(c); // 取得狀態是通過審核者
		for(int i=0;i<ar.size();i++){
			Company comp=(Company)ar.get(i);
			comp.setCompStatusRS(request);
		}
		Map referenceData = new HashMap();
		referenceData.put("statusCond_B", SelectCompanyStatuses_B.get());
		referenceData.put("compList", ar);
		return referenceData;
	}
}