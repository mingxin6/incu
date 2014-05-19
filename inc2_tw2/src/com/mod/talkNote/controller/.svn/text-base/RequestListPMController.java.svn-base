package com.mod.talkNote.controller;

import javax.servlet.http.HttpServletRequest;

import com.mod.staff.controller.MySQLAccessStaff;
import com.model.Company;
import com.model.Staff;
import com.model.TalkNotes;
import com.vo.VOTalkNotesSearchCondition;

public class RequestListPMController extends RequestListController {

	public RequestListPMController() {
		super("RequestListPMController");
	}

	void xxx(Company comp, VOTalkNotesSearchCondition c, HttpServletRequest request) {
		c.setType(TalkNotes.ConsultType_PM);// 用來區分是 AM? PM? Teacher?

		String pmId = comp.getPmId();
		MySQLAccessStaff o2 = new MySQLAccessStaff();
		Staff stf = o2.findStaffById(pmId);
		if (stf != null) {
			String pmName = stf.getName();
			request.setAttribute("pmName", pmName);
		} else {
			request.setAttribute("pmName", "(尚未指定)");
		}

		request.setAttribute("consultType", TalkNotes.ConsultType_PM);
	}
}