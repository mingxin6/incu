package com.mod.company.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.talkNote.controller.MySQLAccessTalkNote;
import com.model.TalkNotes;

public class CompanyTalkNoteController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String talkNoteId = request.getParameter("talkNoteId");
		

		
		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		
//		TalkNotes	obj = o.selectTalkNotesByNoteId(noteId);
		TalkNotes talknote = o.selectTalkNotesByNoteId2(talkNoteId, request);
//		TalkNotes	obj = o.selectTalkNotesByNoteId2(noteId,request);
		
		String compId = request.getParameter("compId");
		String compName = request.getParameter("compName");
		request.setAttribute("compName", compName);
		request.setAttribute("compId", compId);
		return new ModelAndView("companyTalkNote", "TalkNotes", talknote);

	}
}
