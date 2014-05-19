package com.mod.talkNote.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.db.DbWhere;
import com.db.MySQLAccessMyBatis;
import com.mod.staff.controller.MySQLAccessStaff;
import com.model.Company;
import com.model.Staff;
import com.model.TagRec;
import com.model.TalkNotes;
import com.model.User;
import com.utils.FileUpDownLoadUtil;
import com.utils.KeyMaker;
import com.vo.VOFile;
import com.vo.VOTalkNotesSearchCondition;

public class MySQLAccessTalkNote {

	public TalkNotes selectTalkNotesByNoteId(String noteId) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		TalkNotes talk = o.findTalkNotesById(noteId);

		ArrayList fileInfo = (ArrayList) o.findUploadedFiles(talk.getTalkNoteId(), TalkNotes.DOC_REQ);
		talk.setFileInfo(fileInfo);

		ArrayList fileInfo_reply = (ArrayList) o.findUploadedFiles(talk.getTalkNoteId(), TalkNotes.DOC_RPLY);
		talk.setFileInfo_reply(fileInfo_reply);

		o.closeSession();
		return talk;
	}

	void fillTags(MySQLAccessMyBatis o, TalkNotes talk, String userUid, String noteId) {
		System.out.println("noteId.....noteId=" + noteId + ",  userId=" + userUid);

		StringBuffer sb = new StringBuffer();
		sb.append(" 1=1 ");
		sb.append(" AND userUid='" + userUid + "' ");
		sb.append(" AND recordUid='" + noteId + "' ");
		DbWhere d = new DbWhere();
		d.setWhere(sb.toString());
		ArrayList<TagRec> ar = (ArrayList) o.findTalkNoteTagRecsByWhereString(d);

		System.out.println(" tags arr===>" + ar.size());

		String[] tags = new String[] {};
		for (int i = 0; i < ar.size(); i++) {
			TagRec tagRec = (TagRec) ar.get(i);
			tags = tagRec.getTagNames().split(",");
			talk.setAllTagNames(tagRec.getTagNames());
			talk.setTags(tags);
		}
	}

	public TalkNotes selectTalkNotesByNoteId2(String noteId, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		TalkNotes talk = o.findTalkNotesById(noteId);

		ArrayList fileInfo = (ArrayList) o.findUploadedFiles(talk.getTalkNoteId(), TalkNotes.DOC_REQ);
		talk.setFileInfo(fileInfo);

		ArrayList fileInfo_reply = (ArrayList) o.findUploadedFiles(talk.getTalkNoteId(), TalkNotes.DOC_RPLY);
		talk.setFileInfo_reply(fileInfo_reply);

		fillTags(o, talk, u.getUid(), noteId);

		o.closeSession();
		return talk;
	}

	public List<TalkNotes> findTalkNotesByCompanyId(String id) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		List talklist = o.findTalkNotesByCompanyId(id);
		o.closeSession();

		if (talklist != null) {
			for (int i = 0; i < talklist.size(); i++) {
				TalkNotes talk = (TalkNotes) talklist.get(i);
				talk.setSeq(i + 1);
			}
		}
		return talklist;
	}

	public int findTalkNoteCount() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		int n = o.findTalkNoteCount();
		o.closeSession();
		return n;
	}

	public ArrayList findTalkNotesBySearch(VOTalkNotesSearchCondition c) {
		StringBuffer sb = new StringBuffer();
		sb.append(" 1=1 ");
		// if (!c.getCompName().equals("")) {
		// sb.append(" AND a.compName like '%" + c.getCompName() + "%' ");
		// }
		sb.append(addMiscCondition(c.getTalkDateTime(), c.getCompName(), c.getKeyContent()));
		sb.append(" order by talkDateTime desc ");

		System.out.println(sb.toString());

		DbWhere d = new DbWhere();
		d.setWhere(sb.toString());

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList ar = (ArrayList) o.findTalkNotesByWhereString(d);

		for (int i = 0; i < ar.size(); i++) {
			TalkNotes talk = (TalkNotes) ar.get(i);
			ArrayList fileInfo = (ArrayList) o.findUploadedFiles(talk.getTalkNoteId(), "");
			talk.setFileInfo(fileInfo);
		}
		o.closeSession();
		return ar;
	}

	String addMiscCondition(String talkDateTime, String compName, String keyContenr) {
		StringBuffer sb = new StringBuffer();
		if (!talkDateTime.equals("")) {
			sb.append(" AND a.talkDateTime like '%" + talkDateTime + "%' ");
		}
		if (!compName.equals("")) {
			sb.append(" AND a.compName like '%" + compName + "%' ");
		}
		if (!keyContenr.equals("")) {
			sb.append(" AND (a.TalkTheme like '%" + keyContenr + "%' " + " or a.TalkContent like '%" + keyContenr
					+ "%' )");
		}
		return sb.toString();
	}

	String addTagCondition(String[] tags) {
		StringBuffer sb = new StringBuffer();
		if (tags != null && tags.length != 0) {
			sb.append(" AND (");
			for (int i = 0; i < tags.length; i++) {
				sb.append(" t.tagNames like '%" + tags[i] + "%' ");
				if (i != tags.length - 1) {
					sb.append(" or ");
				}
			}
			sb.append(")");
		}
		return sb.toString();
	}

	public ArrayList findTalkNotesBySearchTeacher(VOTalkNotesSearchCondition c, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		String userId = u.getUid();

		MySQLAccessStaff dbStaff = new MySQLAccessStaff();
		Staff staff = dbStaff.findStaffById(userId);

		StringBuffer sb = new StringBuffer();
		sb.append(" 1=1 ");
		sb.append(" AND type='" + TalkNotes.ConsultType_Teacher + "'");
		// sb.append(" AND a.consultantId='" + userId + "'");
		sb.append(addMiscCondition(c.getTalkDateTime(), c.getCompName(), c.getKeyContent()));
		sb.append(addTagCondition(c.getTags()));
		sb.append(" order by talkDateTime desc ");

		System.out.println(sb.toString());

		DbWhere d = new DbWhere();
		d.setUserId(userId);
		d.setWhere(sb.toString());

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList ar = (ArrayList) o.findTalkNotesByTagWhereString(d);
		for (int i = 0; i < ar.size(); i++) {
			TalkNotes talk = (TalkNotes) ar.get(i);
			ArrayList fileInfo = (ArrayList) o.findUploadedFiles(talk.getTalkNoteId(), "");
			talk.setFileInfo(fileInfo);

			String allTagNames = talk.getAllTagNames();
			if (allTagNames != null && !allTagNames.equals("")) {
				String[] myTags = allTagNames.split(",");
				talk.setTags(myTags);
			}
		}
		o.closeSession();
		return ar;
	}

	public ArrayList findTalkNotes(VOTalkNotesSearchCondition c, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		String userId = u.getUid();

		StringBuffer sb = new StringBuffer();
		sb.append(" 1=1 ");

		if (!c.getType().equals("")) {
			sb.append(" AND a.type='" + c.getType() + "'");
		}
		if (!c.getConsultantId().equals("")) {
			sb.append(" AND a.consultantId='" + c.getConsultantId() + "'");
		}
		if (!c.getUserIdList().equals("")) {
			sb.append(" AND a.consultantId in (" + c.getUserIdList() + ")");
		}
		if (!c.getStatus().equals("")) {
			sb.append(" AND status = '" + c.getStatus() + "' ");
		}

		sb.append(addMiscCondition(c.getTalkDateTime(), c.getCompName(), c.getKeyContent()));
		sb.append(addTagCondition(c.getTags()));
		sb.append(" order by a.talkDateTime desc ");

		System.out.println(sb.toString());

		DbWhere d = new DbWhere();
		d.setUserId(userId);
		d.setWhere(sb.toString());

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList ar = (ArrayList) o.findTalkNotesByTagWhereString(d);
		for (int i = 0; i < ar.size(); i++) {
			TalkNotes talk = (TalkNotes) ar.get(i);
			ArrayList fileInfo = (ArrayList) o.findUploadedFiles(talk.getTalkNoteId(), "");
			talk.setFileInfo(fileInfo);

			String allTagNames = talk.getAllTagNames();
			if (allTagNames != null && !allTagNames.equals("")) {
				String[] myTags = allTagNames.split(",");
				talk.setTags(myTags);
			}
		}
		o.closeSession();
		return ar;
	}

	public ArrayList findUnFinishedTalkNotes(VOTalkNotesSearchCondition c) {
		StringBuffer sb = new StringBuffer();
		sb.append(" 1=1 ");
		if (!c.getType().equals("")) {
			sb.append(" AND type = '" + c.getType() + "' ");
		}
		if (!c.getStatus().equals("")) {
			sb.append(" AND status = '" + c.getStatus() + "' ");
		}
		sb.append(" order by talkDateTime desc ");

		DbWhere d = new DbWhere();
		d.setWhere(sb.toString());
		// ------------------------------------------------------
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList ar = (ArrayList) o.findTalkNotesByWhereString(d);
		o.closeSession();
		return ar;
	}

	public void insertTalkNotes(TalkNotes talkNote, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		String compId = u.getCompid();

		// -----------------------------------------------------
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		Company comp = o.findCompanyByCompId(compId);

		talkNote.setTalkNoteId("TalkNote" + KeyMaker.newKey());
		talkNote.setCompId(comp.getUid());
		// String companyName = o.findCompanyNameByCompId(talkNote.getCompId());
		talkNote.setCompName(comp.getCompName());
		talkNote.setConsultantId(comp.getAmId());
		talkNote.setConsultantName(comp.getAmName());
		o.insertTalkNotes(talkNote);

		// UPLOAD file
		List files = talkNote.getFiles();
		ArrayList fileInfo = FileUpDownLoadUtil.upload(request, files);
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId("" + talkNote.getTalkNoteId());
			o.insertUploadedFileInfo(voFile);
		}

		o.closeSession();
	}

	public void updateMyTalkNotes(TalkNotes talkNotes, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		o.updateTalkNotes(talkNotes);

		// DELETE file info
		String[] deletedFiles = request.getParameterValues("deleteCheck");
		if (deletedFiles != null) {
			for (int i = 0; i < deletedFiles.length; i++) {
				o.deleteUploadedFileInfo(deletedFiles[i]);
			}
		}
		// UPLOAD file
		List files = talkNotes.getFiles_reply();

		System.out.println("files BBBB  size====" + files.size());

		ArrayList fileInfo = FileUpDownLoadUtil.upload(request, files);

		// SAVE file info
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId(talkNotes.getTalkNoteId());
			voFile.setType(TalkNotes.DOC_RPLY);
			o.insertUploadedFileInfo(voFile);
		}
		o.closeSession();
	}

	void updateTalkNoteTag(TalkNotes talkNotes, String[] tags, HttpServletRequest request, MySQLAccessMyBatis o) {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");

		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < tags.length; i++) {
			System.out.println("=======>>>>>xxx>>>>" + tags[i]);
			sb.append(tags[i]);
			if (i != tags.length - 1)
				sb.append(",");
		}

		TagRec tagRec = new TagRec();
		tagRec.setMyTagRecUid("tagRec" + KeyMaker.newKey());
		tagRec.setRecordUid(talkNotes.getTalkNoteId());
		tagRec.setTagNames(sb.toString());
		tagRec.setUserUid(u.getUid());

		o.deleteTagRec(tagRec);
		o.insertTagRec(tagRec);
	}

	public void updateMyTalkNotesAndTags(TalkNotes talkNotes, String[] tags, HttpServletRequest request)
			throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		// 存基本欄位
		o.updateTalkNotes(talkNotes);

		// ---------------------------------------------------
		// 存附件
		// DELETE file info
		String[] deletedFiles = request.getParameterValues("deleteCheck");
		if (deletedFiles != null) {
			for (int i = 0; i < deletedFiles.length; i++) {
				o.deleteUploadedFileInfo(deletedFiles[i]);
			}
		}
		// UPLOAD file
		List files = talkNotes.getFiles_reply();

		System.out.println("files BBBB  size====" + files.size());

		ArrayList fileInfo = FileUpDownLoadUtil.upload(request, files);

		// SAVE file info
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId(talkNotes.getTalkNoteId());
			voFile.setType(TalkNotes.DOC_RPLY);
			o.insertUploadedFileInfo(voFile);
		}
		// ---------------------------------------------------
		// 存 tag
		updateTalkNoteTag(talkNotes, tags, request, o);

		o.closeSession();
	}

	public void updateTalkNotes(TalkNotes talkNotes, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		o.updateTalkNotes(talkNotes);

		// DELETE file info
		String[] deletedFiles = request.getParameterValues("deleteCheck");
		if (deletedFiles != null) {
			for (int i = 0; i < deletedFiles.length; i++) {
				o.deleteUploadedFileInfo(deletedFiles[i]);
			}
		}
		// UPLOAD file
		List files = talkNotes.getFiles();
		ArrayList fileInfo = FileUpDownLoadUtil.upload(request, files);

		// SAVE file info
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId(talkNotes.getTalkNoteId());
			o.insertUploadedFileInfo(voFile);
		}
		o.closeSession();
	}

	public void updateComapnyIdForStatusTransfer(String oldId, String newId) throws SQLException {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
//		o.updateCompIdOfCompanyTable(oldId, newId);
//		o.updateComapnyIdForStatusTransfer(oldId, newId);
//		o.updateCompIdOfUploadedFilesTable(oldId, newId);
		o.closeSession();
	}

	public void updateTalkNoteTags(TalkNotes talkNotes, String[] tags, HttpServletRequest request) throws SQLException {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		updateTalkNoteTag(talkNotes, tags, request, o);
		o.closeSession();
	}

	public void updateTalkNoteTags(TagRec tagRec) throws SQLException {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.deleteTagRec(tagRec);
		o.insertTagRec(tagRec);
		o.closeSession();
	}

}
