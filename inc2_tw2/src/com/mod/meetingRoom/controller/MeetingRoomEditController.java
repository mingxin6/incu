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

public class MeetingRoomEditController extends SimpleFormController {

	public MeetingRoomEditController() {
		setCommandClass(MeetingRoom.class);
		setCommandName("meetingRoom");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		MeetingRoom obj = (MeetingRoom) command;

		System.out.println("meetingRoom uid=" + obj.getUid());

		MySQLAccessMeetingRoom o = new MySQLAccessMeetingRoom();
		try {
			o.updateMeetingRoom(obj, request);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView(new RedirectView("meetingRoomView.htm?uid=" + obj.getUid()));

	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String uid = request.getParameter("uid");
		MeetingRoom obj = new MeetingRoom();
		MySQLAccessMeetingRoom o = new MySQLAccessMeetingRoom();
		try {
			obj = o.findMeetingRoomById(uid);
			request.setAttribute("meetingRoom", obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("statuses", MeetingRoom.getEntityValidStatus(request));
		return referenceData;
	}
}
