package com.mod.todo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.db.MySQLAccessMyBatis;
import com.model.Reviewer;
import com.model.Teacher;
import com.model.User;
import com.utils.KeyMaker;
import com.utils.PassUtil;
import com.utils.UserUtil;
import com.vo.VOYearMonthCondition;

public class MySQLAccessTodo {

	public ArrayList findAllTeachers(VOYearMonthCondition voYearMonthCondition) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList recs = (ArrayList) o.findAllTeachers();
		o.closeSession();
		return recs;
	}

	public Teacher findTeacherById(String uid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		Teacher obj = o.findTeacherById(uid);
		// ArrayList fileInfo = (ArrayList) o.findUploadedFiles("" +
		// obj.getUid(),
		// "");
		// obj.setFileInfo(fileInfo);
		o.closeSession();
		return obj;
	}

	public User fillUserObjOfTeacher(Teacher obj) {
		User user = new User();
		user.setUid(obj.getUid());
		user.setUserName(obj.getName());
		user.setUserEmail(obj.getEmail());
		user.setUserPhone(obj.getPhone());
		user.setLinkedObjId(obj.getUid());
		user.setUserRole(User.TEACHER);
		user.setUserLoginId(obj.getUserLoginId());
		user.setUserLoginPwd(obj.getUserLoginPwd());
		user.setUserStatus(obj.getStatus());
		user.setCreatedBy(obj.getCreatedBy());
		user.setCreatedTime(obj.getCreatedTime());
		user.setLastUpdateUser(obj.getLastUpdateUser());
		user.setLastUpdateTime(obj.getLastUpdateTime());
		return user;
	}

	public void insertTeachers(Teacher obj, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		obj.setUid("Teacher" + KeyMaker.newKey());

		String p2 = obj.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			obj.setUserLoginPwd(p2);
		}
		new UserUtil().markCreater(request, obj);
		new UserUtil().markLastModify(request, obj);
		o.insertTeachers(obj);

		User user = fillUserObjOfTeacher(obj);
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

	public void updateTeacher(Teacher obj, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		String p2 = obj.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			obj.setUserLoginPwd(p2);
		}
		new UserUtil().markLastModify(request, obj);

		o.updateTeacher(obj);

		User user = fillUserObjOfTeacher(obj);
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

	public void deleteTeacher(String uid, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		// o.deleteTeacher(uid);

		Teacher obj = o.findTeacherById(uid);
		obj.setStatus(User.STATUS_HALT);
		new UserUtil().markLastModify(request, obj);
		o.updateTeacher(obj);

		User user = fillUserObjOfTeacher(obj);
		o.updateUser(user);

		o.closeSession();
	}

}
