package com.mod.talkNote.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.model.TalkNotes;

public class TalkNotesByIdController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String compId = request.getParameter("compId");
		
		System.out.println("TalkNotesByIdController xxxx ~~~~~ compId="+compId);
		
		String compName = request.getParameter("compName");

		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		List<TalkNotes> list = o.findTalkNotesByCompanyId(compId);

		request.setAttribute("compName", compName);
		request.setAttribute("compId", compId);
		session.setAttribute("tnlist", list);

		return new ModelAndView("talkNotesById", "tnlist", list);
	}
}
