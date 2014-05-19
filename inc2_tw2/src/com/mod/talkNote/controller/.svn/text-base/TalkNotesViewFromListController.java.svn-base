package com.mod.talkNote.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.model.TalkNotes;

public class TalkNotesViewFromListController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String talkNoteId = request.getParameter("talkNoteId");
		String compId = request.getParameter("compId");

		
		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		
//		TalkNotes	obj = o.selectTalkNotesByNoteId(noteId);
		TalkNotes talknote = o.selectTalkNotesByNoteId2(talkNoteId, request);
//		TalkNotes	obj = o.selectTalkNotesByNoteId2(noteId,request);
		
		String compName = request.getParameter("compName");
		request.setAttribute("compName", compName);
		request.setAttribute("compId", compId);
		return new ModelAndView("talkNotesViewFromList", "TalkNotes", talknote);

	}
}
