package com.mod.reviewer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.db.MySQLAccessMyBatis;
import com.model.Reviewer;
import com.model.User;
import com.utils.KeyMaker;
import com.utils.PassUtil;
import com.utils.UserUtil;

public class MySQLAccessReviewer {

	public ArrayList findAllReviewers() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList recs = (ArrayList) o.findAllReviewers();
		o.closeSession();
		return recs;
	}

	public Reviewer findReviewerById(String uid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		Reviewer obj = o.findReviewerById(uid);
		// ArrayList fileInfo = (ArrayList) o.findUploadedFiles("" +
		// obj.getUid(),
		// "");
		// obj.setFileInfo(fileInfo);
		o.closeSession();
		return obj;
	}

	public User fillUserObjOfReviewer(Reviewer obj) {
		User user = new User();
		user.setUid(obj.getUid());
		user.setUserName(obj.getName());
		user.setUserEmail(obj.getEmail());
		user.setUserPhone(obj.getPhone());
		user.setLinkedObjId(obj.getUid());
		user.setUserRole(User.REVIEWER);
		user.setUserLoginId(obj.getUserLoginId());
		user.setUserLoginPwd(obj.getUserLoginPwd());
		user.setUserStatus(obj.getStatus());
		user.setCreatedBy(obj.getCreatedBy());
		user.setCreatedTime(obj.getCreatedTime());
		user.setLastUpdateUser(obj.getLastUpdateUser());
		user.setLastUpdateTime(obj.getLastUpdateTime());
		return user;
	}

	public void insertReviewers(Reviewer obj, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		obj.setUid("Reviewer" + KeyMaker.newKey());

		String p2 = obj.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			obj.setUserLoginPwd(p2);
		}
		
		new UserUtil().markCreater(request, obj);
		new UserUtil().markLastModify(request, obj);
		o.insertReviewers(obj);

		User user = fillUserObjOfReviewer(obj);
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

	public void updateReviewer(Reviewer obj, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		String p2 = obj.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			obj.setUserLoginPwd(p2);
		}
		new UserUtil().markLastModify(request, obj);
		o.updateReviewer(obj);

		
		User user = fillUserObjOfReviewer(obj);
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

	public void deleteReviewer(String uid, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		Reviewer obj = o.findReviewerById(uid);
		obj.setStatus(User.STATUS_HALT);
		new UserUtil().markLastModify(request, obj);
		o.updateReviewer(obj);
		// o.deleteReviewer(obj);

		User user = fillUserObjOfReviewer(obj);
		o.updateUser(user);

		o.closeSession();
	}

}
