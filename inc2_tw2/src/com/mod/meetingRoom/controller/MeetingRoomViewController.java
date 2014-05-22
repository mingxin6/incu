package com.mod.meetingRoom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.meetingRoom.controller.MySQLAccessMeetingRoom;
import com.model.MeetingRoom;

public class MeetingRoomViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uid = request.getParameter("uid");
		MeetingRoom obj = new MeetingRoom();
		MySQLAccessMeetingRoom o = new MySQLAccessMeetingRoom();
		try {
			obj = o.findMeetingRoomById(uid);
			obj.setEntityStatusRS(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("meetingRoomView", "meetingRoom", obj);
	}
}
