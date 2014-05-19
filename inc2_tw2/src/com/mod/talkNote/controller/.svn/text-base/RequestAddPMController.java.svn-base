package com.mod.talkNote.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccessMyBatis;
import com.model.Company;
import com.model.Staff;
import com.model.TalkNotes;
import com.model.User;

public class RequestAddPMController extends RequestAddController {

	public RequestAddPMController() {
		super();
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		String compId = u.getCompid();

		// ---------------------------------------------------
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		Company comp = o.findCompanyByCompId(compId);
		Staff pm = o.findStaffById(comp.getPmId());
		o.closeSession();
		// ---------------------------------------------------

		TalkNotes talkNote = (TalkNotes) command;
		MySQLAccessRequest o2 = new MySQLAccessRequest();
		o2.insertTalkNotes(TalkNotes.ConsultType_PM, comp.getUid(), comp.getCompName(), comp.getPmId(), pm.getName(),
				talkNote, request);

		request.setAttribute("pmName", pm.getName());

		return new ModelAndView(new RedirectView("requestListPM.htm"));
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("pmName", request.getParameter("pmName"));
		return referenceData;
	}
}
