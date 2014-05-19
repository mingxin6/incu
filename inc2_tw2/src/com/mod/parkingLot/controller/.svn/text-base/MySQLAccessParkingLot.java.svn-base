package com.mod.parkingLot.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.db.MySQLAccessMyBatis;
import com.model.ParkingLot;
import com.utils.KeyMaker;

public class MySQLAccessParkingLot {

	public ArrayList findAllParkingLots() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList recs = (ArrayList) o.findAllParkingLots();
		o.closeSession();
		return recs;
	}

	public ParkingLot findParkingLotById(String uid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ParkingLot obj = o.findParkingLotById(uid);
		// ArrayList fileInfo = (ArrayList) o.findUploadedFiles("" +
		// obj.getUid(),
		// "");
		// obj.setFileInfo(fileInfo);
		o.closeSession();
		return obj;
	}

	public ParkingLot findParkingLotByUser(String user) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ParkingLot obj = o.findParkingLotByUser(user);
		// ArrayList fileInfo = (ArrayList) o.findUploadedFiles("" +
		// obj.getUid(),
		// "");
		// obj.setFileInfo(fileInfo);
		o.closeSession();
		return obj;
	}
	
	public void insertParkingLots(ParkingLot obj, HttpServletRequest request)
			throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		obj.setUid("ParkingLot" + KeyMaker.newKey());
		o.insertParkingLots(obj);

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

	public void updateParkingLot(ParkingLot obj, HttpServletRequest request)
			throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.updateParkingLot(obj);

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

	public void deleteParkingLot(String uid, HttpServletRequest request)
			throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.deleteParkingLot(uid);
		o.closeSession();
	}

	public static void main(String[] args) {
		
	}

	
}
