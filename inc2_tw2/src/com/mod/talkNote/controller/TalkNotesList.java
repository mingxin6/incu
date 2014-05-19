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

public class TalkNotesList extends SimpleFormController {

	public String condName = "";
	public String forwardPage = "";

	public TalkNotesList(String condName, String forwardPage) {
		this.condName = condName;
		this.forwardPage = forwardPage;
		setCommandClass(VOTalkNotesSearchCondition.class);
		setCommandName(condName);
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		VOTalkNotesSearchCondition c = (VOTalkNotesSearchCondition) command;
		HttpSession session = request.getSession(false);
		session.setAttribute(condName, c);

		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		ArrayList talkNotesList = o.findTalkNotes(c, request);
		for (int i = 0; i < talkNotesList.size(); i++) {
			TalkNotes obj = (TalkNotes) talkNotesList.get(i);
			obj.setCaseStatusRS(request);
			obj.setTypeRS(request);
		}
		request.setAttribute("talkNotesList", talkNotesList);

		MySQLAccessTag o2 = new MySQLAccessTag();
		ArrayList tagsList = o2.findTagsStringArrayByUid(request);
		session.setAttribute("tagsList", tagsList);

		request.setAttribute("selectYear", SelectYear.get());
		request.setAttribute("selectMonth", SelectMonth.get());
		request.setAttribute("statuses", TalkNotes.getCaesStatus(request));
		request.setAttribute("consultTypes", TalkNotes.getConsultTypes(request));

		System.out.println("~~~~forwardPage==>" + forwardPage);
		return new ModelAndView(forwardPage, condName, c);
	}

	VOTalkNotesSearchCondition xxx(HttpServletRequest request, String condObjName) {
		return null;
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		VOTalkNotesSearchCondition c = xxx(request, condName);
		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		ArrayList talkNotesList = o.findTalkNotes(c, request);
		for (int i = 0; i < talkNotesList.size(); i++) {
			TalkNotes obj = (TalkNotes) talkNotesList.get(i);
			obj.setCaseStatusRS(request);
			obj.setTypeRS(request);
		}

		request.setAttribute("talkNotesList", talkNotesList);
		return c;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);

		MySQLAccessTag o2 = new MySQLAccessTag();
		ArrayList tagsList = o2.findTagsStringArrayByUid(request);
		session.setAttribute("tagsList", tagsList);

		// -----------------------------------------------------
		Map referenceData = new HashMap();
		referenceData.put("selectYear", SelectYear.get());
		referenceData.put("selectMonth", SelectMonth.get());
		referenceData.put("statuses", TalkNotes.getCaesStatus(request));
		referenceData.put("consultTypes", TalkNotes.getConsultTypes(request));
		return referenceData;
	}
}