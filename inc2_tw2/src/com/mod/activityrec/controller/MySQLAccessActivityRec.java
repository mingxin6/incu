package com.mod.activityrec.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.db.MySQLAccessMyBatis;
import com.model.ActivityRec;
import com.utils.FileUpDownLoadUtil;
import com.utils.KeyMaker;
import com.vo.VOActivityRecSearchCondition;
import com.vo.VOFile;

public class MySQLAccessActivityRec {

	public ArrayList findActivityRecBySearch(
			VOActivityRecSearchCondition voActivityRecSearchCondition) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList ar = (ArrayList) o
				.findActivityRecBySearch(voActivityRecSearchCondition);

		o.closeSession();
		return ar;
	}

	public ActivityRec findActivityRecById(String uid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ActivityRec obj = o.findActivityRecById(uid);
		ArrayList fileInfo = (ArrayList) o.findUploadedFiles("" + obj.getUid(),
				"");
		obj.setFileInfo(fileInfo);
		o.closeSession();
		return obj;
	}

	public void insertActivityRec(ActivityRec obj, HttpServletRequest request)
			throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		
		obj.setUid("Act" + KeyMaker.newKey());
		o.insertActivityRec(obj);

		// UPLOAD file
		List files = obj.getFiles();
		ArrayList fileInfo = FileUpDownLoadUtil.upload(request, files);
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId("" + obj.getUid());
			o.insertUploadedFileInfo(voFile);
		}

		o.closeSession();
	}

	public void updateActivityRec(ActivityRec activityRec,
			HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.updateActivityRec(activityRec);

		// DELETE file info
		String[] deletedFiles = request.getParameterValues("deleteCheck");
		if (deletedFiles != null) {
			for (int i = 0; i < deletedFiles.length; i++) {
				o.deleteUploadedFileInfo(deletedFiles[i]);
			}
		}
		// UPLOAD file
		List files = activityRec.getFiles();
		ArrayList fileInfo = FileUpDownLoadUtil.upload(request, files);

		// SAVE file info
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId(activityRec.getUid());
			o.insertUploadedFileInfo(voFile);
		}
		o.closeSession();
	}

}
