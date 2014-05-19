package com.mod.company.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.mkyong.customer.controller.Selects;
import com.mod.staff.controller.MySQLAccessStaff;
import com.model.Company;

public class CompanyDetailEditController extends SimpleFormController {
	public CompanyDetailEditController() {
		setCommandClass(Company.class);
		setCommandName("comp");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Company comp = (Company) command;

		
		
		MySQLAccess o = new MySQLAccess();
		o.updateCompany(comp, request);
		comp.setLogoFile(null);
		return new ModelAndView(getSuccessView(), "comp", comp);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String uid = request.getParameter("uid");
		System.out.println("uid=" + uid);

		{
			// 列出 AM/PM
			MySQLAccessStaff o2 = new MySQLAccessStaff();
			ArrayList ar = (ArrayList) o2.findOkStaffs();
			request.setAttribute("staffList", ar);
		}

		request.setAttribute("pagetype", "edit");

		Company comp = new Company();
		MySQLAccess o = new MySQLAccess();
		try {
			comp = o.readCompByUniqueID(uid);// readCompByID(uid);
			comp.setCompStatusRS(request);
		} catch (Exception e) {
			e.printStackTrace();
		}

		comp.setLogoFile(null);
		return comp;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("statusCond", Selects.getCompanyStatusCondition(request));
		referenceData.put("compKind", Selects.getCompanyKind(request));
		referenceData.put("compDomain", Selects.getCompanyDomain(request));
		referenceData.put("innoKind", Selects.getInnoKind(request));
		return referenceData;
	}
}