package com.mod.talkNote.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;

import com.model.TalkNotes;

public class RequestViewAMController extends RequestViewController {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("mmmmmmmmmmmmmmm==>"+request.getParameter("amName"));
//		request.setAttribute("amName", request.getParameter("amName"));
		TalkNotes obj = xxx(request);
		obj.setCaseStatusRS(request);
		obj.setTypeRS(request);
		return new ModelAndView("requestViewAM", "TalkNotes", obj);

	}
}
