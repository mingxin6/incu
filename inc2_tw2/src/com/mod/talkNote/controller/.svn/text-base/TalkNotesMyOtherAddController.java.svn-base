package com.mod.talkNote.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccessMyBatis;
import com.model.Company;
import com.model.Staff;
import com.model.TalkNotes;
import com.model.User;

public class TalkNotesMyOtherAddController extends SimpleFormController {

	public TalkNotesMyOtherAddController() {
		setCommandClass(TalkNotes.class);
		setCommandName("TalkNotes");
	}
	
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		String compId = u.getCompid();

		// ---------------------------------------------------
//		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
//		o.openSession();
//		Company comp = o.findCompanyByCompId(compId);
//		Staff am = o.findStaffById(comp.getAmId());
//		o.closeSession();
		// ---------------------------------------------------

		TalkNotes talkNote = (TalkNotes) command;
		MySQLAccessRequest o2 = new MySQLAccessRequest();
		o2.insertTalkNotes(TalkNotes.ConsultType_Other, u.getUid(), u.getUserName(), u.getUid(), u.getUserName(),
				talkNote, request);

//		request.setAttribute("amName", am.getName());/

		return new ModelAndView(new RedirectView("talkNotesMyListOther.htm"));
	}
	
	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
//		String compName = request.getParameter("Name");
		// request.setAttribute("compName", compName);
		TalkNotes obj = new TalkNotes();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
//		referenceData.put("amName", request.getParameter("amName"));
		return referenceData;
	}
}
