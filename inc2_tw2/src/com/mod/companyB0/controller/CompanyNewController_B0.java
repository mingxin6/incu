package com.mod.companyB0.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.mkyong.customer.controller.SelectCompanyStatuses_B;
import com.model.Company;
import com.model.User;
import com.utils.KeyMaker;
import com.utils.UserUtil;

/**
 * 
 * 外網申請進駐
 * 
 */
public class CompanyNewController_B0 extends SimpleFormController {
	public CompanyNewController_B0() {
		setCommandClass(Company.class);
		setCommandName("comp");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		
		MySQLAccessCompany_B0 o2 = new MySQLAccessCompany_B0();
		Company comp = (Company) command;
		comp.uid = "comp" + KeyMaker.newKey();
		comp.setMemberUid(u.getUid());
		comp.setCompStatus(Company.STATUS_APPLY);
		
		comp.markCreatinfo(request);
		try {
			o2.insertCompanyB0(comp, u); // !!!!!!!!!!!!!!!!!!!!!!!!!!
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("companyAdd_B0_Sent");
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		Company comp = new Company();
		return comp;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		//referenceData.put("statusCond_B", SelectCompanyStatuses_B.get());
		return referenceData;
	}
}