package com.mod.meetingRoom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.model.A;
import com.vo.VOYearMonthCondition;

public class MeetingRoomListController extends SimpleFormController {

	public MeetingRoomListController() {
		setCommandClass(VOYearMonthCondition.class);
		setCommandName("voYearMonthCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) command;

		MySQLAccessMeetingRoom o = new MySQLAccessMeetingRoom();
		ArrayList ar = o.findAllMeetingRooms();
		for (int i = 0; i < ar.size(); i++) {
			A a = (A) ar.get(i);
			a.setEntityStatusRS(request);
		}

		request.setAttribute("meetingRoomList", ar);
		return new ModelAndView("meetingRoomList", "voYearMonthCondition", voYearMonthCondition);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) session.getAttribute("voYearMonthCondition");
		if (voYearMonthCondition == null)
			voYearMonthCondition = new VOYearMonthCondition();
		return voYearMonthCondition;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		ArrayList ar = new ArrayList();

		HttpSession session = request.getSession(false);
		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) session.getAttribute("voYearMonthCondition");
		if (voYearMonthCondition == null)
			voYearMonthCondition = new VOYearMonthCondition();

		MySQLAccessMeetingRoom o = new MySQLAccessMeetingRoom();
		try {
			ar = o.findAllMeetingRooms();
			for (int i = 0; i < ar.size(); i++) {
				A a = (A) ar.get(i);
				a.setEntityStatusRS(request);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		referenceData.put("meetingRoomList", ar);
		return referenceData;
	}
}