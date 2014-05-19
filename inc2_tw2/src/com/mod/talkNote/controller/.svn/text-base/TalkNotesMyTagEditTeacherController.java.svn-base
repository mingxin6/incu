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
import org.springframework.web.servlet.view.RedirectView;

import com.mod.tag.controller.MySQLAccessTag;
import com.model.TagRec;
import com.model.TalkNotes;
import com.model.User;
import com.utils.KeyMaker;

public class TalkNotesMyTagEditTeacherController extends SimpleFormController {

	public TalkNotesMyTagEditTeacherController() {
		setCommandClass(TalkNotes.class);
		setCommandName("talkNotes");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		TalkNotes talkNotes = (TalkNotes) command;
		String[] tags = talkNotes.getTags();

		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		o.updateTalkNoteTags(talkNotes, tags, request);

		return new ModelAndView(new RedirectView("talkNotesMyViewTeacher.htm?talkNoteId=" + talkNotes.getTalkNoteId()));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String talkNoteId = request.getParameter("talkNoteId");
		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		TalkNotes talkNotes = o.selectTalkNotesByNoteId2(talkNoteId, request);
		request.setAttribute("talkNotes", talkNotes);
		return talkNotes;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		MySQLAccessTag o2 = new MySQLAccessTag();
		ArrayList tagsList = o2.findTagsStringArrayByUid(request);
		Map referenceData = new HashMap();
		session.setAttribute("tagsList", tagsList);
		return referenceData;
	}
}
