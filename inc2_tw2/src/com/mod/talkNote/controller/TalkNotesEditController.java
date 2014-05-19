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

public class TalkNotesEditController extends SimpleFormController {

	public TalkNotesEditController() {
		setCommandClass(TalkNotes.class);
		setCommandName("talkNotes");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {	
		TalkNotes talkNotes = (TalkNotes) command;
		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		try {
			o.updateTalkNotes(talkNotes, request);
		} catch (Exception e) {
			e.printStackTrace();
		}	

		return new ModelAndView(new RedirectView("TalkNotesById.htm?compId=" + talkNotes.getCompId()));
		
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String noteId = request.getParameter("talkNoteId");
		TalkNotes talkNotes = new TalkNotes();
		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		try {
			talkNotes = o.selectTalkNotesByNoteId(noteId);
			
			System.out.println("hhhhh xxx===getFileInfo() >>>"+talkNotes.getFileInfo().size());
			request.setAttribute("talkNotes", talkNotes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return talkNotes;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		return referenceData;
	}
}
