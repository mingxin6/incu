package com.mod.talkNote.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.model.TalkNotes;
import com.model.User;
import com.vo.VOTalkNotesSearchCondition;

public class TalkNotesMyListOtherController extends TalkNotesList {

	public TalkNotesMyListOtherController() {
		super("TalkNotesMyListOtherController","talkNotesMyListOther");
	}

	VOTalkNotesSearchCondition xxx(HttpServletRequest request, String condObjName){
		HttpSession session = request.getSession(false);
		VOTalkNotesSearchCondition c = (VOTalkNotesSearchCondition) session.getAttribute(condObjName);
		User u = (User) session.getAttribute("user");
		if (c == null) {
			c = new VOTalkNotesSearchCondition();
			c.setType(TalkNotes.ConsultType_Other);
			c.setConsultantId(u.getUid());
			c.setUserIdList("");
		}

		return c;
	}


	
}