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

public class TalkNotesViewController_B implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String noteId = request.getParameter("noteId");

		String compId = request.getParameter("compId");
	
		PotentiallyCompanyNotes pcn = new PotentiallyCompanyNotes();
		TalkNotes obj = new TalkNotes();
		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		try {
			obj = o.selectTalkNotesByNoteId(noteId);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		String compName = request.getParameter("compName");
		request.setAttribute("compName", compName);
		request.setAttribute("compId", compId);
		return new ModelAndView("talkNotesView_B", "TalkNotes", obj);

	}
}
