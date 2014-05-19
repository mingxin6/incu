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

public class RequestAddController extends SimpleFormController {

	public RequestAddController() {
		setCommandClass(TalkNotes.class);
		setCommandName("TalkNotes");
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
//		String compName = request.getParameter("Name");
		// request.setAttribute("compName", compName);
		TalkNotes obj = new TalkNotes();
		return obj;
	}

	
}
