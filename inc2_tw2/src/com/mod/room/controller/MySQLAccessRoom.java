package com.mod.room.controller;

import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.db.DbWhere;
import com.db.MySQLAccessMyBatis;
import com.model.Company;
import com.model.Room;
import com.utils.KeyMaker;

public class MySQLAccessRoom {

	public ArrayList findAllRooms() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList recs = (ArrayList) o.findAllRooms();
		o.closeSession();
		return recs;
	}

	public ArrayList findEmptyOkRoomsByWhereString() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		DbWhere d = new DbWhere();
		d.setWhere(//
				" (compName='' or compName is NULL) "//
						+ " AND "//
						+ " status='" + Room.STATUS_OK + "' "//
						+ " order by floor,roomNo "//
				);
		ArrayList recs = (ArrayList) o.findRoomsByWhereString(d);
		o.closeSession();
		return recs;
	}

	public String findRoomUsedRatio() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		DbWhere d = new DbWhere();
		d.setWhere(" 1=1  AND  status='" + Room.STATUS_OK + "'");
		ArrayList okRooms = (ArrayList) o.findRoomsByWhereString(d);

		double totalArea = 0;
		double usedArea = 0;
		for (int i = 0; i < okRooms.size(); i++) {
			Room room = (Room) okRooms.get(i);
			double num = 0;
			try {
				num = Double.parseDouble(room.getRoomArea());
			} catch (Exception e) {
			}
			totalArea = totalArea + num;
			if (!room.getCompId().equals("")) {
				usedArea = usedArea + num;
			}
		}

		BigDecimal b = new BigDecimal((usedArea / totalArea) * 100.0).setScale(1, BigDecimal.ROUND_HALF_UP);
		o.closeSession();
		return "" + b;
	}

	public Room findRoomById(String uid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		Room obj = o.findRoomById(uid);
		// ArrayList fileInfo = (ArrayList) o.findUploadedFiles("" +
		// obj.getUid(),
		// "");
		// obj.setFileInfo(fileInfo);
		o.closeSession();
		return obj;
	}

	public void insertRooms(Room obj, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		if (!obj.getCompName().equals("")) {
			Company comp = (Company) o.findCompanyByCompName(obj.getCompName());
			if (comp != null) {
				obj.setCompId(comp.getUid());
				obj.setCompCustomid(comp.getCustomId());
				obj.setCompName(comp.getCompName());
			}
		}
		obj.setUid("Room" + KeyMaker.newKey());
		o.insertRooms(obj);

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

	public void updateRoom(Room obj, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		if (!obj.getCompName().equals("")) {
			Company comp = (Company) o.findCompanyByCompName(obj.getCompName());
			if (comp != null) {
				obj.setCompId(comp.getUid());
				obj.setCompCustomid(comp.getCustomId());
				obj.setCompName(comp.getCompName());
			}
		}
		o.updateRoom(obj);

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

	public void deleteRoom(String uid, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.deleteRoom(uid);
		o.closeSession();
	}

	public static void main(String[] args) {

	}

}
