package com.mod.talkNote.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.model.TalkNotes;

public class RequestViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public TalkNotes xxx(HttpServletRequest request) throws Exception {
		String noteId = request.getParameter("noteId");
		String compId = request.getParameter("compId");

		TalkNotes obj = new TalkNotes();
		MySQLAccessRequest o = new MySQLAccessRequest();
		obj = o.selectTalkNotesByNoteId(noteId);
		obj.setCaseStatusRS(request);
		obj.setTypeRS(request);
		String compName = request.getParameter("compName");
		request.setAttribute("compName", compName);
		request.setAttribute("compId", compId);
		return obj;

	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
	// throws Exception {
	//
	// TalkNotes obj = xxx(request);
	// return new ModelAndView("requestView", "TalkNotes", obj);
	//
	// }
}
