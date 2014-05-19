package com.mod.companyUser.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.company.controller.MySQLAccessCompany;
import com.model.Company;
import com.model.CompanyUser;
import com.model.Teacher;
import com.model.User;
import com.vo.VOCompListCondition;

public class CompanyUserAddController extends SimpleFormController {

	public CompanyUserAddController() {
		setCommandClass(CompanyUser.class);
		setCommandName("companyUser");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		CompanyUser companyUser = (CompanyUser) command;
		System.out.println("companyUser getCompName====>" + companyUser.getCompName());
		new MySQLAccessCompanyUser().insertCompanyUsers(companyUser, request);
		return new ModelAndView(new RedirectView("companyUserList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		CompanyUser obj = new CompanyUser();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		MySQLAccessCompany o = new MySQLAccessCompany();
		ArrayList ar = o.readCompList(new VOCompListCondition());

		for(int i=0;i<ar.size();i++){
			Company comp=(Company)ar.get(i);
			comp.setCompStatusRS(request);
		}
		
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < ar.size(); i++) {
			Company comp = (Company) ar.get(i);
			sb.append("\"");
			sb.append(comp.compName);
			sb.append("\"");
			if (i < ar.size() - 1)
				sb.append(",");
		}
		String sss = sb.toString();

		Map referenceData = new HashMap();
		referenceData.put("complist", sss);
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		return referenceData;
	}
}
