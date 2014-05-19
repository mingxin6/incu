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

public class TalkNotesAddController extends SimpleFormController {

	public TalkNotesAddController() {
		setCommandClass(TalkNotes.class);
		setCommandName("TalkNotes");
	}
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		TalkNotes obj = (TalkNotes) command;

		
		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		try {
			o.insertTalkNotes(obj,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("TalkNotesById.htm?compId=" + obj.getCompId()));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String compName = request.getParameter("compName");
	
		request.setAttribute("compName", compName);
		TalkNotes obj = new TalkNotes();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("compId", request.getParameter("compId"));
		return referenceData;
	}
}
