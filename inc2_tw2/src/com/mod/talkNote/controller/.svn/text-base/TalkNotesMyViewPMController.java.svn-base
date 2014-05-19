package com.mod.talkNote.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.entity.PotentiallyCompanyNotes;
import com.model.TalkNotes;

public class TalkNotesMyViewPMController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String talkNoteId = request.getParameter("talkNoteId");

		// String compId = request.getParameter("compId");

		// PotentiallyCompanyNotes pcn = new PotentiallyCompanyNotes();
		// TalkNotes talknote = new TalkNotes();
		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		TalkNotes talknote = o.selectTalkNotesByNoteId2(talkNoteId, request);
		talknote.setCaseStatusRS(request);
		// String compName = request.getParameter("compName");
		// request.setAttribute("compName", compName);
		// request.setAttribute("compId", compId);
		request.setAttribute("talkNoteId", talkNoteId);

		return new ModelAndView("talkNotesMyViewPM", "TalkNotes", talknote);

	}
}
