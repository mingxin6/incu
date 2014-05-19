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

public class RequestCloseController extends SimpleFormController {

	public RequestCloseController() {
		setCommandClass(TalkNotes.class);
		setCommandName("TalkNotes");
	}

	TalkNotes xxx(HttpServletRequest request, Object command) throws Exception {
		TalkNotes obj = (TalkNotes) command;
		obj.setStatus(TalkNotes.STAT_CLOSE);
		obj.markModifyinfo(request);
		MySQLAccessRequest o = new MySQLAccessRequest();
		o.updateTalkNotesScoreAndStatus(obj, request);
		return obj;
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String noteId = request.getParameter("noteId");
		MySQLAccessRequest o = new MySQLAccessRequest();
		TalkNotes obj = o.selectTalkNotesByNoteId(noteId);
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("compId", request.getParameter("compId"));
		return referenceData;
	}
}
