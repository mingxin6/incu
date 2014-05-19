package com.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.Const;
import com.utils.DateUtil;
import com.vo.VOFile;

public class TalkNotes extends A {
	public static String STAT_CLOSE = "STAT_CLOSE";// "已結案";
	public static String STAT_PROC = "STAT_PROC";// "進行中";

	public static Map getCaesStatus(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		Map<String, String> statusCond = new LinkedHashMap<String, String>();
		statusCond.put("", "---");
		statusCond.put(STAT_CLOSE, resource.getString("review.status.close"));
		statusCond.put(STAT_PROC, resource.getString("review.status.open"));
		return statusCond;
	}

	public static String ConsultType_AM = "AM";
	public static String ConsultType_PM = "PM";
	public static String ConsultType_Teacher = "TEACHER";// "業師";
	public static String ConsultType_Other = "OTHER";// "其他"; // 中心人員主動輔導

	public static Map getConsultTypes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		Map<String, String> statusCond = new LinkedHashMap<String, String>();
		statusCond.put("", "---");
		statusCond.put(ConsultType_AM, resource.getString("talkNotes.type.AM"));
		statusCond.put(ConsultType_PM, resource.getString("talkNotes.type.PM"));
		statusCond.put(ConsultType_Teacher, resource.getString("talkNotes.type.teacher"));
		statusCond.put(ConsultType_Other, resource.getString("talkNotes.type.other"));
		return statusCond;
	}

	private String caseStatusRS = "";

	public String getCaseStatusRS() {
		return caseStatusRS;
	}

	public void setCaseStatusRS(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		if (STAT_CLOSE.equals(status)) {
			this.caseStatusRS = resource.getString("review.status.close");
		} else if (STAT_PROC.equals(status)) {
			this.caseStatusRS = resource.getString("review.status.open");
		} else {
			this.caseStatusRS = status;
		}
	}

	private String type = "";// ConsultType_AM? PM? Teacher?
	private String typeRS = "";

	public String getTypeRS() {
		return typeRS;
	}

	public void setTypeRS(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		if (ConsultType_Other.equals(type)) {
			this.typeRS = resource.getString("talkNotes.type.other");
		} else if (ConsultType_AM.equals(type)) {
			this.typeRS = resource.getString("talkNotes.type.AM");
		} else if (ConsultType_PM.equals(type)) {
			this.typeRS = resource.getString("talkNotes.type.PM");
		} else if (ConsultType_Teacher.equals(type)) {
			this.typeRS = resource.getString("talkNotes.type.teacher");
		} else {
			this.typeRS = type;
		}
	}

	public static String DOC_REQ = "REQ";
	public static String DOC_RPLY = "RPLY";

	private int seq = 0;

	private String talkNoteId = "";// id
	private String talkTheme = "";// 主題

	// 企業詢問
	private String compId = "";// 企业ID, 可以為空（如果是 consultant 自主輔導）
	private String compName = "";// 企业名稱
	private String talkContent = "";//
	private String talkDateTime = "";// 申請時間
	private List<MultipartFile> files;
	private ArrayList<VOFile> fileInfo;

	// 顧問回覆
	private String consultantId = "";// AM? PM? Teacher? 的 id
	private String consultantName = "";// AM? PM? Teacher? 的名稱
	private String replyContent = "";//
	private String replyDateTime = "";
	private List<MultipartFile> files_reply;
	private ArrayList<VOFile> fileInfo_reply;

	//
	// private String tag = "";// 自定的分類小標籤
	private String score = "";// 滿意度
	private String scoreContent = "";//

	String[] tags = new String[] {};
	String allTagNames = "";
	// ----------------------------------------
	// useless properties
	private Date talkStartTime;// useless
	private Date talkEndTime;// useless

	private String myPersonincharge;// 中心人員
	private String otherPersonincharge;// 對方人員
	private String talkAddress;//

	// ----------------------------------------

	public boolean isOpen() {
		return status.equals(STAT_PROC);
	}

	public boolean isClosed() {
		return status.equals(STAT_CLOSE);
	}

	@Override
	public int hashCode() {
		return talkNoteId.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (!(obj instanceof TalkNotes)) {
			return false;
		}
		return this.talkNoteId == ((TalkNotes) obj).getTalkNoteId();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getConsultantId() {
		return consultantId;
	}

	public void setConsultantId(String consultantId) {
		this.consultantId = consultantId;
	}

	public String getConsultantName() {
		return consultantName;
	}

	public void setConsultantName(String consultantName) {
		this.consultantName = consultantName;
	}

	public List<MultipartFile> getFiles_reply() {
		return files_reply;
	}

	public void setFiles_reply(List<MultipartFile> filesReply) {
		files_reply = filesReply;
	}

	public ArrayList<VOFile> getFileInfo_reply() {
		return fileInfo_reply;
	}

	public void setFileInfo_reply(ArrayList<VOFile> fileInfoReply) {
		fileInfo_reply = fileInfoReply;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyDateTime() {
		return replyDateTime;
	}

	public void setReplyDateTime(String replyDateTime) {
		this.replyDateTime = replyDateTime;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public ArrayList<VOFile> getFileInfo() {
		return fileInfo;
	}

	public void setFileInfo(ArrayList<VOFile> fileInfo) {
		this.fileInfo = fileInfo;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getTalkDateTime() {
		return talkDateTime;
	}

	// 民國年
	public String getTalkDateTime2() {
		return new DateUtil().getROCDate(getTalkDateTime());
	}

	public void setTalkDateTime(String talkDateTime) {
		this.talkDateTime = talkDateTime;
	}

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getTalkNoteId() {
		return talkNoteId;
	}

	public void setTalkNoteId(String id) {
		this.talkNoteId = id;
	}

	public String getTalkTheme() {
		return talkTheme;
	}

	public void setTalkTheme(String talkTheme) {
		this.talkTheme = talkTheme;
	}

	public String getTalkContent() {
		return talkContent;
	}

	public void setTalkContent(String talkContent) {
		this.talkContent = talkContent;
	}

	public Date getTalkStartTime() {
		return talkStartTime;
	}

	public void setTalkStartTime(Date talkStartTime) {
		this.talkStartTime = talkStartTime;
	}

	public Date getTalkEndTime() {
		return talkEndTime;
	}

	public void setTalkEndTime(Date talkEndTime) {
		this.talkEndTime = talkEndTime;
	}

	public String getMyPersonincharge() {
		return myPersonincharge;
	}

	public void setMyPersonincharge(String myPersonincharge) {
		this.myPersonincharge = myPersonincharge;
	}

	public String getOtherPersonincharge() {
		return otherPersonincharge;
	}

	public void setOtherPersonincharge(String otherPersonincharge) {
		this.otherPersonincharge = otherPersonincharge;
	}

	public String getTalkAddress() {
		return talkAddress;
	}

	public void setTalkAddress(String talkAddress) {
		this.talkAddress = talkAddress;
	}

	public String getScoreContent() {
		return scoreContent;
	}

	public void setScoreContent(String scoreContent) {
		this.scoreContent = scoreContent;
	}

	public String[] getTags() {
		return tags;
	}

	public void setTags(String[] tags) {
		this.tags = tags;
	}

	public void setAllTagNames(String allTagNames) {
		this.allTagNames = allTagNames;
	}

	public String getAllTagNames() {
		return this.allTagNames;
		// String s = "";
		// for (int i = 0; i < tags.length; i++) {
		// s = s + "[" + tags[i] + "]";
		// if (i != tags.length - 1) {
		// s = s + ",";
		// }
		// }
		// return s;
	}

}