package com.mod.talkNote.controller;

import javax.servlet.http.HttpServletRequest;

import com.model.Company;
import com.model.TalkNotes;
import com.vo.VOTalkNotesSearchCondition;

public class RequestListTeacherController extends RequestListController {

	public RequestListTeacherController() {
		super("RequestListTeacherController");
	}

	void xxx(Company comp, VOTalkNotesSearchCondition c, HttpServletRequest request) {
		c.setType(TalkNotes.ConsultType_Teacher);// 用來區分是 AM? PM? Teacher?

		// String amId = comp.getAmId();
		// MySQLAccessStaff o2 = new MySQLAccessStaff();
		// Staff stf = o2.findStaffById(amId);
		// if (stf != null) {
		// String amName = stf.getName();
		// request.setAttribute("amName", amName);
		// } else {
		// request.setAttribute("amName", "(尚未指定)");
		// }

		request.setAttribute("consultType", TalkNotes.ConsultType_Teacher);
	}
}