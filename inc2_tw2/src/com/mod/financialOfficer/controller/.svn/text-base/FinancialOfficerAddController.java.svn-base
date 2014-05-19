package com.mod.financialOfficer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.financialOfficer.controller.MySQLAccessFinancialOfficer;
import com.model.ActivityRec;
import com.model.FinancialOfficer;
import com.model.User;
import com.utils.UserUtil;

public class FinancialOfficerAddController extends SimpleFormController {

	public FinancialOfficerAddController() {
		setCommandClass(FinancialOfficer.class);
		setCommandName("financialOfficer");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		FinancialOfficer obj = (FinancialOfficer) command;
		new UserUtil().markCreater(request, obj);
		new UserUtil().markLastModify(request, obj);
		try {
			new MySQLAccessFinancialOfficer().insertFinancialOfficers(obj, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("financialOfficerList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		FinancialOfficer obj = new FinancialOfficer();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		return referenceData;
	}
}
