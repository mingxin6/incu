package com.db;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import com.entity.PotentiallyCompanyNotes;
import com.entity.Problems;
import com.entity.Provides;
import com.mkyong.customer.controller.CalculateTotal;
import com.model.Announcement;
import com.model.AwardRecord;
import com.model.Company;
import com.model.CompanyIndex;
import com.model.CompanyUser;
import com.model.FloorInfo;
import com.model.GrantRecord;
import com.model.IPREC;
import com.model.MonthlyReport;
import com.model.ReviewPaper;
import com.model.Room;
import com.model.ServiceResourceAccept;
import com.model.ServiceResourceData;
import com.model.SharedThing;
import com.model.Staff;
import com.model.TalkNotes;
import com.model.User;
import com.utils.DateUtil;
import com.utils.FileUpDownLoadUtil;
import com.utils.KeyMaker;
import com.utils.PassUtil;
import com.vo.VOCompListCondition;
import com.vo.VOFile;
import com.vo.VOMonthlyReportCondition;
import com.vo.VOQuarterlyReportCondition;
import com.vo.VOUserAccountListCondition;
import com.vo.VOYearMonthCondition;
import com.vo.VOYearlyReportCondition;

public class MySQLAccess extends MySQLAcc {

	public static void main(String[] args) throws Exception {
		MySQLAccess o = new MySQLAccess();

		o.connectDB();

		Statement statement = o.conn.createStatement();
		int roomNo = 510;
		int compId = 0;
		int roomArea = 0;
		String compStr = "";
		String remark = "备注";
		String sql1 = "insert into room(" + "roomNo" + "," + "compId" + "," + "roomArea" + "," + "remark"
				+ ") values (";

		for (int i = 0; i <= 60; i++, roomNo++) {
			compStr = "NSI" + roomNo;
			System.out.println("compStr==" + compStr);
			String sql2 = "'" + roomNo + "'" + "," + "'" + compStr + "'" + "," + "'" + roomNo + "'" + "," + "'"
					+ remark + "'" + ")";
			System.out.println("sql====" + sql1 + sql2);
			statement.executeUpdate(sql1 + sql2);
		}

		o.closeDB();

		// UserAccount x = o.readUserAccountByLoginIdAndPwd("aa", "xx");
		// if (x == null) {
		// System.out.println("xxxxxxxxxxxxxx nullll");
		// } else {
		// System.out.println("xxxxxxxxxxxxxx not nullll");
		// }
	}

	public void insertAnnouncementRead(String rid, String aid, String cid) throws SQLException {
		String sql = "insert into announcement_read(" + "ID" + "," + "AnnouncementID" + "," + "CompanyID"
				+ ") values (" + //
				"'" + rid + "'" + "," + "'" + aid + "'" + "," + "'" + cid + "'" + ")";

		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	public void insertAnnouncement(Announcement obj) throws SQLException {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.insertAnnouncement(obj);

		ArrayList fileInfo = obj.getFileInfo();
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId(obj.aid);
			o.insertUploadedFileInfo(voFile);
		}
		o.closeSession();
	}

	public void insertSharedThing(SharedThing obj, String table) throws SQLException {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		obj.setTable(table);
		o.insertSharedThing(obj);

		ArrayList fileInfo = obj.getFileInfo();
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId(obj.aid);
			o.insertUploadedFileInfo(voFile);
		}
		o.closeSession();
	}

	public void insertUploaedFiles(String topicId, ArrayList fileInfo) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId(topicId);
			o.insertUploadedFileInfo(voFile);
		}
		o.closeSession();
	}

	public void deleteUploaedFiles(String[] deletedFiles) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		for (int i = 0; i < deletedFiles.length; i++) {
			o.deleteUploadedFileInfo(deletedFiles[i]);
		}
		o.closeSession();
	}

	public void updateAnnouncement(Announcement announcement, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		// UPDATE announcement
		o.updateAnnouncement(announcement);

		// DELETE file info
		String[] deletedFiles = request.getParameterValues("deleteCheck");
		if (deletedFiles != null) {
			for (int i = 0; i < deletedFiles.length; i++) {
				o.deleteUploadedFileInfo(deletedFiles[i]);
			}
		}

		// UPLOAD file
		List files = announcement.getFiles();
		ArrayList fileInfo = FileUpDownLoadUtil.upload(request, files);

		// SAVE file info
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId(announcement.aid);
			o.insertUploadedFileInfo(voFile);
		}

		o.closeSession();
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

	public void updateAccount(Company comp, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		String p2 = comp.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			comp.setUserLoginPwd(p2);
		}
		comp.markModifyinfo(request);

		String compUid = comp.getUid();
		// --------------------------------------------
		// 檢查 CompanyUser table 中有無本公司帳號
		StringBuffer sb = new StringBuffer();
		sb.append(" compUid='" + compUid + "' ");
		System.out.println("findCompanyUsersByCompId==>" + sb.toString());

		DbWhere d = new DbWhere();
		d.setWhere(sb.toString());
		ArrayList compUsers = (ArrayList) o.findCompanyUserByWhereString(d);
		// System.out.println("compUsers recs size=" + compUsers.size());
		// --------------------------------------------
		if (compUsers.size() == 0) {
			CompanyUser compUser = new CompanyUser();
			compUser.setUid("compUser" + KeyMaker.newKey());
			compUser.setName(comp.getCompName());

			// 不可靠
			// String m=comp.getAdminContactEmail();
			// String[] mails=m.split(",");
			// compUser.setEmail(mails[0]);

			compUser.setUserLoginId(comp.getUserLoginId());
			compUser.setUserLoginPwd(comp.getUserLoginPwd());
			compUser.setStatus(comp.getAccountStatus());

			compUser.setCompUid(comp.getUid());
			compUser.setCustomId(comp.getCustomId());
			compUser.setCompName(comp.getCompName());
			compUser.markCreatinfo(request);
			compUser.markModifyinfo(request);

			o.insertCompanyUsers(compUser);

			// -------------------------------------------------
			User user = fillUserObjOfCompanyUser(compUser);
			o.insertUser(user);
		} else {
			CompanyUser cu = (CompanyUser) compUsers.get(0);

			cu.setUserLoginId(comp.getUserLoginId());
			cu.setUserLoginPwd(comp.getUserLoginPwd());
			cu.setStatus(comp.getAccountStatus());

			// update CompanyUser table
			o.updateCompanyUser(cu);

			// -------------------------------------------------
			// update Users table
			User user = fillUserObjOfCompanyUser(cu);
			o.updateUser(user);
		}

		o.closeSession();
	}

	public void updateIP(Company comp, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		// DELETE
		String[] deleteIp = request.getParameterValues("deleteIp");
		Set del = new TreeSet();
		if (deleteIp != null) {
			for (int i = 0; i < deleteIp.length; i++) {
				System.out.println("deleteIp=>" + deleteIp[i]);
				del.add(deleteIp[i]);
				o.deleteIp(deleteIp[i]);
			}
		}

		// INSERT
		String[] myno = request.getParameterValues("myno");
		String[] myname = request.getParameterValues("myname");
		String[] mycountry = request.getParameterValues("mycountry");
		String[] mydate = request.getParameterValues("mydate");
		if (myno != null) {
			for (int i = 0; i < myno.length; i++) {
				System.out.println("newIp=>" + myno[i] + "," + myname[i] + "," + mycountry[i] + "," + mydate[i]);
				IPREC ipRec = new IPREC();
				ipRec.setUid(KeyMaker.newKey());
				ipRec.setCompId(comp.uid);
				ipRec.setIpNo(myno[i]);
				ipRec.setIpName(myname[i]);
				ipRec.setIpCountry(mycountry[i]);
				ipRec.setIpDate(mydate[i]);
				ipRec.setRemark("");
				o.insertIp(ipRec);
			}
		}

		// UPDATE
		ArrayList ips = (ArrayList) comp.getIpRecs();
		for (int i = 0; i < ips.size(); i++) {
			IPREC ipRec = (IPREC) ips.get(i);
			System.out.println("ipRec---->" + comp.uid + "," + ipRec.getUid() + "," + ipRec.getIpNo() + ","
					+ ipRec.getIpCountry());
			if (!del.contains(ipRec.getUid())) {
				o.updateIp(ipRec);
			}
		}

		o.closeSession();
	}

	public void updateAward(Company comp, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		// DELETE
		String[] deleteAwards = request.getParameterValues("deleteAward");
		Set del = new TreeSet();
		if (deleteAwards != null) {
			for (int i = 0; i < deleteAwards.length; i++) {
				System.out.println("deleteAward=>" + deleteAwards[i]);
				del.add(deleteAwards[i]);
				o.deleteAward(deleteAwards[i]);
			}
		}

		// INSERT
		String[] myAwardName = request.getParameterValues("myAwardName");
		String[] myAwardIssuer = request.getParameterValues("myAwardIssuer");
		String[] myHasAwardMoney = request.getParameterValues("myHasAwardMoney");
		String[] myAwardDate = request.getParameterValues("myAwardDate");
		if (myAwardName != null) {
			for (int i = 0; i < myAwardName.length; i++) {
				System.out.println("newIp=>" + myAwardName[i] + "," + myAwardIssuer[i] + "," + myHasAwardMoney[i] + ","
						+ myAwardDate[i]);
				AwardRecord obj = new AwardRecord();
				obj.setUid(KeyMaker.newKey());
				obj.setCompId(comp.uid);
				obj.setAwardName(myAwardName[i]);
				obj.setAwardIssuer(myAwardIssuer[i]);
				obj.setHasAwardMoney(myHasAwardMoney[i]);
				obj.setAwardDate(myAwardDate[i]);
				obj.setRemark("");
				o.insertAward(obj);
			}
		}

		// UPDATE
		ArrayList awards = (ArrayList) comp.getAwardRecs();
		for (int i = 0; i < awards.size(); i++) {
			AwardRecord awardRecord = (AwardRecord) awards.get(i);
			System.out.println("awardRecord---->" + comp.uid + "," + awardRecord.getUid() + ","
					+ awardRecord.getAwardName() + "," + awardRecord.getAwardIssuer());
			if (!del.contains(awardRecord.getUid())) {
				o.updateAward(awardRecord);
			}
		}

		o.closeSession();
	}

	public void updateGrant(Company comp, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		// DELETE
		String[] deleteGrant = request.getParameterValues("deleteGrant");
		Set del = new TreeSet();
		if (deleteGrant != null) {
			for (int i = 0; i < deleteGrant.length; i++) {
				del.add(deleteGrant[i]);
				o.deleteGrant(deleteGrant[i]);
			}
		}

		// INSERT
		String[] myGrantName = request.getParameterValues("myGrantName");
		String[] myGrantIssuer = request.getParameterValues("myGrantIssuer");
		String[] myProjectName = request.getParameterValues("myProjectName");
		String[] myGrantDate = request.getParameterValues("myGrantDate");
		String[] myProjTotalMoney = request.getParameterValues("myProjTotalMoney");
		String[] myGrantMoney = request.getParameterValues("myGrantMoney");
		if (myGrantName != null) {
			for (int i = 0; i < myGrantName.length; i++) {
				GrantRecord obj = new GrantRecord();
				obj.setUid(KeyMaker.newKey());
				obj.setCompId(comp.uid);
				obj.setGrantName(myGrantName[i]);
				obj.setGrantIssuer(myGrantIssuer[i]);
				obj.setProjectName(myProjectName[i]);
				obj.setGrantDate(myGrantDate[i]);
				obj.setProjTotalMoney(myProjTotalMoney[i]);
				obj.setGrantMoney(myGrantMoney[i]);
				obj.setRemark("");
				o.insertGrant(obj);
			}
		}

		// UPDATE
		ArrayList ar = (ArrayList) comp.getGrantRecs();
		for (int i = 0; i < ar.size(); i++) {
			GrantRecord grantRecord = (GrantRecord) ar.get(i);
			if (!del.contains(grantRecord.getUid())) {
				o.updateGrant(grantRecord);
			}
		}

		o.closeSession();
	}

	public void updateSharedThing(SharedThing obj, String table) throws Exception {
		String sql = "update " + table + " set" //
				+ " Title=" + "'" + obj.title + "'"//
				+ "," //
				+ " Message=" + "'" + obj.message + "'"//
				+ "," //
				+ " CreateName=" + "'" + obj.createName + "'" //
				+ "," //
				+ " CreateDate=" + "'" + obj.createDate + "'"//
				+ "," //
				+ " Status=" + "'" + obj.status + "'" //
				+ " WHERE ID='" + obj.aid + "'";

		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	public void insertServiceResourceData(ServiceResourceData obj) throws SQLException {
		String sql = "insert into service_resource_data(" + "ID" + "," + "Name" + "," + "Money" + "," + "Status" + ","
				+ "Remarks" + "," + "Categorize" + ") values (" + //
				"'"//
				+ obj.srdid//
				+ "'"//
				+ ","//
				+ "'"//
				+ obj.name//
				+ "'"//
				+ ","//
				+ "'"//
				+ obj.money//
				+ "'"//
				+ ","//
				+ "'"//
				+ obj.status//
				+ "'" + "," + "'" //
				+ obj.remarks //
				+ "'" + "," + "'" //
				+ obj.categorize //
				+ "'" //
				+ ")";

		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	public void updateServiceResourceData(ServiceResourceData obj) throws Exception {
		String sql = "update service_resource_data set" + " Name=" + "'" + obj.name + "'" + "," + " Money=" + "'"
				+ obj.money + "'" + "," + " Status=" + "'" + obj.status + "'" + "," + " Remarks=" + "'" + obj.remarks
				+ "'" + " WHERE ID='" + obj.srdid + "'";

		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	public void insertServiceResourceAccept(ServiceResourceAccept obj) throws SQLException {
		String sql = "insert into service_resource_accept(" + "ID" + "," + "SRDID" + "," + "CompanyID" + ","
				+ "CreateDate" + "," + "NeedDateStart" + "," + "NeedDateEnd" + "," + "Contacts" + "," + "Tel" + ","
				+ "Remarks" + "," + "AcceptStatus" + ") values (" + //
				"'"
				+ obj.sraid
				+ "'"
				+ ","
				+ "'"
				+ obj.srdid
				+ "'"
				+ ","
				+ "'"
				+ obj.company_id
				+ "'"
				+ ","
				+ "'"
				+ obj.create_date
				+ "'"
				+ ","
				+ "'"
				+ obj.need_date_start
				+ "'"
				+ ","
				+ "'"
				+ obj.need_date_end
				+ "'"
				+ ","
				+ "'"
				+ obj.contacts
				+ "'"
				+ ","
				+ "'"
				+ obj.tel
				+ "'"
				+ ","
				+ "'"
				+ obj.remarks
				+ "'"
				+ ","
				+ "'" + obj.accept_status + "'" + ")";

		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	public void updateServiceResourceAccept(ServiceResourceAccept obj) throws Exception {
		String sql = "update service_resource_accept set" + " NeedDateStart=" + "'" + obj.need_date_start + "'" + ","
				+ " NeedDateEnd=" + "'" + obj.need_date_end + "'" + "," + " Contacts=" + "'" + obj.contacts + "'" + ","
				+ " Tel=" + "'" + obj.tel + "'" + "," + " Remarks=" + "'" + obj.remarks + "'" + " WHERE ID='"
				+ obj.sraid + "'";

		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	public void updateServiceResourceAcceptStatus(String str_id, String accept_status) throws Exception {
		String sql = "update service_resource_accept set" + " AcceptStatus=" + "'" + accept_status + "'"
				+ " WHERE ID='" + str_id + "'";

		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	public void updatePassword(String loginid, String loginpwd, String newpwd) throws Exception {
		loginpwd = new PassUtil().encodeClearText(loginpwd);
		newpwd = new PassUtil().encodeClearText(newpwd);

		String sql = "update USERS set" + " userLoginPwd=" + "'" + newpwd + "'" //
				+ " WHERE" //
				+ " userloginid='" + loginid + "'" //
				+ " AND userLoginPwd='" + loginpwd + "'";

		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	void updateCompDoc(Company comp, HttpServletRequest request, MySQLAccessMyBatis o) throws Exception {

		processUpload2(comp.uid, ReviewPaper.FILE_OTHERFILES, comp.getHandoverFiles(), "deleteCheckHandover", request,
				o);

		// loadReviewDocs(comp, o);

		// String[] deletedCheckPaperFiles = request.getParameterValues("deleteCheckPaper");
		// if (deletedCheckPaperFiles != null) {
		// for (int i = 0; i < deletedCheckPaperFiles.length; i++) {
		// o.deleteUploadedFileInfo(deletedCheckPaperFiles[i]);
		// }
		// }
		//
		// // UPLOAD file
		// List paperCheckFiles = comp.getPaperCheckFiles();
		// if (paperCheckFiles != null && paperCheckFiles.size() != 0) {
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

	public void updateCompanyDocuments(Company comp, HttpServletRequest request, MySQLAccessMyBatis o) throws Exception {
		updateCompDoc(comp, request, o);
	}

	public void updateCompanyDocuments(Company comp, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		updateCompDoc(comp, request, o);
		o.closeSession();
	}

	public void updateCompany(Company comp, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		String amid = comp.getAmId();
		Staff AM = o.findStaffById(amid);
		String pmid = comp.getPmId();
		Staff PM = o.findStaffById(pmid);
		// comp.setAmId(AM.getUid());
		comp.setAmName(AM.getName());
		// comp.setPmId(PM.getUid());
		comp.setPmName(PM.getName());

		// DELETE file info
		String deleteLogo = request.getParameter("deleteLogo");

		String t = request.getRealPath("/");
		int nn = t.indexOf("webapps") + "webapps".length();
		String t2 = t.substring(0, nn + 1);
		// System.out.println("pppppppppppppppp00000000000====>"
		// + request.getContextPath() + "," + request.getRealPath("/")
		// + "," + t2);
		// String targetDir = "D:/apache-tomcat-7.0.42_32bits/webapps/imgsite/";
		String targetDir = t2 + "imgsite/";

		if (deleteLogo != null) {
			comp.setLogoFileName("");
		}

		// UPLOAD file
		MultipartFile file = comp.getLogoFile();

		// System.out.println("MultipartFile ----xxx---->"
		// + file.getOriginalFilename());

		if (file != null && !file.getOriginalFilename().equals("") && !file.isEmpty()) {
			ArrayList files = new ArrayList();
			files.add(file);
			ArrayList fileInfo = FileUpDownLoadUtil.upload(request, files, targetDir);
			VOFile voFile = (VOFile) fileInfo.get(0);

			String imgurl = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + "/imgsite/"
					+ voFile.getModifiedFileName();

			comp.setLogoFileName(imgurl);
		}
		// UPDATE
		o.updateCompany(comp);
		o.closeSession();
	}

	// private Announcement fillAnnouncement(ResultSet rs, User user) {
	//
	// Announcement obj = new Announcement();
	//
	// try {
	// obj.aid = rs.getString("ID");
	// // System.out.println("ID = " + rs.getString("ID"));
	// obj.title = rs.getString("Title");
	// // System.out.println("Title = " + rs.getString("Title"));
	// obj.message = rs.getString("Message");
	// // System.out.println("Message = " + rs.getString("Message"));
	// obj.link = rs.getString("Link");
	// // System.out.println("Link = " + rs.getString("Link"));
	// obj.type = rs.getString("Type");
	// // System.out.println("Type = " + rs.getString("Type"));
	// obj.createName = rs.getString("CreateName");
	// // System.out.println("CreateName = " + rs.getString("CreateName"));
	//
	// // obj.createDate = rs.getString("CreateDate");
	// // System.out.println("CreateDate = " + rs.getString("CreateDate"));
	//
	// // --------------------------------------------------------------
	// Date d = rs.getDate("CreateDate");
	// DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	// String dddd = dateFormat.format(d);
	// // System.out.println("XXXX yyyuuu  mmm  dddd=" + dddd);
	//
	// Date t = rs.getTime("CreateDate");
	// DateFormat dateFormat2 = new SimpleDateFormat("HH:mm");
	// String tttt = dateFormat2.format(t);
	// // System.out.println("XXXX yyyuuu  mmm  tttt=" + tttt);
	//
	// obj.createDate = dddd + " " + tttt;
	// // --------------------------------------------------------------
	//
	// obj.status = rs.getString("Status");
	// // System.out.println("Status = " + rs.getString("Status"));
	//
	// obj.announcement_read_id = rs.getString("b_ID");
	// // System.out.println("announcement_read_id = " +
	// // rs.getString("b_ID"));
	// obj.company_id = rs.getString("c_ID");
	// // System.out.println("company_id = " + rs.getString("c_ID"));
	//
	// if (obj.announcement_read_id == null)
	// obj.announcement_read_id = "<font color=\"red\">(New)</font>";
	// else {
	// if (user.getCompid().equals(obj.company_id))
	// obj.announcement_read_id = "";
	// else
	// obj.announcement_read_id = "<font color=\"red\">(New)</font>";
	// }
	//
	// // if (obj.type.equals("1")) {
	// // obj.gourl = obj.link;
	// // } else {
	// obj.gourl = "announcementView.htm?aid=" + obj.aid;
	// // }
	//
	// } catch (SQLException e) {
	//
	// e.printStackTrace();
	// }
	//
	// return obj;
	// }

	private ServiceResourceData fillServiceResourceData(ResultSet rs) {
		ServiceResourceData obj = new ServiceResourceData();
		try {
			obj.srdid = rs.getString("ID");
			obj.name = rs.getString("Name");
			obj.money = rs.getString("Money");
			obj.status = rs.getString("Status");
			obj.remarks = rs.getString("Remarks");
			obj.categorize = rs.getString("Categorize");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return obj;
	}

	private ServiceResourceAccept fillServiceResourceAccept(ResultSet rs) {

		ServiceResourceAccept obj = new ServiceResourceAccept();

		try {
			obj.sraid = rs.getString("ID");
			obj.srdid = rs.getString("SRDID");
			obj.company_id = rs.getString("CompanyID");

			// --------------------------------------------------------------
			Date d = rs.getDate("CreateDate");
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dddd = dateFormat.format(d);
			// System.out.println("XXXX yyyuuu  mmm  dddd=" + dddd);

			Date t = rs.getTime("CreateDate");
			DateFormat dateFormat2 = new SimpleDateFormat("HH:mm");
			String tttt = dateFormat2.format(t);
			// System.out.println("XXXX yyyuuu  mmm  tttt=" + tttt);

			obj.create_date = dddd + " " + tttt;
			// --------------------------------------------------------------

			// obj.create_date = rs.getString("CreateDate");

			obj.need_date_start = rs.getString("NeedDateStart");
			obj.need_date_end = rs.getString("NeedDateEnd");
			obj.contacts = rs.getString("Contacts");
			obj.tel = rs.getString("Tel");
			obj.remarks = rs.getString("Remarks");
			obj.accept_status = rs.getString("AcceptStatus");
			obj.srd_name = rs.getString("srdName");
			obj.srd_categorize = rs.getString("srdCategorize");
			obj.company_name = rs.getString("c_CompanyName");
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return obj;
	}

	private ServiceResourceAccept fillServiceResourceAccept2(ResultSet rs) {

		ServiceResourceAccept obj = new ServiceResourceAccept();

		try {
			obj.sraid = rs.getString("ID");
			obj.srdid = rs.getString("SRDID");
			obj.company_id = rs.getString("CompanyID");

			// --------------------------------------------------------------
			Date d = rs.getDate("CreateDate");
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dddd = dateFormat.format(d);
			// System.out.println("XXXX yyyuuu  mmm  dddd=" + dddd);

			Date t = rs.getTime("CreateDate");
			DateFormat dateFormat2 = new SimpleDateFormat("HH:mm");
			String tttt = dateFormat2.format(t);
			// System.out.println("XXXX yyyuuu  mmm  tttt=" + tttt);

			obj.create_date = dddd + " " + tttt;
			// --------------------------------------------------------------

			// obj.create_date = rs.getString("CreateDate");

			obj.need_date_start = rs.getString("NeedDateStart");
			obj.need_date_end = rs.getString("NeedDateEnd");
			obj.contacts = rs.getString("Contacts");
			obj.tel = rs.getString("Tel");
			obj.remarks = rs.getString("Remarks");
			obj.accept_status = rs.getString("AcceptStatus");
			obj.srd_name = rs.getString("srdName");
			obj.srd_categorize = rs.getString("srdCategorize");
			// obj.company_name = rs.getString("c_CompanyName");
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return obj;
	}

	public Announcement readAnnouncementByID(String topicId, User user) {
		Announcement obj = new Announcement();
		// // String sql = "select a.*,b.ID'b_ID',c.ID'c_ID'" + //
		// // " FROM announcement a" + //
		// // " LEFT JOIN announcement_read b" + //
		// // " ON a.ID = b.AnnouncementID" + //
		// // " left Join isi_company c ON c.ID = b.CompanyID" + //
		// // " where a.ID='" + topicId + "'";
		// //
		// // try {
		// // connectDB();
		// // statement = conn.createStatement();
		// // rs = statement.executeQuery(sql);
		// // while (rs.next()) {
		// // obj = fillAnnouncement(rs, user);
		// // }
		//
		// //
		// ---------------------------------------------------------------------------
		// String compId = user.getCompid();// 公司唯一代码
		//
		// MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		// o.openSession();
		//
		// Announcement obj = o.findAnnouncementByID(topicId);
		// VOAnnouncementRead vOAnnouncementRead = o.findReadAnnouncementById(
		// topicId, compId);
		// if (vOAnnouncementRead == null) {
		// // if (obj.announcement_read_id == null)
		// obj.announcement_read_id = "<font color=\"red\">(New)</font>";
		// } else {
		// if (user.getCompid().equals(obj.company_id))
		// obj.announcement_read_id = "";
		// else
		// obj.announcement_read_id = "<font color=\"red\">(New)</font>";
		// }
		//
		// // if (obj.type.equals("1")) {
		// // obj.gourl = obj.link;
		// // } else {
		// obj.gourl = "announcementView.htm?aid=" + obj.aid;
		//
		// // obj.announcement_read_id = obj.company_id = compId;
		//
		// ArrayList fileInfo = (ArrayList) o.findUploadedFiles(topicId, "");
		// obj.setFileInfo(fileInfo);
		//
		// o.closeSession();

		return obj;

	}

	public ServiceResourceData readServiceResourceDataByID(String str_id) {
		ServiceResourceData obj = new ServiceResourceData();
		String sql = "select * FROM service_resource_data where ID='" + str_id + "'";

		try {
			connectDB();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				obj = fillServiceResourceData(rs);
			}
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			return new ServiceResourceData();
		} finally {
			closeDB();
		}
	}

	public ServiceResourceAccept readServiceResourceAcceptByID(String str_id, String categorize, String company_id) {

		ServiceResourceAccept obj = new ServiceResourceAccept();

		String sql = "";
		sql += " select a.*,b.Name'srdName',b.Categorize'srdCategorize' ";
		sql += " FROM service_resource_accept a LEFT JOIN service_resource_data b ON a.SRDID = b.ID ";
		sql += " where a.ID='" + str_id + "' and a.CompanyID='" + company_id + "' and b.Categorize='" + categorize
				+ "' ";
		sql += " order by a.ID desc ";

		// System.out.println(sql);

		// try {
		// FileUtils.writeStringToFile(new File("c:/xxx2.txt"), sql);
		// } catch (IOException e1) {
		// // TODO Auto-generated catch block
		// e1.printStackTrace();
		// }

		try {
			connectDB();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				obj = fillServiceResourceAccept2(rs);
			}
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			return new ServiceResourceAccept();
		} finally {
			closeDB();
		}
	}

	public String readCompIdFromCompName(String compName) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		Company comp = (Company) o.findCompanyByCompName(compName);
		o.closeSession();
		return comp.uid;
	}

	String getRoomString(ArrayList rooms) {
		String s = "";
		for (int i = 0; i < rooms.size(); i++) {
			Room room = (Room) rooms.get(i);
			s = s + room.getRoomNo();
			if (i != rooms.size() - 1)
				s = s + ",";
		}
		return s;
	}

	String getRoomTotalArea(ArrayList rooms) {
		double d = 0.0;
		for (int i = 0; i < rooms.size(); i++) {
			Room room = (Room) rooms.get(i);
			String area = room.getRoomArea();
			try {
				d = d + Double.parseDouble(area);
			} catch (Exception e) {
			}
		}
		NumberFormat formatter = new DecimalFormat("#.##");
		String s = formatter.format(d);
		return s;
	}

	public Company readCompByUniqueID(String compId) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		Company comp = (Company) o.findCompanyByCompId(compId);
		if (comp != null) {
			ArrayList talks = (ArrayList) o.findTalkNotesByCompanyId(comp.uid);
			for (int i = 0; i < talks.size(); i++) {
				TalkNotes talk = (TalkNotes) talks.get(i);
				talk.setSeq(i + 1);
			}
			comp.setTalkNotes((talks));

			comp.recCount = o.findVisitCount(comp.uid);

			comp.setAwardRecs(o.findAwardsByCompId(comp.uid));
			comp.setGrantRecs(o.findGrantsByCompId(comp.uid));
			comp.setIpRecs(o.findIPsByCompId(comp.uid));

			// comp.setPaperFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_REVIEW));
			// comp.setInterviewFileInfo((ArrayList) o.findUploadedFiles(comp.uid, "面審"));
			// comp.setHandoverFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_OTHERFILES));

			loadReviewDocs(comp, o);

			// AM/PM 資料
			Staff am = o.findStaffByIdOK(comp.getAmId());
			
			// AM 姓名
			System.out.println("------>>>>>>>>>>>>=====" + comp.getAmId() + "," + comp.getAmName());
			
			
			if (am == null || am.getStatus().equals(am.STATUS_HALT)) {
				comp.setAmId("");
				comp.setAmName("無");
			} else {
				comp.setAmName(am.getName());
			}
			Staff pm = o.findStaffByIdOK(comp.getPmId());
			if (pm == null || pm.getStatus().equals(pm.STATUS_HALT)) {
				comp.setPmId("");
				comp.setPmName("無");
			} else {
				comp.setPmName(pm.getName());
			}
			// 培育間資料
			ArrayList rooms = (ArrayList) o.findRoomByCompId(compId);
			comp.setRoom(getRoomString(rooms));
			comp.setRoomArea(getRoomTotalArea(rooms));
		}
		o.closeSession();
		return comp;
	}

	public TreeMap readHistoryMonthlyReports(String compid, VOMonthlyReportCondition voMonthlyReportCondition)
			throws Exception {

		TreeMap mp = new TreeMap();

		ArrayList result = new ArrayList();
		try {

			connectDB();
			statement = conn.createStatement();

			String fmyr = voMonthlyReportCondition.fromYear;
			String fmmo = voMonthlyReportCondition.fromMonth;
			String toyr = voMonthlyReportCondition.toYear;
			String tomo = voMonthlyReportCondition.toMonth;
			DateUtil dateUtil = new DateUtil();
			ArrayList months = dateUtil.getMonths(fmyr, fmmo, toyr, tomo);

			int n = 1;
			for (int i = 0; i < months.size(); i++) {

				String yearmonth = (String) months.get(i);

				String sql = "select * from reportmonthly where 1=1";
				sql = sql + " AND compid = '" + compid + "' ";
				// if (!compListCondition.getCompStatus().trim().equals("NONE"))
				// {
				sql = sql + " AND yearMonth = '" + yearmonth + "' ";
				// }
				sql = sql + " order by yearMonth";

				System.out.println(sql);

				rs = statement.executeQuery(sql);

				MonthlyReport monthlyReportmp = null;
				while (rs.next()) {
					monthlyReportmp = fillMonthlyReport(rs);
				}

				if (monthlyReportmp != null) {
					monthlyReportmp.seq = "" + n;
					mp.put(yearmonth, monthlyReportmp);
					n++;
				} else {
					monthlyReportmp = new MonthlyReport();
					// monthlyReportmp.remark = "";
					mp.put(yearmonth, monthlyReportmp);
				}
			}

			return mp;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

	public TreeMap readHistoryMonthlyReports(String compid) throws Exception {
		TreeMap mp = new TreeMap();

		try {
			connectDB();
			statement = conn.createStatement();

			String sql = "select * from reportmonthly where 1=1";
			sql = sql + " AND compid = '" + compid + "' ";
			sql = sql + " order by yearMonth";

			System.out.println(sql);

			rs = statement.executeQuery(sql);

			// MonthlyReport monthlyReportmp = null;
			while (rs.next()) {
				MonthlyReport monthlyReportmp = fillMonthlyReport(rs);
				mp.put(monthlyReportmp.yearMonth, monthlyReportmp);
			}

			return mp;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

	public TreeMap readAggregateYearlyReports(VOMonthlyReportCondition voMonthlyReportCondition) throws Exception {
		TreeMap mp = new TreeMap();

		TreeMap aggregateMonthlyReports = readAggregateMonthlyReports(voMonthlyReportCondition);

		Iterator it = aggregateMonthlyReports.keySet().iterator();

		while (it.hasNext()) {
			String dts = (String) it.next();
			MonthlyReport monthlyReport = (MonthlyReport) aggregateMonthlyReports.get(dts);

			String[] x = dts.split("/");
			String yr = x[0];
			// String mo = x[1];

			MonthlyReport yReport = (MonthlyReport) mp.get(yr);
			if (yReport == null) {
				yReport = new MonthlyReport();
				yReport.revenue = monthlyReport.revenue;
				yReport.status = monthlyReport.status;
				mp.put(yr, yReport);
			} else {
				yReport.revenue = yReport.revenue + monthlyReport.revenue;
				yReport.status = yReport.status && monthlyReport.status;
			}

		}
		//
		return mp;
	}

	public TreeMap readAggregateQuarterlyReports(VOMonthlyReportCondition voMonthlyReportCondition) throws Exception {
		TreeMap mp = new TreeMap();

		TreeMap aggregateMonthlyReports = readAggregateMonthlyReports(voMonthlyReportCondition);

		Iterator it = aggregateMonthlyReports.keySet().iterator();

		while (it.hasNext()) {
			String dts = (String) it.next();
			MonthlyReport monthlyReport = (MonthlyReport) aggregateMonthlyReports.get(dts);

			String[] x = dts.split("/");
			String yr = x[0];
			String mo = x[1];

			int quarter = DateUtil.getQuarter(dts);

			String key = yr + "Q" + quarter;
			// System.out.println("Quarter for the date : " + dts + " is : " +
			// key + "--->" + monthlyReport.revenue);

			MonthlyReport qReport = (MonthlyReport) mp.get(key);
			if (qReport == null) {
				qReport = new MonthlyReport();
				qReport.revenue = monthlyReport.revenue;
				qReport.status = monthlyReport.status;
				mp.put(key, qReport);
			} else {
				qReport.revenue = qReport.revenue + monthlyReport.revenue;
				qReport.status = qReport.status && monthlyReport.status;
			}

		}
		//
		return mp;
	}

	public TreeMap readAggregateMonthlyReports(VOMonthlyReportCondition voMonthlyReportCondition) throws Exception {
		TreeMap mp = new TreeMap();

		// ArrayList result = new ArrayList();
		try {

			connectDB();
			statement = conn.createStatement();

			String fmyr = voMonthlyReportCondition.fromYear;
			String fmmo = voMonthlyReportCondition.fromMonth;
			String toyr = voMonthlyReportCondition.toYear;
			String tomo = voMonthlyReportCondition.toMonth;
			DateUtil dateUtil = new DateUtil();
			ArrayList months = dateUtil.getMonths(fmyr, fmmo, toyr, tomo);

			int n = 1;
			for (int i = 0; i < months.size(); i++) {

				String yearmonth = (String) months.get(i);

				String sql = "select * from confirmedreport where 1=1";
				sql = sql + " AND yearMonth = '" + yearmonth + "' ";
				sql = sql + " order by yearMonth";

				// System.out.println(sql);

				rs = statement.executeQuery(sql);

				MonthlyReport monthlyReportmp = new MonthlyReport();

				boolean f = false;

				while (rs.next()) {
					monthlyReportmp.revenue = monthlyReportmp.revenue + rs.getFloat("revenue");//

					monthlyReportmp.phd = monthlyReportmp.phd + rs.getInt("phd");//
					monthlyReportmp.master = monthlyReportmp.master + rs.getInt("master");//
					monthlyReportmp.proMajor = monthlyReportmp.proMajor + rs.getInt("proMajor");//
					monthlyReportmp.bachelor = monthlyReportmp.bachelor + rs.getInt("bachelor");//
					monthlyReportmp.totalEmployee = monthlyReportmp.totalEmployee + rs.getInt("totalEmployee");//

					monthlyReportmp.ip_invent = monthlyReportmp.ip_invent + rs.getInt("ip_invent");//
					monthlyReportmp.ip_newType = monthlyReportmp.ip_newType + rs.getInt("ip_newType");//
					monthlyReportmp.ip_look = monthlyReportmp.ip_look + rs.getInt("ip_look");//
					monthlyReportmp.icDrawing = monthlyReportmp.icDrawing + rs.getInt("icDrawing");//
					monthlyReportmp.softwareProd = monthlyReportmp.softwareProd + rs.getInt("softwareProd");//
					monthlyReportmp.softwareBook = monthlyReportmp.softwareBook + rs.getInt("softwareBook");//
					f = true;
				}

				if (f) {
					monthlyReportmp.seq = "" + n;
					monthlyReportmp.status = true;
					mp.put(yearmonth, monthlyReportmp);
					n++;
				} else {
					monthlyReportmp = new MonthlyReport();

					monthlyReportmp.status = false;
					mp.put(yearmonth, monthlyReportmp);
				}
			}

			// ---------------------------------------------------------------------------------------
			CalculateTotal.getTotal(mp);

			return mp;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

	public TreeMap readAggregateYearlyReports(VOYearlyReportCondition voYearlyReportCondition) throws Exception {
		TreeMap mp = new TreeMap();
		try {

			String fmyr = voYearlyReportCondition.fromYear;
			String toyr = voYearlyReportCondition.toYear;

			int fromY = Integer.parseInt(fmyr);
			int toY = Integer.parseInt(toyr);

			for (int y = fromY; y <= toY; y++) {

				System.out.println(fromY + "---->" + toY + "~~~~~y=" + y);

				String sql = "SELECT" + //
						" compName," + //
						" SUM(revenue) ," + //
						" sum(ip_invent), " + //
						" sum(ip_newType), " + //
						" sum(ip_look), " + //
						" sum(icDrawing), " + //
						" sum(softwareProd), " + //
						" sum(softwareBook), " + //
						" sum(phd), " + //
						" sum(master), " + //
						" sum(proMajor), " + //
						" sum(bachelor), " + //
						" sum(totalEmployee), " + //
						" MAX(phd), " + //
						" avg(phd)," + //
						" phd" + //
						"  FROM confirmedreport";
				sql = sql + " where year= '" + y + "'";

				// sql = sql + " GROUP BY compName DESC order by compName";

				try {
					connectDB();
					statement = conn.createStatement();
					rs = statement.executeQuery(sql);
					int n = 1;
					while (rs.next()) {
						MonthlyReport monthlyReport = new MonthlyReport();
						monthlyReport.seq = "" + (n++);
						// monthlyReport.uid = rs.getString("uid");// 唯一代碼
						// monthlyReport.compId = rs.getString("compId");//
						monthlyReport.compName = rs.getString("compName");//
						// monthlyReport.year = rs.getString("year");//
						// monthlyReport.month = rs.getString("month");//
						// monthlyReport.yearMonth =
						// rs.getString("yearMonth");//
						monthlyReport.revenue = rs.getFloat("sum(revenue)");//

						monthlyReport.phd = (int) Math.ceil(rs.getInt("sum(phd)") / 12);//
						monthlyReport.master = (int) Math.ceil(rs.getInt("sum(master)") / 12);//
						monthlyReport.proMajor = (int) Math.ceil(rs.getInt("sum(proMajor)") / 12);//
						monthlyReport.bachelor = (int) Math.ceil(rs.getInt("sum(bachelor)") / 12);//
						monthlyReport.totalEmployee = (int) Math.ceil(rs.getInt("sum(totalEmployee)") / 12);//

						monthlyReport.ip_invent = rs.getInt("sum(ip_invent)");//
						monthlyReport.ip_newType = rs.getInt("sum(ip_newType)");//
						monthlyReport.ip_look = rs.getInt("sum(ip_look)");//
						monthlyReport.icDrawing = rs.getInt("sum(icDrawing)");//
						monthlyReport.softwareProd = rs.getInt("sum(softwareProd)");//
						monthlyReport.softwareBook = rs.getInt("sum(softwareBook)");//
						// monthlyReport.remark = rs.getString("remark");//
						monthlyReport.status = true;//

						mp.put("" + y, monthlyReport);
					}

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				CalculateTotal.getTotal(mp);
			}

			return mp;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

	public TreeMap readAggregateQuarterlyReports(VOQuarterlyReportCondition voQuarterlyReportCondition)
			throws Exception {
		TreeMap mp = new TreeMap();

		try {

			String fmyr = voQuarterlyReportCondition.fromYear;
			String fmQ = voQuarterlyReportCondition.fromQuarter;
			String toyr = voQuarterlyReportCondition.toYear;
			String toQ = voQuarterlyReportCondition.toQuarter;

			int fromY = Integer.parseInt(fmyr);
			int toY = Integer.parseInt(toyr);
			boolean f = false;
			for (int y = fromY; y <= toY; y++) {
				for (int q = 1; q <= 4; q++) {

					if (y == fromY && q == Integer.parseInt(fmQ)) {
						f = true;
					}

					if (y == toY && q == Integer.parseInt(toQ) + 1) {
						f = false;
					}

					if (!f)
						continue;

					System.out.println(y + "Q" + q);
					// -------------------------------------------
					String[] m = DateUtil.getMonthsInQuarter("" + q);
					String s = "(";
					for (int i = 0; i < m.length; i++) {
						s = s + "'" + y + "/" + m[i] + "'";
						if (i != m.length - 1)
							s = s + ",";
					}
					s = s + ")";
					// -------------------------------------------

					String sql = "SELECT" + //
							" compName," + //
							" SUM(revenue) ," + //
							" sum(ip_invent), " + //
							" sum(ip_newType), " + //
							" sum(ip_look), " + //
							" sum(icDrawing), " + //
							" sum(softwareProd), " + //
							" sum(softwareBook), " + //
							" sum(phd), " + //
							" sum(master), " + //
							" sum(proMajor), " + //
							" sum(bachelor), " + //
							" sum(totalEmployee), " + //
							" MAX(phd), " + //
							" avg(phd)," + //
							" phd" + //
							"  FROM confirmedreport";
					sql = sql + " where yearmonth in " + s;
					// sql = sql + " GROUP BY compName DESC order by compName";

					try {
						connectDB();
						statement = conn.createStatement();
						rs = statement.executeQuery(sql);
						int n = 1;
						while (rs.next()) {
							MonthlyReport monthlyReport = new MonthlyReport();
							monthlyReport.seq = "" + (n++);
							// monthlyReport.uid = rs.getString("uid");// 唯一代碼
							// monthlyReport.compId = rs.getString("compId");//
							monthlyReport.compName = rs.getString("compName");//
							// monthlyReport.year = rs.getString("year");//
							// monthlyReport.month = rs.getString("month");//
							// monthlyReport.yearMonth =
							// rs.getString("yearMonth");//
							monthlyReport.revenue = rs.getFloat("sum(revenue)");//

							monthlyReport.phd = (int) Math.ceil(rs.getInt("sum(phd)") / 3);//
							monthlyReport.master = (int) Math.ceil(rs.getInt("sum(master)") / 3);//
							monthlyReport.proMajor = (int) Math.ceil(rs.getInt("sum(proMajor)") / 3);//
							monthlyReport.bachelor = (int) Math.ceil(rs.getInt("sum(bachelor)") / 3);//
							monthlyReport.totalEmployee = (int) Math.ceil(rs.getInt("sum(totalEmployee)") / 3);//

							monthlyReport.ip_invent = rs.getInt("sum(ip_invent)");//
							monthlyReport.ip_newType = rs.getInt("sum(ip_newType)");//
							monthlyReport.ip_look = rs.getInt("sum(ip_look)");//
							monthlyReport.icDrawing = rs.getInt("sum(icDrawing)");//
							monthlyReport.softwareProd = rs.getInt("sum(softwareProd)");//
							monthlyReport.softwareBook = rs.getInt("sum(softwareBook)");//
							// monthlyReport.remark = rs.getString("remark");//
							monthlyReport.status = true;//

							mp.put(y + "Q" + q, monthlyReport);
						}

					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}

				}
			}

			CalculateTotal.getTotal(mp);

			return mp;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

	public ArrayList findFeesByYearMonth(VOYearMonthCondition voYearMonthCondition) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList recs = (ArrayList) o.findFeesByYearMonth(voYearMonthCondition.getYearMonth());
		o.closeSession();
		return recs;
	}

	public ArrayList updateArrayListAnnouncement(ArrayList al, String aid) {
		for (int i = 0; i < al.size(); i++) {
			Announcement obj = (Announcement) al.get(i);
			if (obj.aid.equals(aid)) {
				obj.announcement_read_id = "";
				al.set(i, obj);
			}
		}
		return al;
	}

	public ArrayList readAnnouncementList(User user) throws Exception {
		ArrayList returnList = new ArrayList();
		// try {
		//
		// connectDB();
		// statement = conn.createStatement();
		//
		// // String sql =
		// // "select a.*,b.ID'b_ID',c.ID'c_ID' FROM announcement a " + //
		// // " LEFT JOIN announcement_read b ON a.ID = b.AnnouncementID " + //
		// // " left Join isi_company c ON c.ID = b.CompanyID where 1=1";
		//
		// String sql = "select a.*,b.ID'b_ID',c.ID'c_ID' FROM announcement a "
		// + //
		// " LEFT JOIN announcement_read b ON a.ID = b.AnnouncementID "
		// + //
		// " left Join isi_company c ON c.ID = b.CompanyID where 1=1";
		//
		// if (user.userAuth.businessMenu) {// 企業
		// sql = sql + " and a.Status=1 ";// "已顯示"者
		// } else if (user.userAuth.managerMenu) {// 管理者
		// sql = sql + " and a.Status!=2 ";// 非"已刪除"者
		// }
		//
		// sql = sql + " order by a.CreateDate desc";
		//
		// System.out.println(sql);
		//
		// rs = statement.executeQuery(sql);
		//
		// String strTempList = "";
		//
		// int n = 1;
		// while (rs.next()) {
		// Announcement obj = fillAnnouncement(rs, user);
		//
		// obj.status = obj.status.replace("0", "已隱藏");
		// obj.status = obj.status.replace("1", "已顯示");
		// obj.status = obj.status.replace("2", "已刪除");
		// // obj.type = obj.type.replace("0", "文章");
		// // obj.type = obj.type.replace("1", "連結");
		//
		// String strTemp = "[" + obj.aid + "]";
		//
		// if (strTempList.indexOf(strTemp) >= 0) {
		// if (obj.announcement_read_id.length() <= 0) {
		// returnList = updateArrayListAnnouncement(returnList,
		// obj.aid);
		// continue;
		// }
		// } else {
		// obj.setSeq(n + "");
		// strTempList += strTemp;
		// returnList.add(obj);
		// n++;
		// }
		// }
		//
		// return returnList;
		// } catch (Exception e) {
		// throw e;
		// } finally {
		// closeDB();
		// }

		return returnList;
	}

	public SharedThing readSharedThingByID(String topicId, String table) {
		SharedThing obj = new SharedThing();

		String sql = "select * FROM " + table + //
				" where ID='" + topicId + "'";

		try {
			connectDB();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				obj.aid = rs.getString("ID");
				obj.title = rs.getString("Title");
				obj.message = rs.getString("Message");
				obj.createName = rs.getString("CreateName");
				// --------------------------------------------------------------
				Date d = rs.getDate("CreateDate");
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String dddd = dateFormat.format(d);
				// System.out.println("XXXX yyyuuu  mmm  dddd=" + dddd);

				Date t = rs.getTime("CreateDate");
				DateFormat dateFormat2 = new SimpleDateFormat("HH:mm");
				String tttt = dateFormat2.format(t);
				// System.out.println("XXXX yyyuuu  mmm  tttt=" + tttt);

				obj.createDate = dddd + " " + tttt;
				// --------------------------------------------------------------

				obj.status = rs.getString("Status");

			}

			// ---------------------------------------------------------------------------
			sql = "select * from uploadedfiles where recordID='" + topicId + "'";

			// FileUtils.writeStringToFile(new File("c:/xxx.txt"), sql);

			rs = statement.executeQuery(sql);
			ArrayList fileInfo = new ArrayList();
			while (rs.next()) {
				VOFile voFile = new VOFile();
				voFile.setModifiedFileName(rs.getString("modifiedFileName"));
				voFile.setOriginalFileName(rs.getString("originalFileName"));
				fileInfo.add(voFile);
			}
			obj.setFileInfo(fileInfo);
			// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			return new SharedThing();
		} finally {
			closeDB();
		}
	}

	public ArrayList readSharedThingList(String table) throws Exception {
		ArrayList returnList = new ArrayList();
		try {
			connectDB();
			statement = conn.createStatement();

			String sql = "select * FROM " + table;

			// if (user.userAuth.businessMenu) {// 企業
			// sql = sql + " and a.Status=1 ";// "已顯示"者
			// } else if (user.userAuth.managerMenu) {// 管理者
			// sql = sql + " and a.Status!=2 ";// 非"已刪除"者
			// }

			sql = sql + " order by CreateDate desc";

			System.out.println(sql);

			rs = statement.executeQuery(sql);

			int n = 1;
			while (rs.next()) {
				SharedThing obj = new SharedThing();

				obj.aid = rs.getString("ID");
				obj.title = rs.getString("Title");
				obj.message = rs.getString("Message");
				obj.createName = rs.getString("CreateName");
				// --------------------------------------------------------------
				Date d = rs.getDate("CreateDate");
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String dddd = dateFormat.format(d);
				// System.out.println("XXXX yyyuuu  mmm  dddd=" + dddd);

				Date t = rs.getTime("CreateDate");
				DateFormat dateFormat2 = new SimpleDateFormat("HH:mm");
				String tttt = dateFormat2.format(t);
				// System.out.println("XXXX yyyuuu  mmm  tttt=" + tttt);

				obj.createDate = dddd + " " + tttt;
				// --------------------------------------------------------------
				obj.status = rs.getString("Status");
				obj.status = obj.status.replace("0", "已隱藏");
				obj.status = obj.status.replace("1", "已顯示");
				obj.status = obj.status.replace("2", "已刪除");

				obj.setSeq(n + "");

				returnList.add(obj);
				n++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
			return returnList;
		}

	}

	public ArrayList readServiceResourceDataList(String categorize) throws Exception {
		ArrayList returnList = new ArrayList();
		try {

			connectDB();
			statement = conn.createStatement();

			String sql = "select * FROM service_resource_data where 1=1 and Categorize=" + categorize + " ";

			sql = sql + " order by ID desc";

			System.out.println(sql);

			rs = statement.executeQuery(sql);

			String strTempList = "";

			int n = 1;
			while (rs.next()) {
				ServiceResourceData obj = fillServiceResourceData(rs);

				obj.status = obj.status.replace("0", "暫停");
				obj.status = obj.status.replace("1", "使用");

				obj.setSeq(n + "");
				returnList.add(obj);
				n++;
			}

			return returnList;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

	public ArrayList readServiceResourceAcceptList(String categorize, String company_id) throws Exception {
		ArrayList returnList = new ArrayList();
		try {

			connectDB();
			statement = conn.createStatement();

			String str_where_company_id = " a.CompanyID='" + company_id + "' and ";

			if (company_id == null)
				str_where_company_id = "";

			String sql = "";
			sql += " select a.*,b.Name'srdName',b.Categorize'srdCategorize',c.CompanyName'c_CompanyName' ";
			sql += " FROM service_resource_accept a LEFT JOIN service_resource_data b ON a.SRDID = b.ID LEFT JOIN isi_company c ON a.CompanyID = c.ID ";
			sql += " where " + str_where_company_id + " b.Categorize='" + categorize + "' ";
			sql += " order by a.ID desc ";

			// System.out.println(sql);

			// FileUtils.writeStringToFile(new File("c:/xxx.txt"), sql);

			rs = statement.executeQuery(sql);

			String strTempList = "";

			int n = 1;
			while (rs.next()) {
				ServiceResourceAccept obj = fillServiceResourceAccept(rs);

				obj.accept_status = obj.accept_status.replace("0", "等待審核");
				obj.accept_status = obj.accept_status.replace("1", "<font color=green>申請通過</font>");
				obj.accept_status = obj.accept_status.replace("2", "<font color=red>申請失敗</font>");
				obj.accept_status = obj.accept_status.replace("3", "<font color=red>已刪除</font>");

				obj.setSeq(n + "");
				returnList.add(obj);
				n++;
			}

			return returnList;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

	public void insertMonthlyReport(MonthlyReport monthlyReport) throws SQLException {
		// PreparedStatements can use variables and are more efficient
		String sql = "insert into  reportmonthly(" + //
				"UID" + // 0
				"," + //
				"compId" + // 1
				"," + //
				"compName" + // 2
				"," + //
				"year" + // 3
				"," + //
				"month" + // 4
				"," + //
				"yearMonth" + // 5
				"," + //
				"revenue" + // 6
				"," + //
				"phd" + // 7
				"," + //
				"master" + // 8
				"," + //
				"proMajor" + // 9
				"," + //
				"bachelor" + // 10
				"," + //
				"totalEmployee" + // 10-1
				"," + //
				"ip_invent" + // 11
				"," + //
				"ip_newType" + // 12
				"," + //
				"ip_look" + // 13
				"," + //
				"icDrawing" + // 14
				"," + //
				"softwareProd" + // 15
				"," + //
				"softwareBook" + // 16
				"," + //
				"Remark" + // 17
				"," + //
				"status" + // 18
				") values (" + //
				monthlyReport.uid + // 0
				"," + //
				"'" + monthlyReport.compId + "'" + // 1
				"," + //
				"'" + monthlyReport.compName + "'" + // 2
				"," + //
				"'" + monthlyReport.year + "'" + // 3
				"," + //
				"'" + monthlyReport.month + "'" + // 4
				"," + //
				"'" + monthlyReport.yearMonth + "'" + // 5
				"," + //
				monthlyReport.revenue + // 6
				"," + //
				monthlyReport.phd + // 7
				"," + //
				monthlyReport.master + // 8
				"," + //
				monthlyReport.proMajor + // 9
				"," + //
				monthlyReport.bachelor + // 10
				"," + //
				monthlyReport.totalEmployee + // 10-1

				"," + //
				monthlyReport.ip_invent + // 11
				"," + //
				monthlyReport.ip_newType + // 12
				"," + //
				monthlyReport.ip_look + // 13
				"," + //
				monthlyReport.icDrawing + // 14
				"," + //
				monthlyReport.softwareProd + // 15
				"," + //
				monthlyReport.softwareBook + // 16
				"," + //
				"'" + monthlyReport.remark + "'" + // 17
				"," + //
				monthlyReport.status + // 18
				")";

		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	public void insertConfirmedMonthlyReport(MonthlyReport monthlyReport) throws SQLException {
		// PreparedStatements can use variables and are more efficient
		String sql = "insert into  confirmedreport(" + //
				"UID" + // 0
				"," + //
				"compId" + // 1
				"," + //
				"compName" + // 2
				"," + //
				"year" + // 3
				"," + //
				"month" + // 4
				"," + //
				"yearMonth" + // 5
				"," + //
				"revenue" + // 6
				"," + //
				"phd" + // 7
				"," + //
				"master" + // 8
				"," + //
				"proMajor" + // 9
				"," + //
				"bachelor" + // 10
				"," + //
				"totalEmployee" + // 10-1
				"," + //
				"ip_invent" + // 11
				"," + //
				"ip_newType" + // 12
				"," + //
				"ip_look" + // 13
				"," + //
				"icDrawing" + // 14
				"," + //
				"softwareProd" + // 15
				"," + //
				"softwareBook" + // 16
				"," + //
				"Remark" + // 17
				"," + //
				"status" + // 18
				") values (" + //
				monthlyReport.uid + // 0
				"," + //
				"'" + monthlyReport.compId + "'" + // 1
				"," + //
				"'" + monthlyReport.compName + "'" + // 2
				"," + //
				"'" + monthlyReport.year + "'" + // 3
				"," + //
				"'" + monthlyReport.month + "'" + // 4
				"," + //
				"'" + monthlyReport.yearMonth + "'" + // 5
				"," + //
				monthlyReport.revenue + // 6
				"," + //
				monthlyReport.phd + // 7
				"," + //
				monthlyReport.master + // 8
				"," + //
				monthlyReport.proMajor + // 9
				"," + //
				monthlyReport.bachelor + // 10
				"," + //
				monthlyReport.totalEmployee + // 10-1

				"," + //
				monthlyReport.ip_invent + // 11
				"," + //
				monthlyReport.ip_newType + // 12
				"," + //
				monthlyReport.ip_look + // 13
				"," + //
				monthlyReport.icDrawing + // 14
				"," + //
				monthlyReport.softwareProd + // 15
				"," + //
				monthlyReport.softwareBook + // 16
				"," + //
				"'" + monthlyReport.remark + "'" + // 17
				"," + //
				monthlyReport.status + // 18
				")";

		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	// public UserAuth readUserAuthByID(String roleid) {
	// UserAuth userAuth = new UserAuth();
	// String sql = "select * from USERAUTH where ROLEID='" + roleid + "'";
	// try {
	// connectDB();
	// statement = conn.createStatement();
	// rs = statement.executeQuery(sql);
	// while (rs.next()) {
	// userAuth = fillUserAuth(rs);
	// }
	// return userAuth;
	// } catch (Exception e) {
	// e.printStackTrace();
	// return new UserAuth();
	// } finally {
	// closeDB();
	// }
	// }

	// public ArrayList readUserAuths() {
	// ArrayList ar = new ArrayList();
	// String sql = "select * from USERAUTH";
	// try {
	// connectDB();
	// statement = conn.createStatement();
	// rs = statement.executeQuery(sql);
	//
	// int n = 1;
	// while (rs.next()) {
	// UserAuth userAuth = fillUserAuth(rs);
	// userAuth.seq = "" + n;
	// ar.add(userAuth);
	// n++;
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// } finally {
	// closeDB();
	// }
	// return ar;
	// }

	public ArrayList readMonthlyReportsByYearQuarter(String yearQuarter) {
		ArrayList ar = new ArrayList();

		String[] x = yearQuarter.split("Q");
		String year = x[0];
		String quarter = x[1];

		String[] m = DateUtil.getMonthsInQuarter(quarter);
		String s = "(";
		for (int i = 0; i < m.length; i++) {
			s = s + "'" + year + "/" + m[i] + "'";
			if (i != m.length - 1)
				s = s + ",";
		}
		s = s + ")";

		String sql = "SELECT" + //
				" compId," + //
				" compName," + //
				" SUM(revenue) ," + //
				" sum(ip_invent), " + //
				" sum(ip_newType), " + //
				" sum(ip_look), " + //
				" sum(icDrawing), " + //
				" sum(softwareProd), " + //
				" sum(softwareBook), " + //
				" sum(phd), " + //
				" sum(master), " + //
				" sum(proMajor), " + //
				" sum(bachelor), " + //
				" sum(totalEmployee), " + //
				" MAX(phd), " + //
				" avg(phd)," + //
				" phd" + //
				"  FROM confirmedreport";
		sql = sql + " where yearmonth in " + s;
		sql = sql + " GROUP BY compId DESC order by compId";

		try {
			connectDB();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			int n = 1;
			while (rs.next()) {
				MonthlyReport monthlyReport = new MonthlyReport();
				monthlyReport.seq = "" + (n++);
				// monthlyReport.uid = rs.getString("uid");// 唯一代碼
				monthlyReport.compId = rs.getString("compId");//
				monthlyReport.compName = rs.getString("compName");//
				// monthlyReport.year = rs.getString("year");//
				// monthlyReport.month = rs.getString("month");//
				// monthlyReport.yearMonth = rs.getString("yearMonth");//
				monthlyReport.revenue = rs.getFloat("sum(revenue)");//

				monthlyReport.phd = (int) Math.ceil(rs.getInt("sum(phd)") / 3);//
				monthlyReport.master = (int) Math.ceil(rs.getInt("sum(master)") / 3);//
				monthlyReport.proMajor = (int) Math.ceil(rs.getInt("sum(proMajor)") / 3);//
				monthlyReport.bachelor = (int) Math.ceil(rs.getInt("sum(bachelor)") / 3);//
				monthlyReport.totalEmployee = (int) Math.ceil(rs.getInt("sum(totalEmployee)") / 3);//

				monthlyReport.ip_invent = rs.getInt("sum(ip_invent)");//
				monthlyReport.ip_newType = rs.getInt("sum(ip_newType)");//
				monthlyReport.ip_look = rs.getInt("sum(ip_look)");//
				monthlyReport.icDrawing = rs.getInt("sum(icDrawing)");//
				monthlyReport.softwareProd = rs.getInt("sum(softwareProd)");//
				monthlyReport.softwareBook = rs.getInt("sum(softwareBook)");//
				// monthlyReport.remark = rs.getString("remark");//
				monthlyReport.status = true;//
				ar.add(monthlyReport);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return ar;

	}

	public ArrayList readMonthlyReportsByYear(String year) {
		ArrayList ar = new ArrayList();

		String sql = "SELECT" + //
				" compId," + //
				" compName," + //
				" SUM(revenue) ," + //
				" sum(ip_invent), " + //
				" sum(ip_newType), " + //
				" sum(ip_look), " + //
				" sum(icDrawing), " + //
				" sum(softwareProd), " + //
				" sum(softwareBook), " + //
				" sum(phd), " + //
				" sum(master), " + //
				" sum(proMajor), " + //
				" sum(bachelor), " + //
				" sum(totalEmployee), " + //
				" MAX(phd), " + //
				" avg(phd)," + //
				" phd" + //
				"  FROM confirmedreport";
		sql = sql + " where year = '" + year + "'";
		sql = sql + " GROUP BY compId DESC order by compId";

		try {
			connectDB();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			int n = 1;
			while (rs.next()) {
				MonthlyReport monthlyReport = new MonthlyReport();
				monthlyReport.seq = "" + (n++);
				// monthlyReport.uid = rs.getString("uid");// 唯一代碼
				monthlyReport.compId = rs.getString("compId");//
				monthlyReport.compName = rs.getString("compName");//
				// monthlyReport.year = rs.getString("year");//
				// monthlyReport.month = rs.getString("month");//
				// monthlyReport.yearMonth = rs.getString("yearMonth");//
				monthlyReport.revenue = rs.getFloat("sum(revenue)");//

				monthlyReport.phd = (int) Math.ceil(rs.getInt("sum(phd)") / 12);//
				monthlyReport.master = (int) Math.ceil(rs.getInt("sum(master)") / 12);//
				monthlyReport.proMajor = (int) Math.ceil(rs.getInt("sum(proMajor)") / 12);//
				monthlyReport.bachelor = (int) Math.ceil(rs.getInt("sum(bachelor)") / 12);//
				monthlyReport.totalEmployee = (int) Math.ceil(rs.getInt("sum(totalEmployee)") / 12);//

				monthlyReport.ip_invent = rs.getInt("sum(ip_invent)");//
				monthlyReport.ip_newType = rs.getInt("sum(ip_newType)");//
				monthlyReport.ip_look = rs.getInt("sum(ip_look)");//
				monthlyReport.icDrawing = rs.getInt("sum(icDrawing)");//
				monthlyReport.softwareProd = rs.getInt("sum(softwareProd)");//
				monthlyReport.softwareBook = rs.getInt("sum(softwareBook)");//
				// monthlyReport.remark = rs.getString("remark");//
				monthlyReport.status = true;//
				ar.add(monthlyReport);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return ar;

	}

	class XX {
		String companyId = "";
		String companyName = "";
	}

	public ArrayList readMonthlyReportsByYearMonth(String yearMonth) {
		ArrayList ar = new ArrayList();
		String sql_1 = "select * from isi_company  where CompanyStatus='入駐' order by ID";

		// int i=0;
		try {
			connectDB();
			statement = conn.createStatement();

			// ---------------------------------------------
			rs = statement.executeQuery(sql_1);
			ArrayList complist = new ArrayList();
			while (rs.next()) {
				XX xx = new XX();
				xx.companyId = rs.getString("ID");
				xx.companyName = rs.getString("companyName");
				complist.add(xx);
			}
			// ---------------------------------------------

			for (int i = 0; i < complist.size(); i++) {
				XX xx = (XX) complist.get(i);
				String compId = xx.companyId;
				String sql = "select * from reportmonthly   where ";
				sql = sql + " yearmonth = " + "'" + yearMonth + "'";
				sql = sql + " AND compId = " + "'" + compId + "'";

				rs = statement.executeQuery(sql);

				MonthlyReport monthlyReport = null;

				while (rs.next()) {
					monthlyReport = fillMonthlyReport(rs);
					monthlyReport.seq = "" + (1 + i);
					monthlyReport.compId = xx.companyId;
					monthlyReport.compName = xx.companyName;
					monthlyReport.status = true;
				}

				if (monthlyReport == null) {
					monthlyReport = new MonthlyReport();
					monthlyReport.seq = "" + (1 + i);
					monthlyReport.yearMonth = yearMonth;

					String[] xxxxx = yearMonth.split("/");
					monthlyReport.year = xxxxx[0];
					monthlyReport.month = xxxxx[1];

					monthlyReport.compId = xx.companyId;
					monthlyReport.compName = xx.companyName;
					monthlyReport.status = false;
				}

				// System.out.println("kkkkkkkkkkkkooooooooooooooooo====>"+yearMonth+"-----"+monthlyReport.yearMonth);

				ar.add(monthlyReport);

				// i++;
			}

			CalculateTotal.getTotal(ar);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return ar;
	}

	public ArrayList readMonthlyReportsConfirmedByYearMonth(String yearMonth) {
		ArrayList ar = new ArrayList();
		String sql = "select * from confirmedreport   where ";
		sql = sql + " yearmonth = " + "'" + yearMonth + "'";
		sql = sql + " order by compId ";

		try {
			connectDB();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			ArrayList complist = new ArrayList();

			int n = 1;
			while (rs.next()) {
				MonthlyReport monthlyReport = fillMonthlyReport(rs);
				monthlyReport.seq = "" + n;
				monthlyReport.status = true;
				ar.add(monthlyReport);
				n++;
			}

			CalculateTotal.getTotal(ar);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return ar;
	}

	public MonthlyReport readMonthlyReportsByYearMonthAndComp(String yearMonth, String compId) {
		MonthlyReport monthlyReport = null;

		String sql = "select * from reportmonthly   where ";
		sql = sql + " yearmonth = " + "'" + yearMonth + "'";
		sql = sql + " AND compId = " + "'" + compId + "'";

		try {
			connectDB();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);

			while (rs.next()) {
				monthlyReport = fillMonthlyReport(rs);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return monthlyReport;
	}

	// public void updateUserAuth(UserAuth userAuth) throws Exception {
	// String sql = "update UserAuth set" + //
	// // " roleid=" + "'" + userAuth.roleName + "'" //
	// // + "," + //
	// " roleName=" + "'"
	// + userAuth.roleChineseName
	// + "'" //
	// + ","
	// + //
	// " CompList="
	// + "'"
	// + (userAuth.compList ? "YES" : "NO")
	// + "'" //
	// + ","
	// + //
	// " statistics="
	// + "'"
	// + (userAuth.statistics ? "YES" : "NO")
	// + "'" //
	// + ","
	// + //
	// " businessMenu=" + "'"
	// + (userAuth.businessMenu ? "YES" : "NO")
	// + "'" //
	// + ","
	// + //
	// " managerMenu=" + "'" + (userAuth.managerMenu ? "YES" : "NO")
	// + "'" //
	// + "," + //
	// " adminMenu=" + "'" + (userAuth.adminMenu ? "YES" : "NO") + "'" //
	// + "," + //
	// " guestMenu=" + "'" + (userAuth.guestMenu ? "YES" : "NO") + "'" //
	//
	// + " WHERE roleid='" + userAuth.roleName + "'";
	//
	// connectDB();
	// System.out.println(sql);
	// Statement statement = conn.createStatement();
	// statement.executeUpdate(sql);
	// closeDB();
	// }

	// public void insertUserAuth(UserAuth userAuth) throws SQLException {
	// // PreparedStatements can use variables and are more efficient
	// String sql = "insert into  USERAUTH(" + //
	// "roleID" + // 1
	// "," + //
	// "roleName" + // 2
	// "," + //
	// "compList" + // 3
	// "," + //
	// "statistics" + // 4
	// "," + //
	// "businessMenu" + // 5
	// "," + //
	// "managerMenu" + // 6
	// "," + //
	// "adminMenu" + // 7
	// "," + //
	// "guestMenu" + // 8
	//
	// ") values (" + //
	// "'" + userAuth.roleName + "'" + // 1
	// "," + //
	// "'" + userAuth.roleChineseName + "'" + // 2
	// "," + //
	// "'" + (userAuth.compList ? "YES" : "NO") + "'" + // 3
	// "," + //
	// "'" + (userAuth.statistics ? "YES" : "NO") + "'" + // 4
	// "," + //
	// "'" + (userAuth.businessMenu ? "YES" : "NO") + "'" + // 5
	// "," + //
	// "'" + (userAuth.managerMenu ? "YES" : "NO") + "'" + // 6
	// "," + //
	// "'" + (userAuth.adminMenu ? "YES" : "NO") + "'" + // 7
	// "," + //
	// "'" + (userAuth.guestMenu ? "YES" : "NO") + "'" + // 8
	// ")";
	//
	// connectDB();
	// System.out.println(sql);
	// Statement statement = conn.createStatement();
	// statement.executeUpdate(sql);
	// closeDB();
	// }

	// public void insertYearMonthNote(String ym, boolean b) throws SQLException
	// {
	// // PreparedStatements can use variables and are more efficient
	// String sql = "insert into  YEARMONTHNOTE(" + // yearmonthmote
	// "yearmonth" + // 1
	// "," + //
	// "status" + // 2
	//
	// ") values (" + //
	// "'" + ym + "'" + // 1
	// "," + //
	// "" + b + "" + // 2
	//
	// ")";
	//
	// connectDB();
	// System.out.println(sql);
	// Statement statement = conn.createStatement();
	// statement.executeUpdate(sql);
	// closeDB();
	// }

	// private UserAccount fillUserAccount(ResultSet rs) {
	// UserAccount userAccount = new UserAccount();
	// try {
	// userAccount.uid = rs.getString("userID");// 唯一代碼
	// userAccount.userName = rs.getString("userName");//
	// userAccount.userCompName = rs.getString("CompanyName");//
	// userAccount.userCompId = rs.getString("compid");// //zy_company_id
	// // System.out.println("login rs.getString(\"zy_company_id\")="
	// // + rs.getString("zy_company_id"));
	// userAccount.userPhone = rs.getString("userphone");//
	// userAccount.userEmail = rs.getString("useremail");//
	// userAccount.userLoginId = rs.getString("userLoginId");//
	// userAccount.userLoginPwd = rs.getString("userLoginPwd");//
	// userAccount.userRole = rs.getString("userRole");//
	// userAccount.userRoleName = rs.getString("RoleName");//
	// userAccount.userStatus = rs.getString("userStatus");//
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	//
	// return userAccount;
	// }

	// private UserAccount fillUserAccount2(ResultSet rs) {
	// UserAccount userAccount = new UserAccount();
	// try {
	// userAccount.uid = rs.getString("userID");// 唯一代碼
	// userAccount.userName = rs.getString("userName");//
	// // userAccount.userCompName=rs.getString("CompanyName");//
	// userAccount.userCompId = rs.getString("compid");// //zy_company_id
	// // System.out.println("login rs.getString(\"zy_company_id\")="
	// // + rs.getString("zy_company_id"));
	// userAccount.userPhone = rs.getString("userphone");//
	// userAccount.userEmail = rs.getString("useremail");//
	// userAccount.userLoginId = rs.getString("userLoginId");//
	// userAccount.userLoginPwd = rs.getString("userLoginPwd");//
	// userAccount.userRole = rs.getString("userRole");//
	// userAccount.userRoleName = rs.getString("RoleName");//
	// userAccount.userStatus = rs.getString("userStatus");//
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	//
	// return userAccount;
	// }

	private MonthlyReport fillMonthlyReport(ResultSet rs) throws SQLException {
		MonthlyReport monthlyReport = new MonthlyReport();

		try {
			monthlyReport.uid = rs.getString("uid");// 唯一代碼
			monthlyReport.compId = rs.getString("compId");//
			monthlyReport.compName = rs.getString("compName");//
			monthlyReport.year = rs.getString("year");//
			monthlyReport.month = rs.getString("month");//
			monthlyReport.yearMonth = rs.getString("yearMonth");//
			monthlyReport.revenue = rs.getFloat("revenue");//
			monthlyReport.phd = rs.getInt("phd");//
			monthlyReport.master = rs.getInt("master");//
			monthlyReport.proMajor = rs.getInt("proMajor");//
			monthlyReport.bachelor = rs.getInt("bachelor");//
			monthlyReport.totalEmployee = rs.getInt("totalEmployee");//
			monthlyReport.ip_invent = rs.getInt("ip_invent");//
			monthlyReport.ip_newType = rs.getInt("ip_newType");//
			monthlyReport.ip_look = rs.getInt("ip_look");//
			monthlyReport.icDrawing = rs.getInt("icDrawing");//
			monthlyReport.softwareProd = rs.getInt("softwareProd");//
			monthlyReport.softwareBook = rs.getInt("softwareBook");//
			monthlyReport.remark = rs.getString("remark");//
			monthlyReport.status = rs.getBoolean("status");//
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return monthlyReport;
	}

	public ArrayList readUserAccounts(VOUserAccountListCondition userAccountListCondition) {
		VOUserAccountListCondition c = new VOUserAccountListCondition();
		c.setUserName(userAccountListCondition.getUserName());
		if (!c.getUserName().trim().equals("")) {
			String s = "%" + c.getUserName() + "%";
			c.setUserName(s);
		}

		c.setUserRole(userAccountListCondition.getUserRole());
		c.setUserStatus(userAccountListCondition.getUserStatus());

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList ar = (ArrayList) o.findUsersByConditions(c);
		o.closeSession();

		// String sql =
		// "select * from USERS u , userauth a, isi_company c  where u.userRole=a.roleID and u.compid=a.ID";

		// String sql = "SELECT u.*, a.*, c.*"//
		// + " FROM  USERS  u  INNER JOIN userauth a"//
		// + " ON  u.userRole=a.roleID "//
		// + " left JOIN isi_company c ON u.compid = c.id"//
		// + " WHERE 1=1 ";
		//
		// if (!userAccountListCondition.getUserName().trim().equals("")) {
		// sql = sql + " AND u.userName like '%"
		// + userAccountListCondition.getUserName() + "%' ";
		// }
		//
		// if (!userAccountListCondition.getUserRole().trim().equals("NONE")) {
		// sql = sql + " AND u.USERROLE = '"
		// + userAccountListCondition.getUserRole() + "' ";
		// }
		//
		// sql = sql + " order by compid";
		//
		// try {
		// connectDB();
		// statement = conn.createStatement();
		// rs = statement.executeQuery(sql);
		//
		// int n = 1;
		// while (rs.next()) {
		// UserAccount userAccount = fillUserAccount(rs);
		// userAccount.seq = "" + n;
		// ar.add(userAccount);
		// n++;
		// }
		// } catch (Exception e) {
		// e.printStackTrace();
		// } finally {
		// closeDB();
		// }
		return ar;
	}

	// public UserAccount readUserAccountByUid(String uid) {
	// UserAccount userAccount = new UserAccount();
	// // String sql =
	// //
	// "select * from USERS u, userauth a where u.userRole=a.roleID AND userid='"
	// // + uid + "'";
	//
	// String sql = "SELECT u.*, a.*, c.*"//
	// + " FROM  USERS  u  INNER JOIN userauth a"//
	// + " ON  u.userRole=a.roleID "//
	// + " Left JOIN isi_company c ON u.compid = c.id"//
	// + " WHERE u.userid='" + uid + "'";
	//
	// try {
	// connectDB();
	// statement = conn.createStatement();
	// rs = statement.executeQuery(sql);
	// while (rs.next()) {
	// userAccount = fillUserAccount(rs);
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// } finally {
	// closeDB();
	// }
	// return userAccount;
	// }

	public boolean CheckAccountLoginId(String loginid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		String n = o.findUserCountByLoginId(loginid);
		o.closeSession();
		boolean b = false;
		if (!n.equals("0")) {
			b = true;
		}
		return b;
	}

	public boolean CheckAccountLoginPwd(String loginPwd) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		loginPwd = new PassUtil().encodeClearText(loginPwd);
		String n = o.findUserCountByLoginPwd(loginPwd);
		o.closeSession();
		boolean b = false;
		if (!n.equals("0")) {
			b = true;
		}
		return b;
	}

	String[] getStringArrayFromList(ArrayList ar) {
		String[] s = new String[ar.size()];
		for (int i = 0; i < ar.size(); i++) {
			s[i] = (String) ar.get(i);
		}
		return s;
	}

	public User findUserByLoginIdAndPwdUser(String loginid, String loginPwd) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		loginPwd = new PassUtil().encodeClearText(loginPwd);
		User user = o.findUserByLoginIdAndPwd(loginid, loginPwd);

		if (user != null) {
			ArrayList a = (ArrayList) o.readUserAuthByID(user.getUid());
			user.setAuths(getStringArrayFromList(a));
		}
		// if (userAccount != null) {
		// userAccount.userRoleName = o
		// .findRoleNameFromRoleId(userAccount.userRole);
		//
		// if (userAccount.userRole.equals("company")) {
		// Company cc = o.findCompanyByCompId(userAccount.userCompId);
		// userAccount.userCompName = cc.compName;
		// }
		// }
		o.closeSession();
		return user;
	}

	public User findUsersByUid(String userId) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		User user = o.findUsersByUid(userId);

		ArrayList a = (ArrayList) o.readUserAuthByID(user.getUid());
		user.setAuths(getStringArrayFromList(a));

		if (user.getIsStaff()) {

		} else if (user.getIsBusiness()) {

		}

		// if (userAccount != null) {
		// userAccount.userRoleName = o
		// .findRoleNameFromRoleId(userAccount.userRole);
		//
		// if (userAccount.userRole.equals("company")) {
		// Company cc = o.findCompanyByCompId(userAccount.userCompId);
		// userAccount.userCompName = cc.compName;
		// }
		// }
		o.closeSession();
		return user;
	}

	public void updateMonthlyReport(MonthlyReport monthlyReport) throws Exception {
		String sql = "update reportmonthly set" + //
				// " userid=" + "'" + userAccount.uid + "'" //
				// + "," + //
				" compId=" + "'" + monthlyReport.compId + "'" // 1
				+ "," + //
				" compName=" + "'" + monthlyReport.compName + "'" // 2
				+ "," + //
				" year=" + "'" + monthlyReport.year + "'" // 3
				+ "," + //
				" month=" + "'" + monthlyReport.month + "'" // 4
				+ "," + //
				" yearMonth=" + "'" + monthlyReport.yearMonth + "'" // 5
				+ "," + //
				" revenue=" + monthlyReport.revenue // 6
				+ "," + //
				" phd=" + monthlyReport.phd // 7
				+ "," + //
				" master=" + monthlyReport.master // 8
				+ "," + //
				" proMajor=" + monthlyReport.proMajor // 9
				+ "," + //
				" bachelor=" + monthlyReport.bachelor // 10
				+ "," + //
				" ip_invent=" + monthlyReport.ip_invent // 11
				+ "," + //
				" ip_newType=" + monthlyReport.ip_newType // 12
				+ "," + //
				" ip_look=" + monthlyReport.ip_look // 13
				+ "," + //
				" icDrawing=" + monthlyReport.icDrawing // 14
				+ "," + //
				" softwareProd=" + monthlyReport.softwareProd // 15
				+ "," + //
				" softwareBook=" + monthlyReport.softwareBook // 16
				+ "," + //
				" remark=" + "'" + monthlyReport.remark + "'" // 17

				+ " WHERE uid='" + monthlyReport.uid + "'";// 0

		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	// public void insertUserAccount(UserAccount userAccount) throws
	// SQLException {
	// userAccount.userLoginPwd = new PassUtil()
	// .encodeClearText(userAccount.userLoginPwd);
	// // PreparedStatements can use variables and are more efficient
	// String sql = "insert into  USERS(" + //
	// "userID" + // 1
	// "," + //
	// "userName" + // 2
	// // "," + //
	// // "compName" + // 3
	// "," + //
	// "userPhone" + // 4
	// "," + //
	// "userEmail" + // 5
	// "," + //
	// "userLoginId" + // 6
	// "," + //
	// "userLoginPwd" + // 7
	// "," + //
	// "userRole" + // 8
	// "," + //
	// "userStatus" + // 9
	// "," + //
	// "compid" + // 10
	// ") values (" + //
	// "'" + userAccount.uid + "'" + // 1
	// "," + //
	// "'" + userAccount.userName + "'" + // 2
	// // "," + //
	// // "'" + userAccount.userCompName + "'" + // 3
	// "," + //
	// "'" + userAccount.userPhone + "'" + // 4
	// "," + //
	// "'" + userAccount.userEmail + "'" + // 5
	// "," + //
	// "'" + userAccount.userLoginId + "'" + // 6
	// "," + //
	// "'" + userAccount.userLoginPwd + "'" + // 7
	// "," + //
	// "'" + userAccount.userRole + "'" + // 8
	// "," + //
	// "'" + userAccount.userStatus + "'" + // 9
	// "," + //
	// "'" + userAccount.userCompId + "'" + // 10
	// ")";
	//
	// connectDB();
	// System.out.println(sql);
	// Statement statement = conn.createStatement();
	// statement.executeUpdate(sql);
	// closeDB();
	// }

	/**
	 * 戚小飛
	 * 
	 * @param pcn
	 * @throws SQLException
	 */
	// private Uploads fillUploads(ResultSet rs) {
	// Uploads up = new Uploads();
	// try {
	// up.id = rs.getInt("Id");
	// up.fileName = rs.getString("FileName");
	// up.fileWay = rs.getString("FileWay");
	// up.storeName = rs.getString("StoreName");
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// return up;
	// }
	//
	private PotentiallyCompanyNotes fillPotentcn(ResultSet rs) {
		PotentiallyCompanyNotes pnc = new PotentiallyCompanyNotes();
		try {
			pnc.id = rs.getString("Id");
			// pnc.companyAdress = rs.getString("CompanyAdress");
			// pnc.companyMailbox = rs.getString("CompanyMailbox");
			pnc.companyName = rs.getString("CompanyName");
			pnc.companyNature = rs.getString("CompanyType");
			pnc.companyPersonName = rs.getString("OwnerName");
			pnc.companyPhone = rs.getString("OwnerTelphone");
			// pnc.statusId = rs.getInt("StatusId");

			pnc.contactPerson = rs.getString("manager");
			pnc.contactStatus = rs.getString("CompanyStatus");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pnc;
	}

	private Problems fillProblems(ResultSet rs) {
		Problems pro = new Problems();
		try {
			pro.id = rs.getInt("Id");
			pro.theme = rs.getString("Theme");
			pro.content = rs.getString("Content");
			pro.times = rs.getString("Times");
			pro.announcePerson = rs.getString("announcePerson");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pro;
	}

	private Provides fillProvides(ResultSet rs) {
		Provides pro = new Provides();
		try {
			pro.id = rs.getInt("Id");
			pro.theme = rs.getString("Theme");
			pro.content = rs.getString("Content");
			pro.times = rs.getString("Times");
			pro.announcePerson = rs.getString("announcePerson");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pro;
	}

	public void insertProblems(Problems pro) throws SQLException {

		String sql = "INSERT INTO problems(Theme,Content,Times,AnnouncePerson) VALUES ('" + pro.theme + "','"
				+ pro.content + "','" + pro.times + "','" + pro.announcePerson + "')";
		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	public void insertProvides(Provides pro) throws SQLException {
		String sql = "INSERT INTO provides(Theme,Content,Times,AnnouncePerson) VALUES ('" + pro.theme + "','"
				+ pro.content + "','" + pro.times + "','" + pro.announcePerson + "')";

		try {
			FileUtils.writeStringToFile(new File("c:/xx.txt"), sql);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	public void updateProblems(Problems pro) throws SQLException {
		String sql = "UPDATE problems SET Theme='" + pro.theme + "' , Content='" + pro.content + "' , Times='"
				+ pro.times + "' , AnnouncePerson='" + pro.announcePerson + "'  WHERE Id = " + pro.id;
		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	public void updateProvides(Provides pro) throws SQLException {
		String sql = "UPDATE provides SET Theme='" + pro.theme + "' , Content='" + pro.content + "' , Times='"
				+ pro.times + "' , AnnouncePerson='" + pro.announcePerson + "'  WHERE Id = " + pro.id;
		connectDB();
		System.out.println(sql);
		Statement statement = conn.createStatement();
		statement.executeUpdate(sql);
		closeDB();
	}

	public Problems selectProblemsById(int id) {
		Problems pro = new Problems();
		String sql = "SELECT Id,Theme,Content,Times,AnnouncePerson FROM problems WHERE Id = " + id;
		try {
			connectDB();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				pro = fillProblems(rs);
			}
			return pro;
		} catch (Exception e) {
			e.printStackTrace();
			return new Problems();
		} finally {
			closeDB();
		}
	}

	public Provides selectProvidesById(int id) {
		Provides pro = new Provides();
		String sql = "SELECT Id,Theme,Content,Times,AnnouncePerson FROM provides WHERE Id = " + id;
		try {
			connectDB();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				pro = fillProvides(rs);
			}
			return pro;
		} catch (Exception e) {
			e.printStackTrace();
			return new Provides();
		} finally {
			closeDB();
		}
	}

	// public List<Uploads> selectUploadsList() {
	// String sql =
	// "SELECT Id,FileName,FileWay,StoreName FROM uploads WHERE 1=1";
	// List<Uploads> uplist = new ArrayList<Uploads>();
	// Uploads up = new Uploads();
	// try {
	// connectDB();
	// statement = conn.createStatement();
	// rs = statement.executeQuery(sql);
	// while (rs.next()) {
	// up = fillUploads(rs);
	// uplist.add(up);
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// } finally {
	// closeDB();
	// }
	// return uplist;
	// }

	public List<Problems> selectProblemsList() {
		String sql = "SELECT Id,Theme,Content,Times,AnnouncePerson FROM problems WHERE 1=1";
		List<Problems> prolist = new ArrayList<Problems>();
		Problems pro = new Problems();
		try {
			connectDB();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				pro = fillProblems(rs);
				prolist.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return prolist;
	}

	public List<Provides> selectProvidesList() {
		String sql = "SELECT Id,Theme,Content,Times,AnnouncePerson FROM provides WHERE 1=1";
		List<Provides> prolist = new ArrayList<Provides>();
		Provides pro = new Provides();
		try {
			connectDB();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				pro = fillProvides(rs);
				prolist.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return prolist;
	}

	// 以公司代碼找公司物件
	public PotentiallyCompanyNotes selectPotentiallycCompanyNotesById(String id) {
		PotentiallyCompanyNotes pc = new PotentiallyCompanyNotes();
		String sql = "SELECT * FROM isi_company" + //
				" WHERE Id = '" + id + "'";
		try {
			connectDB();
			statement = conn.createStatement();
			rs = statement.executeQuery(sql);

			while (rs.next()) {
				pc = fillPotentcn(rs);
			}
			return pc;
		} catch (Exception e) {
			e.printStackTrace();
			return new PotentiallyCompanyNotes();
		} finally {
			closeDB();
		}
	}

	/**
	 * 戚小飛結束
	 * 
	 * @param roleid
	 * @return
	 */

	/***** read service data accept for FullCalendar *****/
	public List<ServiceResourceAccept> readServiceResourceAcceptListForFullCalendar(String srdid) {
		List returnList = new ArrayList();
		try {

			connectDB();
			statement = conn.createStatement();

			String sql = "";
			sql += " select a.*,b.Name'srdName',b.Categorize'srdCategorize',c.CompanyName'c_CompanyName' ";
			sql += " FROM service_resource_accept a LEFT JOIN service_resource_data b ON a.SRDID = b.ID LEFT JOIN isi_company c ON a.CompanyID = c.ID ";
			sql += " where a.srdid = '" + srdid + "'";
			sql += " order by a.ID desc ";

			System.out.println(sql);

			// FileUtils.writeStringToFile(new File("c:/xxx.txt"), sql);

			rs = statement.executeQuery(sql);

			String strTempList = "";

			int n = 1;
			while (rs.next()) {
				ServiceResourceAccept obj = fillServiceResourceAccept(rs);

				obj.accept_status = obj.accept_status.replace("0", "等待審核");
				obj.accept_status = obj.accept_status.replace("1", "<font color=green>申請通過</font>");
				obj.accept_status = obj.accept_status.replace("2", "<font color=red>申請失敗</font>");
				obj.accept_status = obj.accept_status.replace("3", "<font color=red>已刪除</font>");

				obj.setSeq(n + "");
				returnList.add(obj);
				n++;
			}
			System.out.println("returnList.size:" + returnList.size());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return returnList;

	}

	public void updateUser(User user) throws SQLException {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		String p2 = user.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			user.setUserLoginPwd(p2);
		}

		o.updateUser(user);
		o.closeSession();
	}

	/***** read service data accept for FullCalendar *****/

	/***** read service data accept for FullCalendar *****/
	// jason;s
	public List<CompanyIndex> findAllCompanysIndex() {

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		List<CompanyIndex> ciList = o.findAllCompanysIndex();
		o.closeSession();
		return ciList;
	}

	public List<FloorInfo> findAllFloorInfo() {

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		List<FloorInfo> fiList = o.findAllFloorInfo();
		o.closeSession();
		return fiList;
	}

	public int findTotalCompanys() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		
		StringBuffer sb = new StringBuffer();
		sb.append(" companyStatus='" + Company.STATUS_MOVEIN + "'");

		DbWhere d = new DbWhere();
		d.setWhere(sb.toString());

		ArrayList recs = (ArrayList) o.findCompanyByWhereString(d);
		int count=recs.size();
		
//		int count = o.findTotalCompanys(new VOCompListCondition());
		o.closeSession();
		return count;
	}

	public int findTotalService() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		int count = o.findTotalService();
		o.closeSession();
		return count;
	}
}
