package com.mod.talkNote.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.TalkNotes;

public class RequestClosePMController extends RequestCloseController {

	public RequestClosePMController() {
		setCommandClass(TalkNotes.class);
		setCommandName("TalkNotes");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		TalkNotes obj = xxx(request, command);
		return new ModelAndView(new RedirectView("requestViewPM.htm?noteId=" + obj.getTalkNoteId()));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String noteId = request.getParameter("noteId");
		MySQLAccessRequest o = new MySQLAccessRequest();
		TalkNotes obj = o.selectTalkNotesByNoteId(noteId);
		obj.setCaseStatusRS(request);
		obj.setTypeRS(request);
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("compId", request.getParameter("compId"));
		return referenceData;
	}
}
