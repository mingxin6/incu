package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.mod.company.controller.MySQLAccessCompany;
import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.mod.reviewPaper.controller.MySQLAccessReviewPaper;
import com.mod.room.controller.MySQLAccessRoom;
import com.mod.talkNote.controller.MySQLAccessTalkNote;
import com.model.CompanyIndex;
import com.model.FloorInfo;
import com.model.ReviewPaper;
import com.model.TalkNotes;
import com.model.User;
import com.vo.VOAnnouncementCondition;
import com.vo.VOCompListCondition_B;
import com.vo.VOReviewPaperSearchCondition;
import com.vo.VOTalkNotesSearchCondition;

public class AdminMainController extends SimpleFormController {

	public AdminMainController() {
		setCommandClass(VOAnnouncementCondition.class);
		setCommandName("adminMain");
	}

	// public int GetCategorize(ArrayList al)
	// {
	// int intI=0;
	// for (int i=0;i<al.size();i++)
	// {
	// ServiceResourceAccept obj=(ServiceResourceAccept)al.get(i);
	// //System.out.println("obj.accept_status="+obj.accept_status);
	// if (obj.accept_status.equals("等待审核"))
	// intI++;
	// }
	// return intI;
	// }

	int getToDoTaskCount(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		int a = 0;
		{
			MySQLAccessCompany_B0 o2 = new MySQLAccessCompany_B0();
			ArrayList acceptedCompanies = o2.findAcceptedCompaniesB0();
			// request.setAttribute("compList", acceptedCompanies);
			// referenceData.put("acceptedCompanies", acceptedCompanies.size());
			a = a + acceptedCompanies.size();
		}
		{
			MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
			ArrayList waitTransferList = o.readCompWaitList_B0(new VOCompListCondition_B()); // 狀態是通過審核者
			// referenceData.put("waitTransferList", waitTransferList.size());
			a = a + waitTransferList.size();
		}
		{
			VOReviewPaperSearchCondition c = new VOReviewPaperSearchCondition();
			c.setStatus(ReviewPaper.STAT_PROC);
			// session.setAttribute("ReviewPaperListController", c);
			MySQLAccessReviewPaper o = new MySQLAccessReviewPaper();
			ArrayList unFinishedReview = o.findReviewPapers(c);
			// referenceData.put("unFinishedReview", unFinishedReview.size());
			a = a + unFinishedReview.size();
		}
		{
			VOTalkNotesSearchCondition c = new VOTalkNotesSearchCondition();
			c.setType(TalkNotes.ConsultType_AM);
			c.setStatus(TalkNotes.STAT_PROC);
			c.setConsultantId(u.getUid());
			// session.setAttribute("TalkNotesMyListAMController", c);
			MySQLAccessTalkNote o = new MySQLAccessTalkNote();
			ArrayList unFinishedAM = o.findTalkNotes(c, request); // //////////////////////////////
			// referenceData.put("unFinishedAM", unFinishedAM.size());
			a = a + unFinishedAM.size();
		}
		{
			VOTalkNotesSearchCondition c = new VOTalkNotesSearchCondition();
			c.setType(TalkNotes.ConsultType_PM);
			c.setStatus(TalkNotes.STAT_PROC);
			c.setConsultantId(u.getUid());
			// session.setAttribute("TalkNotesMyListPMController", c);
			MySQLAccessTalkNote o = new MySQLAccessTalkNote();
			ArrayList unFinishedPM = o.findTalkNotes(c, request); // //////////////////////////////
			// referenceData.put("unFinishedPM", unFinishedPM.size());
			a = a + unFinishedPM.size();
		}
		{
			VOTalkNotesSearchCondition c = new VOTalkNotesSearchCondition();
			c.setType(TalkNotes.ConsultType_Teacher);
			c.setStatus(TalkNotes.STAT_PROC);
			// session.setAttribute("TalkNotesMyListTeacherController", c);
			MySQLAccessTalkNote o = new MySQLAccessTalkNote();
			ArrayList unFinishedTeacher = o.findTalkNotes(c, request); // //////////////////////////////
			// referenceData.put("unFinishedTeacher", unFinishedTeacher.size());
			a = a + unFinishedTeacher.size();
		}
		return a;
	}

	int getMovinCompanyCount() {
		MySQLAccessCompany o = new MySQLAccessCompany();
		return o.findMovinCompany().size();
	}

	String findRoomUsedRatio() {
		MySQLAccessRoom o = new MySQLAccessRoom();
		return o.findRoomUsedRatio();
	}

	int findTalkNoteCount() {
		MySQLAccessTalkNote o = new MySQLAccessTalkNote();
		return o.findTalkNoteCount();
	}

	int getApplyingCompanyCount() {
		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		return o.findAcceptedAndReviewedCompaniesB0().size();
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {

		return new VOAnnouncementCondition();
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map mapobj = new HashMap();

		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");

		// -------------------------------------------------------

		mapobj.put("toDoTaskCount", getToDoTaskCount(request));
		mapobj.put("movinCompanyCount", getMovinCompanyCount());
		mapobj.put("roomUsedRatio", findRoomUsedRatio());
		mapobj.put("talkNoteCount", findTalkNoteCount());
		mapobj.put("applyingCompanyCount", getApplyingCompanyCount());

		// -------------------------------------------------------

		MySQLAccess o = new MySQLAccess();

		// String categorize1="0";
		// String categorize2="0";
		// String categorize3="0";
		// String categorize4="0";
		// String categorize5="0";
		// String categorize6="0";

		// try {
		// ArrayList al1 = o.readServiceResourceAcceptList("1",null);
		// ArrayList al2 = o.readServiceResourceAcceptList("2",null);
		// ArrayList al3 = o.readServiceResourceAcceptList("3",null);
		// ArrayList al4 = o.readServiceResourceAcceptList("4",null);
		// ArrayList al5 = o.readServiceResourceAcceptList("5",null);
		// ArrayList al6 = o.readServiceResourceAcceptList("6",null);
		//			
		// categorize1=GetCategorize(al1)+"";
		// categorize2=GetCategorize(al2)+"";
		// categorize3=GetCategorize(al3)+"";
		// categorize4=GetCategorize(al4)+"";
		// categorize5=GetCategorize(al5)+"";
		// categorize6=GetCategorize(al6)+"";
		//			
		// } catch (Exception e) {
		// e.printStackTrace();
		// }

		List<CompanyIndex> aiList = o.findAllCompanysIndex();
		Map<String, CompanyIndex> aiMap = new HashMap<String, CompanyIndex>();
		for (CompanyIndex ci : aiList) {
			aiMap.put(ci.getRoom(), ci);
		}
		mapobj.put("compMap", aiMap);

		List<FloorInfo> fiList = o.findAllFloorInfo();
		Map<String, FloorInfo> fiMap = new HashMap<String, FloorInfo>();
		for (FloorInfo fi : fiList) {
			fiMap.put(fi.getLocation(), fi);
		}
		mapobj.put("floorMap", fiMap);

		// int totalcomp = o.findTotalCompanys();
		// int totalserv = o.findTotalService();
		// System.out.println("aiMap.get(316)===="+aiMap.get("316").getCompShortName());

		// mapobj.put("totalcomp", totalcomp);
		// mapobj.put("totalserv", totalserv);

		// mapobj.put("categorize1", categorize1);
		// mapobj.put("categorize2", categorize2);
		// mapobj.put("categorize3", categorize3);
		// mapobj.put("categorize4", categorize4);
		// mapobj.put("categorize5", categorize5);
		// mapobj.put("categorize6", categorize6);

		return mapobj;
	}
}
