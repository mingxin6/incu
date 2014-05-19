package com.mod.talkNote.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.mkyong.customer.controller.SelectMonth;
import com.mkyong.customer.controller.SelectYear;
import com.mod.company.controller.MySQLAccessCompany;
import com.mod.staff.controller.MySQLAccessStaff;
import com.model.Company;
import com.model.Staff;
import com.model.TalkNotes;
import com.model.User;
import com.vo.VOTalkNotesSearchCondition;

public class RequestListController extends SimpleFormController {

	public String conditionName = "";

	public RequestListController(String conditionName) {
		this.conditionName = conditionName;
		setCommandClass(VOTalkNotesSearchCondition.class);
		setCommandName(conditionName);
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		VOTalkNotesSearchCondition c = (VOTalkNotesSearchCondition) command;

		MySQLAccessRequest o = new MySQLAccessRequest();
		ArrayList ar = o.findTalkNotesBySearch(c, request);// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		for (int i = 0; i < ar.size(); i++) {
			TalkNotes obj = (TalkNotes) ar.get(i);
			obj.setCaseStatusRS(request);
			obj.setTypeRS(request);
		}
		request.setAttribute("talkNotesList", ar);
		//
		HttpSession session = request.getSession(false);
		session.setAttribute(conditionName, c);
		//
		// User u = (User) session.getAttribute("user");
		// String compName = u.getUserComp();
		// MySQLAccessCompany oo = new MySQLAccessCompany();
		// Company comp = oo.findCompanyByCompName(compName);

		// String amId = comp.getAmId();
		// MySQLAccessStaff o2 = new MySQLAccessStaff();
		// Staff stf = o2.findStaffById(amId);
		// if (stf != null) {
		// String amName = stf.getName();
		// request.setAttribute("amName", amName);
		// } else {
		// request.setAttribute("amName", "(尚未指定)");
		// }
		//
		request.setAttribute("selectYear", SelectYear.get());
		request.setAttribute("selectMonth", SelectMonth.get());

		return new ModelAndView("talkNotesList", conditionName, c);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		VOTalkNotesSearchCondition c = (VOTalkNotesSearchCondition) session.getAttribute(conditionName);
		if (c == null)
			c = new VOTalkNotesSearchCondition();
		return c;
	}

	void xxx(Company comp, VOTalkNotesSearchCondition c, HttpServletRequest request) {

	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		// String type = request.getParameter("type");

		HttpSession session = request.getSession(false);
		VOTalkNotesSearchCondition c = (VOTalkNotesSearchCondition) session.getAttribute(conditionName);
		if (c == null) {
			c = new VOTalkNotesSearchCondition();
		}

		User u = (User) session.getAttribute("user");
		c.setCompId(u.getCompid());// 用來區分是哪家公司的輔導申請
		c.setCompName(u.getUserComp());// 用來區分是哪家公司的輔導申請

		// -----------------------------------------------------
		MySQLAccessCompany oo = new MySQLAccessCompany();
		Company comp = oo.findCompanyByCompName(u.getUserComp());
		comp.setCompStatusRS(request);
		xxx(comp, c, request);

		// -----------------------------------------------------
		MySQLAccessRequest o = new MySQLAccessRequest();
		ArrayList ar = o.findTalkNotesBySearch(c, request); // //////////////////////////////
		for (int i = 0; i < ar.size(); i++) {
			TalkNotes obj = (TalkNotes) ar.get(i);
			obj.setCaseStatusRS(request);
			obj.setTypeRS(request);
		}
		// -----------------------------------------------------
		Map referenceData = new HashMap();
		referenceData.put("talkNotesList", ar);
		referenceData.put("selectYear", SelectYear.get());
		referenceData.put("selectMonth", SelectMonth.get());

		return referenceData;
	}
}