package com.mod.talkNote.controller;

import javax.servlet.http.HttpServletRequest;

import com.mod.staff.controller.MySQLAccessStaff;
import com.model.Company;
import com.model.Staff;
import com.model.TalkNotes;
import com.vo.VOTalkNotesSearchCondition;

public class RequestListAMController extends RequestListController {

	public RequestListAMController() {
		super("RequestListAMController");
	}

	void xxx(Company comp, VOTalkNotesSearchCondition c, HttpServletRequest request) {
		c.setType(TalkNotes.ConsultType_AM);// 用來區分是 AM? PM? Teacher?

		String amId = comp.getAmId();
		MySQLAccessStaff o2 = new MySQLAccessStaff();
		Staff stf = o2.findStaffById(amId);
		if (stf != null) {
			String amName = stf.getName();
			request.setAttribute("amName", amName);
		} else {
			request.setAttribute("amName", "(尚未指定)");
		}

		request.setAttribute("consultType", TalkNotes.ConsultType_AM);
	}
}