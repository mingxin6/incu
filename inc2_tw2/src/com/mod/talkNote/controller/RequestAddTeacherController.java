package com.mod.talkNote.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccessMyBatis;
import com.model.Company;
import com.model.TalkNotes;
import com.model.Teacher;
import com.model.User;

public class RequestAddTeacherController extends RequestAddController {

	public RequestAddTeacherController() {
		super();
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		String compId = u.getCompid();
		String teacherId = request.getParameter("teacherId");

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		Company comp = o.findCompanyByCompId(compId);
		Teacher teacher = o.findTeacherById(teacherId);
		o.closeSession();

		TalkNotes talkNote = (TalkNotes) command;
		MySQLAccessRequest o2 = new MySQLAccessRequest();

		o2.insertTalkNotes(TalkNotes.ConsultType_Teacher, comp.getUid(), comp.getCompName(), teacher.getUid(), teacher
				.getName(), talkNote, request);

		return new ModelAndView(new RedirectView("requestListTeacher.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String teacherId = request.getParameter("teacherId");
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		Teacher teacher = o.findTeacherById(teacherId);
		o.closeSession();

		request.setAttribute("teacher", teacher);

		TalkNotes obj = new TalkNotes();
		return obj;
	}
}
