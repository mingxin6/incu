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

import com.mkyong.customer.controller.Selects;
import com.mod.staff.controller.MySQLAccessStaff;
import com.model.Company;

public class CompanyNewController extends SimpleFormController {

	public CompanyNewController() {
		setCommandClass(Company.class);
		setCommandName("comp");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		// request.setAttribute("category", request.getParameter("category"));
		Company comp = (Company) command;

		// comp.uid = KeyMaker.newKey();
		MySQLAccessCompany o = new MySQLAccessCompany();
		o.insertCompany(comp);
		return new ModelAndView(new RedirectView("compList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {

		{
			// 列出 AM/PM
			ArrayList ar = new ArrayList();
			MySQLAccessStaff o2 = new MySQLAccessStaff();
			try {
				ar = o2.findAllStaffs(null);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("staffList", ar);
		}

		request.setAttribute("pagetype", "new");

		Company comp = new Company();
		return comp;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		// request.setAttribute("category", request.getParameter("category"));
		Map referenceData = new HashMap();

		referenceData.put("statusCond", Selects.getCompanyStatusCondition(request));
		referenceData.put("compKind", Selects.getCompanyKind(request));
		referenceData.put("compDomain", Selects.getCompanyDomain(request));
		referenceData.put("innoKind", Selects.getInnoKind(request));

		return referenceData;
	}
}