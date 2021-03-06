package com.mod.talkNote.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.mkyong.customer.controller.SelectMonth;
import com.mkyong.customer.controller.SelectYear;
import com.mod.tag.controller.MySQLAccessTag;
import com.model.TalkNotes;
import com.vo.VOTalkNotesSearchCondition;

public class TalkNotesMyListTeacherController extends TalkNotesList {

	public TalkNotesMyListTeacherController() {
		super("TalkNotesMyListTeacherController","talkNotesMyListTeacher");
	}

	
	VOTalkNotesSearchCondition xxx(HttpServletRequest request, String condObjName){
		HttpSession session = request.getSession(false);
		VOTalkNotesSearchCondition c = (VOTalkNotesSearchCondition) session.getAttribute(condObjName);
		if (c == null) {
			c = new VOTalkNotesSearchCondition();
			c.setType(TalkNotes.ConsultType_Teacher);
			c.setConsultantId("");
			c.setUserIdList("");
		}
		return c;
	}
	
	
}