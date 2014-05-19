package com.mod.talkNote.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;

import com.model.TalkNotes;

public class RequestViewPMController extends RequestViewController {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		request.setAttribute("pmName", request.getParameter("pmName"));
		TalkNotes obj = xxx(request);
		obj.setCaseStatusRS(request);
		obj.setTypeRS(request);
		return new ModelAndView("requestViewPM", "TalkNotes", obj);

	}
}
