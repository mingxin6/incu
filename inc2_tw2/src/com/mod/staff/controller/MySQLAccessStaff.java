package com.mod.staff.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.db.DbWhere;
import com.db.MySQLAccessMyBatis;
import com.model.Company;
import com.model.Staff;
import com.model.User;
import com.utils.KeyMaker;
import com.utils.PassUtil;
import com.utils.UserUtil;
import com.vo.VOYearMonthCondition;

public class MySQLAccessStaff {

	public ArrayList findAllStaffs(VOYearMonthCondition voYearMonthCondition) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList recs = (ArrayList) o.findAllStaffs();
		o.closeSession();
		return recs;
	}

	public List findOkStaffs() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		DbWhere d = new DbWhere();
		StringBuffer sb = new StringBuffer();
		sb.append(" 1=1 ");
		sb.append(" AND status='" + Staff.STATUS_OK + "' ");
		d.setWhere(sb.toString());
		ArrayList recs = (ArrayList) o.findStaffsByWhereString(d);
		o.closeSession();
		return recs;
	}

	public Staff findStaffById(String uid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		Staff obj = o.findStaffById(uid);

		System.out.println(" findStaffById ....." + obj.getUid() + "," + obj.getCoveredUserOfTalkNote2());

		// ArrayList fileInfo = (ArrayList) o.findUploadedFiles("" +
		// obj.getUid(),
		// "");
		// obj.setFileInfo(fileInfo);
		o.closeSession();
		return obj;
	}

	public User fillUserObjOfStaff(Staff obj) {
		User user = new User();
		user.setUid(obj.getUid());
		user.setUserName(obj.getName());
		user.setUserEmail(obj.getEmail());
		user.setUserPhone(obj.getPhone());
		user.setLinkedObjId(obj.getUid());
		user.setUserRole(User.STAFF);
		user.setUserLoginId(obj.getUserLoginId());
		user.setUserLoginPwd(obj.getUserLoginPwd());
		user.setUserStatus(obj.getStatus());
		user.setCreatedBy(obj.getCreatedBy());
		user.setCreatedTime(obj.getCreatedTime());
		user.setLastUpdateUser(obj.getLastUpdateUser());
		user.setLastUpdateTime(obj.getLastUpdateTime());
		return user;
	}

	public void insertStaffs(Staff obj, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		obj.setUid("Staff" + KeyMaker.newKey());

		String p2 = obj.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			obj.setUserLoginPwd(p2);
		}

		if (obj.getSeeAllTalkNote().equals("是")) {
			obj.setCoveredUserOfTalkNote2("");
		}

		new UserUtil().markCreater(request, obj);
		new UserUtil().markLastModify(request, obj);
		o.insertStaffs(obj);

		User user = fillUserObjOfStaff(obj);
		o.insertUser(user);

		// UPLOAD file
		// List files = obj.getFiles();
		// ArrayList fileInfo = FileUpDownLoadUtil.upload(request, files);
		//
		// for (int i = 0; i < fileInfo.size(); i++) {
		// VOFile voFile = (VOFile) fileInfo.get(i);
		// voFile.setUid(UUID.randomUUID().toString());
		// voFile.setLinkedObjId("" + obj.getUid());
		// o.insertUploadedFileInfo(voFile);
		// }

		o.closeSession();
	}

	public void updateStaff(Staff obj, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		String p2 = obj.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			obj.setUserLoginPwd(p2);
		}
		new UserUtil().markLastModify(request, obj);

		if (obj.getSeeAllTalkNote().equals("是")) {
			obj.setCoveredUserOfTalkNote2("");
		}
		o.updateStaff(obj);

		User user = fillUserObjOfStaff(obj);
		System.out.println();
		o.updateUser(user);

		// // DELETE file info
		// String[] deletedFiles = request.getParameterValues("deleteCheck");
		// if (deletedFiles != null) {
		// for (int i = 0; i < deletedFiles.length; i++) {
		// o.deleteUploadedFileInfo(deletedFiles[i]);
		// }
		// }
		// // UPLOAD file
		// List files = activityRec.getFiles();
		// ArrayList fileInfo = FileUpDownLoadUtil.upload(request, files);
		//
		// // SAVE file info
		// for (int i = 0; i < fileInfo.size(); i++) {
		// VOFile voFile = (VOFile) fileInfo.get(i);
		// voFile.setUid(UUID.randomUUID().toString());
		// voFile.setLinkedObjId(activityRec.getUid());
		// o.insertUploadedFileInfo(voFile);
		// }
		o.closeSession();
	}

	public void deleteStaff(String uid, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		// o.deleteStaff(uid);

		Staff obj = o.findStaffById(uid);
		obj.setStatus(User.STATUS_HALT);
		new UserUtil().markLastModify(request, obj);
		o.updateStaff(obj);

		User user = fillUserObjOfStaff(obj);
		o.updateUser(user);

		o.closeSession();
	}

}
