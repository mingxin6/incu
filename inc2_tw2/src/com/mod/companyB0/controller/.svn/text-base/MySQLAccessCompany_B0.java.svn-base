package com.mod.companyB0.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.db.DbWhere;
import com.db.MySQLAcc;
import com.db.MySQLAccessMyBatis;
import com.model.Company;
import com.model.CompanyUser;
import com.model.ReviewPaper;
import com.model.Room;
import com.model.Staff;
import com.model.User;
import com.utils.FileUpDownLoadUtil;
import com.utils.KeyMaker;
import com.utils.PassUtil;
import com.vo.VOCompListCondition_B;
import com.vo.VOFile;

public class MySQLAccessCompany_B0 extends MySQLAcc {

	public int updateCompanyB0Status(String compId, String status) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		int n = o.updateCompStatusB0(compId, status);//
		o.closeSession();
		return n;
	}

	public int updateCompStatusB0nSaveReviewPaperUid(String compId, String status, String reviewPaperUid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		int n = o.updateCompStatusB0nSaveReviewPaperUid(compId, status, reviewPaperUid);//
		o.closeSession();
		return n;
	}

	public ArrayList findAcceptedAndReviewedCompaniesB0() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		DbWhere d = new DbWhere();
		// d.setWhere(" 1=1 ");
		d.setWhere(" companyStatus='" + Company.STATUS_RECEV + "' "//
				+ " or "//
				+ " companyStatus='" + Company.STATUS_APPLY + "' "//
				+ " or "//
				+ " companyStatus='" + Company.STATUS_REVIEW + "' "//
		);
		ArrayList recs = (ArrayList) o.findCompanyB0ByWhereString(d);
		o.closeSession();
		return recs;
	}

	public ArrayList findAcceptedCompaniesB0() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		StringBuffer sb = new StringBuffer();
		sb.append(" companyStatus='" + Company.STATUS_RECEV + "'");
		sb.append(" or companyStatus='" + Company.STATUS_APPLY + "'");

		DbWhere d = new DbWhere();
		d.setWhere(sb.toString());

		ArrayList recs = (ArrayList) o.findCompanyB0ByWhereString(d);
		o.closeSession();
		return recs;
	}

	public int receiveNewApplyB0(String compId) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		// int n = o.updateCompStatus(compId, Company.STATUS_RECEV);// !!!!!!!!!!!!!!!!!
		// System.out.println("updateCompStatus==>" + n + "," + compId + "," + Company.STATUS_RECEV);

		// Company comp = (Company) o.findCompanyByCompId(compId);
		// if (comp != null) {
		// if(comp.getCompStatus().equals(Company.STATUS_APPLY)){
		int n = o.updateCompStatusB0(compId, Company.STATUS_RECEV);// !!!!!!!!!!!!!!!!!
		// comp.setCompStatus( Company.STATUS_RECEV);
		// }
		// }
		o.closeSession();
		return n;
	}

	public ArrayList readCompWaitList_B0(VOCompListCondition_B cond) throws Exception {
		// VOCompListCondition_B c = new VOCompListCondition_B();
		// c.setCompName(cond.getCompName());
		// c.setCompStatus(cond.getCompStatus());
		// if (!c.getCompName().trim().equals("")) {
		// String s = "%" + c.getCompName() + "%";
		// c.setCompName(s);
		// }

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		// ArrayList recs = (ArrayList) o.findAllCompanysByCondition_B0(c);

		DbWhere d = new DbWhere();
		d.setWhere(" companyStatus='" + Company.STATUS_APPLYOK + "' "//
				// + " or "//
		// + " companyStatus='" + Company.STATUS_REVIEW + "' "//
				);
		ArrayList recs = (ArrayList) o.findCompanyB0ByWhereString(d);

		// for (int i = 0; i < recs.size(); i++) {
		// Company rec = (Company) recs.get(i);
		// rec.recCount = o.findVisitCount(rec.uid);
		// }
		o.closeSession();
		return recs;
	}

	public ArrayList readCompList_B0(VOCompListCondition_B cond) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		DbWhere d = new DbWhere();
		{
			StringBuffer sb = new StringBuffer();
			sb.append(" 1=1 ");
			if (!cond.getCompName().trim().equals("")) {
				String s = "%" + cond.getCompName() + "%";
				sb.append(" AND CompanyName like '" + s + "' ");
			}
			if (!cond.getCompStatus().equals("NONE")) {
				sb.append(" AND CompanyStatus = '" + cond.getCompStatus() + "' ");
			}

			if (!Company.getDBStatusString().equals("")) {
				sb.append(" And CompanyStatus in (" + Company.getDBStatusString() + ")");
			}

			sb.append(" order by createdTime desc ");
			d.setWhere(sb.toString());
		}
		ArrayList recs = (ArrayList) o.findCompanyB0ByWhereString(d);

		for (int i = 0; i < recs.size(); i++) {
			Company rec = (Company) recs.get(i);
			rec.recCount = o.findVisitCount(rec.uid);
		}
		o.closeSession();
		return recs;
	}

	public void insertCompanyB0ByStaff(Company comp, User user) throws SQLException {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		// comp.setCreatedBy(user.getUid());
		// comp.setCreatedTime(KeyMaker.newKey());
		o.insertCompanyB0(comp);

		// // 將公司與會員產生連結
		// user.setCompid(comp.uid);
		// user.setUserComp(comp.getCompName());
		// o.updateUser(user);

		o.closeSession();
	}

	public void insertCompanyB0(Company comp, User user) throws SQLException {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		// comp.setCreatedBy(user.getUid());
		// comp.setCreatedTime(KeyMaker.newKey());
		o.insertCompanyB0(comp);

		// 將公司與會員產生連結
		user.setCompid(comp.uid);
		user.setUserComp(comp.getCompName());
		o.updateUser(user);

		o.closeSession();
	}

	// void loadReviewDocs(Company comp, MySQLAccessMyBatis o) {
	// comp.setApplicationFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_1));
	// comp.setEstablishPaperFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_2));
	// comp.setBusinessPlanFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_3));
	// comp.setAccountantNoteFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_4));
	// comp.setForm401FileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_5));
	// }

	public Company findNewApply(String compId) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		// int n = o.updateCompStatus(compId, Company.STATUS_RECEV);// !!!!!!!!!!!!!!!!!
		// System.out.println("updateCompStatus==>" + n + "," + compId + "," + Company.STATUS_RECEV);

		Company comp = (Company) o.findCompanyB0ByCompId(compId);
		if (comp != null) {
			// ArrayList talks = (ArrayList) o.findTalkNotesByCompanyId(comp.uid);
			// for (int i = 0; i < talks.size(); i++) {
			// TalkNotes talk = (TalkNotes) talks.get(i);
			// talk.setSeq(i + 1);
			// }
			// comp.recCount = o.findVisitCount(comp.uid);
			// comp.setAwardRecs(o.findAwardsByCompId(comp.uid));
			// comp.setGrantRecs(o.findGrantsByCompId(comp.uid));
			// comp.setIpRecs(o.findIPsByCompId(comp.uid));
			//			

			// comp.setPaperFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_REVIEW));
			// comp.setInterviewFileInfo((ArrayList) o.findUploadedFiles(comp.uid, "面審"));
			// comp.setHandoverFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_OTHERFILES));
			// comp.setTalkNotes((talks));

			loadReviewDocs(comp, o);
			//comp.setCompStatusRS(request);
		}
		o.closeSession();
		return comp;
	}

	public ArrayList findCompanyB0ByMemberUid(String uid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList comps = (ArrayList) o.findCompanyB0ByMemberUid(uid);

		for (int i = 0; i < comps.size(); i++) {
			Company comp = (Company) comps.get(i);
			// comp.setPaperFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.TYPE_PAPERREVIEW));
			// comp.setInterviewFileInfo((ArrayList) o.findUploadedFiles(comp.uid, "面審"));
			// comp.setHandoverFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_OTHERFILES));

			loadReviewDocs(comp, o);
		}
		o.closeSession();
		return comps;
	}

	public void updateCompanyB0(Company comp, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.updateCompanyB0(comp);
		updateCompDoc2(comp, request, o);
		o.closeSession();
	}
	
	public void updateCompanyB02(Company comp, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		updateCompDoc(comp, request, o);
		o.closeSession();
	}

	// public void updateCompanyDocuments(Company comp, HttpServletRequest request, MySQLAccessMyBatis o) throws
	// Exception {
	// updateCompDoc2(comp, request, o);
	// }

//	boolean hasUploaedFile(List<MultipartFile> files) throws Exception {
//		boolean b = false;
//		for (int n = 0; n < files.size(); n++) {
//			MultipartFile mFile = (MultipartFile) files.get(n);
//			if (mFile != null && mFile.getBytes().length != 0) {
//				b = true;
//				break;
//			}
//		}
//		return b;
//	}

//	void processUpload(String compUid, String fileType, List uploaded, String deleteCheck1, String deleteCheck2,
//			HttpServletRequest request, MySQLAccessMyBatis o) throws Exception {
//		// System.out.println("uploaded.size()==" + uploaded.size());
//		if (hasUploaedFile(uploaded)) {
//			// 刪除舊檔
//			String[] deleteCheck = request.getParameterValues(deleteCheck1);
//			if (deleteCheck != null) {
//				for (int i = 0; i < deleteCheck.length; i++) {
//					o.deleteUploadedFileInfo(deleteCheck[i]);
//				}
//			}
//			// 上傳新檔
//			ArrayList applicationFileInfo = FileUpDownLoadUtil.upload(request, uploaded);
//			// SAVE file info
//			for (int i = 0; i < applicationFileInfo.size(); i++) {
//				VOFile voFile = (VOFile) applicationFileInfo.get(i);
//				voFile.setUid(UUID.randomUUID().toString());
//				voFile.setLinkedObjId(compUid);
//				voFile.setType(fileType);
//				o.insertUploadedCompanyFileInfo(voFile);
//			}
//		} else {
//			String[] deleteCheck = request.getParameterValues(deleteCheck2);
//			if (deleteCheck != null) {
//				for (int i = 0; i < deleteCheck.length; i++) {
//					o.deleteUploadedFileInfo(deleteCheck[i]);
//				}
//			}
//		}
//	}

//	void processUpload2(String compUid, String fileType, List uploaded, String deleteCheck1,
//			HttpServletRequest request, MySQLAccessMyBatis o) throws Exception {
//		// DELETE file info
//		String[] deletedChecks = request.getParameterValues(deleteCheck1);
//		if (deletedChecks != null) {
//			for (int i = 0; i < deletedChecks.length; i++) {
//				o.deleteUploadedFileInfo(deletedChecks[i]);
//			}
//		}
//
//		// UPLOAD file
//		ArrayList fileInfo = FileUpDownLoadUtil.upload(request, uploaded);
//
//		// SAVE file info
//		for (int i = 0; i < fileInfo.size(); i++) {
//			VOFile voFile = (VOFile) fileInfo.get(i);
//			voFile.setUid(UUID.randomUUID().toString());
//			voFile.setLinkedObjId(compUid);
//			voFile.setType(fileType);
//			o.insertUploadedCompanyFileInfo(voFile);
//		}
//	}

	void updateCompDoc2(Company comp, HttpServletRequest request, MySQLAccessMyBatis o) throws Exception {
		// 進駐申請表
		processUpload(comp.uid, ReviewPaper.FILE_1, comp.getApplicationFiles(), "deleteCheckApplicationFile",
				"deleteCheckApplicationFile2", request, o);

		// 公司設立函文
		processUpload(comp.uid, ReviewPaper.FILE_2, comp.getEstablishPaperFiles(), "deleteCheckEstablishPaperFile",
				"deleteCheckEstablishPaperFile2", request, o);

		// 營運計劃書
		processUpload(comp.uid, ReviewPaper.FILE_3, comp.getBusinessPlanFiles(), "deleteCheckBusinessPlanFile",
				"deleteCheckBusinessPlanFile2", request, o);

		// 會計師簽證
		processUpload(comp.uid, ReviewPaper.FILE_4, comp.getAccountantNoteFiles(), "deleteCheckAccountantNoteFile",
				"deleteCheckAccountantNoteFile2", request, o);

		// 401 報表
		processUpload(comp.uid, ReviewPaper.FILE_5, comp.getForm401Files(), "deleteCheckForm401File",
				"deleteCheckForm401File2", request, o);

		// ---------------------------------------------------------------------------------------
		// 其他附件

		processUpload2(comp.uid, ReviewPaper.FILE_OTHERFILES, comp.getHandoverFiles(), "deleteCheckHandover", request,
				o);

		// // DELETE file info
		// String[] deletedCheckHandoverFiles = request.getParameterValues("deleteCheckHandover");
		// if (deletedCheckHandoverFiles != null) {
		// for (int i = 0; i < deletedCheckHandoverFiles.length; i++) {
		// o.deleteUploadedFileInfo(deletedCheckHandoverFiles[i]);
		// }
		// }
		//
		// // UPLOAD file
		// List handoverCheckFiles = comp.getHandoverFiles();
		// ArrayList handoverCheckFileInfo = FileUpDownLoadUtil.upload(request, handoverCheckFiles);
		//
		// // SAVE file info
		// for (int i = 0; i < handoverCheckFileInfo.size(); i++) {
		// VOFile voFile = (VOFile) handoverCheckFileInfo.get(i);
		// voFile.setUid(UUID.randomUUID().toString());
		// voFile.setLinkedObjId(comp.uid);
		// voFile.setType(ReviewPaper.FILE_OTHERFILES);
		// o.insertUploadedCompanyFileInfo(voFile);
		// }
	}

	void updateCompDoc(Company comp, HttpServletRequest request, MySQLAccessMyBatis o) throws Exception {

		processUpload(comp.uid, ReviewPaper.FILE_1, comp.getApplicationFiles(), "deleteCheckApplicationFile",
				"deleteCheckApplicationFile2", request, o);

		// 公司設立函文
		processUpload(comp.uid, ReviewPaper.FILE_2, comp.getEstablishPaperFiles(), "deleteCheckEstablishPaperFile",
				"deleteCheckEstablishPaperFile2", request, o);

		// 營運計劃書
		processUpload(comp.uid, ReviewPaper.FILE_3, comp.getBusinessPlanFiles(), "deleteCheckBusinessPlanFile",
				"deleteCheckBusinessPlanFile2", request, o);

		// 會計師簽證
		processUpload(comp.uid, ReviewPaper.FILE_4, comp.getAccountantNoteFiles(), "deleteCheckAccountantNoteFile",
				"deleteCheckAccountantNoteFile2", request, o);

		// 401 報表
		processUpload(comp.uid, ReviewPaper.FILE_5, comp.getForm401Files(), "deleteCheckForm401File",
				"deleteCheckForm401File2", request, o);

		// String[] deletedCheckPaperFiles = request.getParameterValues("deleteCheckPaper");
		// if (deletedCheckPaperFiles != null) {
		// for (int i = 0; i < deletedCheckPaperFiles.length; i++) {
		// o.deleteUploadedFileInfo(deletedCheckPaperFiles[i]);
		// }
		// }
		//
		// // UPLOAD file
		// List paperCheckFiles = comp.getPaperCheckFiles();
		// ArrayList paperCheckFileInfo = FileUpDownLoadUtil.upload(request, paperCheckFiles);
		//
		// // SAVE file info
		// for (int i = 0; i < paperCheckFileInfo.size(); i++) {
		// VOFile voFile = (VOFile) paperCheckFileInfo.get(i);
		// voFile.setUid(UUID.randomUUID().toString());
		// voFile.setLinkedObjId(comp.uid);
		// voFile.setType(ReviewPaper.FILE_REVIEW);
		// o.insertUploadedCompanyFileInfo(voFile);
		// }

		// ---------------------------------------------------------------------------------------

		// // DELETE file info
		// String[] deletedCheckInterviewFiles = request.getParameterValues("deleteCheckInterview");
		// if (deletedCheckInterviewFiles != null) {
		// for (int i = 0; i < deletedCheckInterviewFiles.length; i++) {
		// o.deleteUploadedFileInfo(deletedCheckInterviewFiles[i]);
		// }
		// }
		//
		// // UPLOAD file
		// List interviewCheckFiles = comp.getInterviewFiles();
		// ArrayList interviewCheckFileInfo = FileUpDownLoadUtil.upload(request, interviewCheckFiles);
		//
		// // SAVE file info
		// for (int i = 0; i < interviewCheckFileInfo.size(); i++) {
		// VOFile voFile = (VOFile) interviewCheckFileInfo.get(i);
		// voFile.setUid(UUID.randomUUID().toString());
		// voFile.setLinkedObjId(comp.uid);
		// voFile.setType("面審");
		// o.insertUploadedCompanyFileInfo(voFile);
		// }

		// ---------------------------------------------------------------------------------------

		// // DELETE file info
		// String[] deletedCheckHandoverFiles = request.getParameterValues("deleteCheckHandover");
		// if (deletedCheckHandoverFiles != null) {
		// for (int i = 0; i < deletedCheckHandoverFiles.length; i++) {
		// o.deleteUploadedFileInfo(deletedCheckHandoverFiles[i]);
		// }
		// }
		//
		// // UPLOAD file
		// List handoverCheckFiles = comp.getHandoverFiles();
		// ArrayList handoverCheckFileInfo = FileUpDownLoadUtil.upload(request, handoverCheckFiles);
		//
		// // SAVE file info
		// for (int i = 0; i < handoverCheckFileInfo.size(); i++) {
		// VOFile voFile = (VOFile) handoverCheckFileInfo.get(i);
		// voFile.setUid(UUID.randomUUID().toString());
		// voFile.setLinkedObjId(comp.uid);
		// voFile.setType(ReviewPaper.FILE_OTHERFILES);
		// o.insertUploadedCompanyFileInfo(voFile);
		// }
	}

	public Company readCompanyB0ByUniqueID(String compId) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		Company comp = (Company) o.findCompanyB0ByCompId(compId);
		if (comp != null) {
			// ArrayList talks = (ArrayList) o.findTalkNotesByCompanyId(comp.uid);
			// for (int i = 0; i < talks.size(); i++) {
			// TalkNotes talk = (TalkNotes) talks.get(i);
			// talk.setSeq(i + 1);
			// }
			// comp.recCount = o.findVisitCount(comp.uid);
			// comp.setAwardRecs(o.findAwardsByCompId(comp.uid));
			// comp.setGrantRecs(o.findGrantsByCompId(comp.uid));
			// comp.setIpRecs(o.findIPsByCompId(comp.uid));
			// comp.setPaperFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_REVIEW));
			// comp.setInterviewFileInfo((ArrayList) o.findUploadedFiles(comp.uid, "面審"));
			// comp.setHandoverFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_OTHERFILES));
			// comp.setTalkNotes((talks));

			// comp.setApplicationFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_1));
			// comp.setEstablishPaperFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_2));
			// comp.setBusinessPlanFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_3));
			// comp.setAccountantNoteFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_4));
			// comp.setForm401FileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_5));

			loadReviewDocs(comp, o);

			// System.out.println("*******>>>> " + comp.getUid() + ","
			// + comp.getCompName()
			// + ",-comp.getTalkNotes().size()------------->"
			// + comp.getTalkNotes().size());
		}
		o.closeSession();
		return comp;
	}

	public void deleteCompany(String compId, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		user.setCompid("");
		user.setUserComp("");
		o.updateUser(user);

		o.deleteCompanyB0(compId);
		o.closeSession();
	}

	public int denyNewApply(Company comp, HttpServletRequest request) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		int n = o.denyNewApply(comp);// !!!!!!!!!!!!!!!!!

		// save for later
		// Company company = o.findCompanyB0ByCompId(comp.getUid());
		// new UserUtil().markLastModify(request, company);
		// o.insertCompanyB0Denied(company);
		// ^^^^^^^^^^^^^^^^^^^^^^^^^^^

		o.closeSession();
		return n;
	}

	public void doTransfer(HttpServletRequest request, Company compFromPage, String[] roomChecked) {
		String p2 = compFromPage.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			compFromPage.setUserLoginPwd(p2);
		}

		String loginId = compFromPage.getUserLoginId();
		String loginPwd = compFromPage.getUserLoginPwd();

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		//
		Company compB0FromDB = (Company) o.findCompanyB0ByCompId(compFromPage.getUid());

		o.updateCompStatusB0(compB0FromDB.getUid(), Company.STATUS_MOVEIN);

		//
		String maxCompCustomId = o.findCompanyMaxCustomId();
		String numberPart = maxCompCustomId.substring(3);
		System.out.println("numberPartnumberPart=" + numberPart);
		int nsiNumber = Integer.parseInt(numberPart) + 1;
		String newNSI = "NSI" + nsiNumber;

		//
		String amid = compFromPage.getAmId();
		Staff AM = o.findStaffById(amid);

		// System.out.println((AM==null)?"AM is null , amid="+amid:"AM is null not");

		String pmid = compFromPage.getPmId();
		Staff PM = o.findStaffById(pmid);

		// ------------------------------------------------
		Company newComp = compB0FromDB;
		// newComp.setUid("comp" + KeyMaker.newKey());
		newComp.setUid(compB0FromDB.getUid()); // same id
		newComp.setCustomId(newNSI);
		newComp.setAmId(AM.getUid());
		newComp.setAmName(AM.getName());
		newComp.setPmId(PM.getUid());
		newComp.setPmName(PM.getName());
		newComp.setCompStatus(Company.STATUS_MOVEIN);
		newComp.setUserLoginId(loginId);
		newComp.setUserLoginPwd(loginPwd);
		newComp.setDeposit(compFromPage.getDeposit());
		newComp.setBond(compFromPage.getBond());
		newComp.markCreatinfo(request);
		newComp.markModifyinfo(request);

		if (roomChecked != null) {
			String roomInfo = "";
			for (int i = 0; i < roomChecked.length; i++) {
				String roomUid = roomChecked[i];
				Room room = o.findRoomById(roomUid);
				room.setCompId(newComp.getUid());
				room.setCompCustomid(newComp.getCustomId());
				room.setCompName(newComp.getCompName());
				o.updateRoom(room);

				roomInfo = roomInfo + room.getRoomNo();
				if (i != roomChecked.length - 1)
					roomInfo = roomInfo + ",";

			}
			newComp.setRoom(roomInfo);
		}

		System.out.println("insertCompany....~~~~");
		System.out.println("newComp.getUserLoginId()==" + newComp.getUserLoginId());
		System.out.println("newComp.getUserLoginPwd()==" + newComp.getUserLoginPwd());

		o.insertCompany(newComp);

		// ----------------------------------------------------
		// 建立企業帳號
		CompanyUser companyUser = new CompanyUser();
		companyUser.setUid("compUser" + KeyMaker.newKey());
		companyUser.setName(newComp.getCompName());

		try {
			String mails = newComp.getAdminContactEmail();
			String mail = mails.substring(0, mails.indexOf(","));
			companyUser.setEmail(mail);
		} catch (Exception e) {
			// TODO: handle exception
		}

		companyUser.setPhone(newComp.getAdminContactPhone());
		companyUser.setCompUid(newComp.getUid());
		companyUser.setCustomId(newComp.getCustomId());
		companyUser.setCompName(newComp.getCompName());
		companyUser.setStatus(CompanyUser.STATUS_OK);

		companyUser.setUserLoginId(newComp.getUserLoginId());
		companyUser.setUserLoginPwd(newComp.getUserLoginPwd());
		// String p2 = companyUser.getUserLoginPwdClearText().trim();
		// if (!p2.equals("")) {
		// p2 = new PassUtil().encodeClearText(p2);
		// companyUser.setUserLoginPwd(p2);
		// }
		companyUser.markCreatinfo(request);
		companyUser.markModifyinfo(request);

		o.insertCompanyUsers(companyUser);// 插入企業帳號 table

		// -------------------------------------------------
		// 插入 User Table

		User user = fillUserObjOfCompanyUser(companyUser);
		System.out.println("insertUser....~~~~");
		System.out.println("user.getUserLoginId()==" + user.getUserLoginId());
		System.out.println("user.getUserLoginPwd()==" + user.getUserLoginPwd());
		o.insertUser(user);

		o.closeSession();
		return;
	}

	public User fillUserObjOfCompanyUser(CompanyUser obj) {
		User user = new User();
		user.setUid(obj.getUid());
		user.setUserName(obj.getName());
		user.setUserEmail(obj.getEmail());
		user.setUserPhone(obj.getPhone());

		user.setCompid(obj.getCompUid());
		user.setUserComp(obj.getCompName());
		user.setLinkedObjId(obj.getCompUid());

		user.setUserRole(User.BUSINESS);
		user.setUserLoginId(obj.getUserLoginId());
		user.setUserLoginPwd(obj.getUserLoginPwd());
		user.setUserStatus(obj.getStatus());
		user.setCreatedBy(obj.getCreatedBy());
		user.setCreatedTime(obj.getCreatedTime());
		user.setLastUpdateUser(obj.getLastUpdateUser());
		user.setLastUpdateTime(obj.getLastUpdateTime());
		return user;
	}

	public static void main(String[] args) {

	}

}
