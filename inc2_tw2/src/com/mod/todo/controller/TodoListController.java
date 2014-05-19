package com.mod.todo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.mod.reviewPaper.controller.MySQLAccessReviewPaper;
import com.mod.talkNote.controller.MySQLAccessTalkNote;
import com.model.ReviewPaper;
import com.model.TalkNotes;
import com.model.User;
import com.vo.VOCompListCondition_B;
import com.vo.VOReviewPaperSearchCondition;
import com.vo.VOTalkNotesSearchCondition;
import com.vo.VOYearMonthCondition;

public class TodoListController extends SimpleFormController {

	public TodoListController() {
		setCommandClass(VOYearMonthCondition.class);
		setCommandName("voYearMonthCondition");
	}

//	@Override
//	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
//			BindException errors) throws Exception {
//		VOYearMonthCondition voYearMonthCondition = (VOYearMonthCondition) command;
//		ArrayList ar = new ArrayList();
//		MySQLAccessTodo o = new MySQLAccessTodo();
//		try {
//			ar = o.findAllTeachers(null);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		request.setAttribute("todoList", ar);
//		return new ModelAndView("teacherList", "voYearMonthCondition", voYearMonthCondition);
//	}

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
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		Map referenceData = new HashMap();
		{
			MySQLAccessCompany_B0 o2 = new MySQLAccessCompany_B0();
			ArrayList acceptedCompanies = o2.findAcceptedCompaniesB0();
			request.setAttribute("compList", acceptedCompanies);
			referenceData.put("acceptedCompanies", acceptedCompanies.size());
		}
		{
			MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
			ArrayList waitTransferList = o.readCompWaitList_B0(new VOCompListCondition_B()); // 狀態是通過審核者
			referenceData.put("waitTransferList", waitTransferList.size());
		}
		{
			VOReviewPaperSearchCondition c = new VOReviewPaperSearchCondition();
			c.setStatus(ReviewPaper.STAT_PROC);
			session.setAttribute("ReviewPaperListController", c);
			MySQLAccessReviewPaper o = new MySQLAccessReviewPaper();
			ArrayList unFinishedReview = o.findReviewPapers(c);
			referenceData.put("unFinishedReview", unFinishedReview.size());
		}
		{
			VOTalkNotesSearchCondition c = new VOTalkNotesSearchCondition();
			c.setType(TalkNotes.ConsultType_AM);
			c.setStatus(TalkNotes.STAT_PROC);
			c.setConsultantId(u.getUid());
			session.setAttribute("TalkNotesMyListAMController", c);
			MySQLAccessTalkNote o = new MySQLAccessTalkNote();
			ArrayList unFinishedAM = o.findTalkNotes(c, request); // //////////////////////////////
			referenceData.put("unFinishedAM", unFinishedAM.size());
		}
		{
			VOTalkNotesSearchCondition c = new VOTalkNotesSearchCondition();
			c.setType(TalkNotes.ConsultType_PM);
			c.setStatus(TalkNotes.STAT_PROC);
			c.setConsultantId(u.getUid());
			session.setAttribute("TalkNotesMyListPMController", c);
			MySQLAccessTalkNote o = new MySQLAccessTalkNote();
			ArrayList unFinishedPM = o.findTalkNotes(c, request); // //////////////////////////////
			referenceData.put("unFinishedPM", unFinishedPM.size());
		}
		{
			VOTalkNotesSearchCondition c = new VOTalkNotesSearchCondition();
			c.setType(TalkNotes.ConsultType_Teacher);
			c.setStatus(TalkNotes.STAT_PROC);
			session.setAttribute("TalkNotesMyListTeacherController", c);
			MySQLAccessTalkNote o = new MySQLAccessTalkNote();
			ArrayList unFinishedTeacher = o.findTalkNotes(c, request); // //////////////////////////////
			referenceData.put("unFinishedTeacher", unFinishedTeacher.size());
		}
		return referenceData;
	}
}