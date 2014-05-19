package com.mod.talkNote.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.db.DbWhere;
import com.db.MySQLAccessMyBatis;
import com.model.Company;
import com.model.ReviewPaper;
import com.model.TalkNotes;
import com.model.User;
import com.utils.FileUpDownLoadUtil;
import com.utils.KeyMaker;
import com.vo.VOFile;
import com.vo.VOTalkNotesSearchCondition;

public class MySQLAccessRequest {
	public String findVisitCount2(Map map) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		String cnt = o.findVisitCount2(map);
		o.closeSession();
		return cnt;
	}

	public String findVisitCount3(Map map) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		String cnt = o.findVisitCount3(map);
		o.closeSession();
		return cnt;
	}
	
	public TalkNotes selectTalkNotesByNoteId(String noteId) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		TalkNotes talk = o.findTalkNotesById(noteId);

		ArrayList fileInfo = (ArrayList) o.findUploadedFiles(talk.getTalkNoteId(), TalkNotes.DOC_REQ);
		talk.setFileInfo(fileInfo);

		ArrayList fileInfo_r = (ArrayList) o.findUploadedFiles(talk.getTalkNoteId(), TalkNotes.DOC_RPLY);
		talk.setFileInfo_reply(fileInfo_r);

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

	public ArrayList findTalkNotesBySearch(VOTalkNotesSearchCondition c, HttpServletRequest request) {
		// HttpSession session = request.getSession(false);
		// User u = (User) session.getAttribute("user");
		// String compName = u.getUserComp();
		// c.setCompName(compName);

		StringBuffer sb = new StringBuffer();
		sb.append(" 1=1 ");
		if (!c.getTalkDateTime().equals("")) {
			sb.append(" AND talkDateTime like '%" + c.getTalkDateTime() + "%' ");
		}
		if (!c.getCompName().equals("")) {
			sb.append(" AND compName like '%" + c.getCompName() + "%' ");
		}
		if (!c.getCompId().equals("")) {
			sb.append(" AND compId = '" + c.getCompId() + "' ");
		}
		if (!c.getType().equals("")) {
			sb.append(" AND type = '" + c.getType() + "' ");
		}
		if (!c.getKeyContent().equals("")) {
			sb.append(" AND (TalkTheme like '%" + c.getKeyContent() + "%' " + " or TalkContent like '%"
					+ c.getKeyContent() + "%' )");
		}
		sb.append(" order by talkDateTime desc ");

		DbWhere d = new DbWhere();
		d.setWhere(sb.toString());

		// ------------------------------------------------------
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList ar = (ArrayList) o.findTalkNotesByWhereString(d);
		for (int i = 0; i < ar.size(); i++) {
			{
				TalkNotes talk = (TalkNotes) ar.get(i);
				ArrayList fileInfo = (ArrayList) o.findUploadedFiles(talk.getTalkNoteId(), TalkNotes.DOC_REQ);
				talk.setFileInfo(fileInfo);
			}
			{
				TalkNotes talk = (TalkNotes) ar.get(i);
				ArrayList fileInfo = (ArrayList) o.findUploadedFiles(talk.getTalkNoteId(), TalkNotes.DOC_RPLY);
				talk.setFileInfo_reply(fileInfo);
			}
		}
		o.closeSession();
		return ar;
	}

	

	public void insertTalkNotes(String requestType, String compId, String compName, String consultantId,
			String consultantName, TalkNotes talkNote, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		talkNote.setTalkNoteId("TalkNote" + KeyMaker.newKey());
		talkNote.setCompId(compId);
		talkNote.setType(requestType);
		talkNote.setCompName(compName);
		talkNote.setConsultantId(consultantId);
		talkNote.setConsultantName(consultantName);
		talkNote.setStatus(TalkNotes.STAT_PROC);
		talkNote.markCreatinfo(request);
		talkNote.markModifyinfo(request);
		o.insertTalkNotes(talkNote);

		// UPLOAD file
		List files = talkNote.getFiles();
		ArrayList fileInfo = FileUpDownLoadUtil.upload(request, files);
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId("" + talkNote.getTalkNoteId());
			voFile.setType(TalkNotes.DOC_REQ);
			o.insertUploadedFileInfo(voFile);
		}

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

	public void updateTalkNotesScoreAndStatus(TalkNotes talkNotes, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.updateTalkNotesScoreAndStatus(talkNotes);
		o.closeSession();
	}

//	public void updateComapnyIdForStatusTransfer(String oldId, String newId) throws SQLException {
//		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
//		o.openSession();
//		o.updateCompIdOfCompanyTable(oldId, newId);
//		o.updateComapnyIdForStatusTransfer(oldId, newId);
//		o.updateCompIdOfUploadedFilesTable(oldId, newId);
//		o.closeSession();
//	}

}
