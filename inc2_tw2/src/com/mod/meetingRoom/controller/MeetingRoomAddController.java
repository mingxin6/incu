package com.mod.meetingRoom.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.MeetingRoom;

public class MeetingRoomAddController extends SimpleFormController {

	public MeetingRoomAddController() {
		setCommandClass(MeetingRoom.class);
		setCommandName("meetingRoom");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		MeetingRoom obj = (MeetingRoom) command;
		try {
			new MySQLAccessMeetingRoom().insertMeetingRoom(obj, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("meetingRoomList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		// String compName = request.getParameter("compName");
		// String compId = request.getParameter("compId");
		// request.setAttribute("compName", compName);
		MeetingRoom obj = new MeetingRoom();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("compId", request.getParameter("compId"));
		referenceData.put("statuses", MeetingRoom.getEntityValidStatus(request));
		return referenceData;
	}
}
