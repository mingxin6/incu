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

import com.mkyong.customer.controller.Selects;
import com.model.Company;
import com.vo.VOCompListCondition;

public class CompanyListController extends SimpleFormController {

	public CompanyListController() {
		setCommandClass(VOCompListCondition.class);
		setCommandName("compListCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		VOCompListCondition compListCondition = (VOCompListCondition) command;
		ArrayList ar = new ArrayList();
		
			MySQLAccessCompany o = new MySQLAccessCompany();
			ar = o.readCompList(compListCondition);

			for(int i=0;i<ar.size();i++){
				Company comp=(Company)ar.get(i);
				comp.setCompStatusRS(request);
				comp.setDomainRS(request);
				comp.setKindRS(request);
				comp.setInnoKindRS(request);
			}
		
		
		request.setAttribute("compList", ar);
		request.setAttribute("statusCond", Selects.getCompanyStatusCondition(request));
		request.getSession(false).setAttribute("compListCondition", compListCondition);
		
		return new ModelAndView("companyList", "compListCondition", compListCondition);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		
		//String pageNumber=request.getParameter("pageNumber");
		//request.setAttribute("pageNumber", pageNumber);
		
		HttpSession session = request.getSession(false);
		VOCompListCondition voCompListCondition = (VOCompListCondition) session.getAttribute("compListCondition");
		if (voCompListCondition == null)
			voCompListCondition = new VOCompListCondition();
		return voCompListCondition;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		VOCompListCondition compListCondition = (VOCompListCondition) session.getAttribute("compListCondition");
		if (compListCondition == null) {
			compListCondition = new VOCompListCondition();
		}
		
		ArrayList ar = new ArrayList();
		
			MySQLAccessCompany o = new MySQLAccessCompany();
			ar = o.readCompList(compListCondition);

			for(int i=0;i<ar.size();i++){
				Company comp=(Company)ar.get(i);
				comp.setCompStatusRS(request);
				comp.setDomainRS(request);
				comp.setKindRS(request);
				comp.setInnoKindRS(request);
			}
		
		
		Map referenceData = new HashMap();
		referenceData.put("statusCond", Selects.getCompanyStatusCondition(request));
		referenceData.put("compList", ar);

		return referenceData;
	}
}