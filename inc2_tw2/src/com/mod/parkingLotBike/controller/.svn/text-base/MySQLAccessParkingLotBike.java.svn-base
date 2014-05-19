package com.mod.parkingLotBike.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.db.MySQLAccessMyBatis;
import com.model.ParkingLotBike;
import com.utils.KeyMaker;

public class MySQLAccessParkingLotBike {

	public ArrayList findAllParkingLotBikes() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList recs = (ArrayList) o.findAllParkingLotBikes();
		o.closeSession();
		return recs;
	}

	public ParkingLotBike findParkingLotBikeById(String uid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ParkingLotBike obj = o.findParkingLotBikeById(uid);
		// ArrayList fileInfo = (ArrayList) o.findUploadedFiles("" +
		// obj.getUid(),
		// "");
		// obj.setFileInfo(fileInfo);
		o.closeSession();
		return obj;
	}
	
	public ParkingLotBike findParkingLotBikeByUser(String user) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ParkingLotBike obj = o.findParkingLotBikeByUser(user);
		// ArrayList fileInfo = (ArrayList) o.findUploadedFiles("" +
		// obj.getUid(),
		// "");
		// obj.setFileInfo(fileInfo);
		o.closeSession();
		return obj;
	}

	public void insertParkingLotBikes(ParkingLotBike obj, HttpServletRequest request)
			throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		obj.setUid("ParkingLotBike" + KeyMaker.newKey());
		
		
		
		o.insertParkingLotBikes(obj);

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

	public void updateParkingLotBike(ParkingLotBike obj, HttpServletRequest request)
			throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.updateParkingLotBike(obj);

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

	public void deleteParkingLotBike(String uid, HttpServletRequest request)
			throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.deleteParkingLotBike(uid);
		o.closeSession();
	}

	public static void main(String[] args) {
		
	}

	
}
