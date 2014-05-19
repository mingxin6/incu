package com.mod.talkNote.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;

import com.model.TalkNotes;

public class RequestViewTeacherController extends RequestViewController {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TalkNotes obj = xxx(request);
		return new ModelAndView("requestViewTeacher", "TalkNotes", obj);

	}
}
