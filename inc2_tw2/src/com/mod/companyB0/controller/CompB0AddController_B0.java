package com.mod.companyB0.controller;

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
import com.mkyong.customer.controller.Selects;
import com.model.Company;
import com.model.User;
import com.utils.KeyMaker;
import com.utils.UserUtil;

/**
 * 中心人員申請進駐
 */
public class CompB0AddController_B0 extends SimpleFormController {
	public CompB0AddController_B0() {
		setCommandClass(Company.class);
		setCommandName("comp");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");

		MySQLAccessCompany_B0 o2 = new MySQLAccessCompany_B0();
		Company comp = (Company) command;
		comp.uid = "comp" + KeyMaker.newKey();
		comp.setMemberUid("staff");
		comp.setCompStatus(Company.STATUS_APPLY);

		comp.markCreatinfo(request);
		comp.markModifyinfo(request);
		try {
			o2.insertCompanyB0ByStaff(comp, u); // !!!!!!!!!!!!!!!!!!!!!!!!!!
		} catch (Exception e) {
			e.printStackTrace();
		}
		// return new ModelAndView("companyAdd_B0_Sent");
		return new ModelAndView(new RedirectView("compList_B.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		Company comp = new Company();
		return comp;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("compKind", Selects.getCompanyKind(request));
		referenceData.put("compDomain", Selects.getCompanyDomain(request));
		referenceData.put("innoKind", Selects.getInnoKind(request));
		return referenceData;
	}
}