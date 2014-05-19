package com.model;

/**
 * 審查委員
 */
public class Reviewer extends A {
	String uid = "";
	String name = "";
	String email = "";
	String phone = "";
	String unit = "";
	String title = "";
	String remark = "";


	

	boolean existPaperRiviewer = false;// 是否存在於某一審查案
	boolean existMeetingRiviewer = false;// 是否存在於某一審查案

	@Override
	public int hashCode() {
		return uid.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (!(obj instanceof Reviewer)) {
			return false;
		}
		return this.uid == ((Reviewer) obj).getUid();
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	

	

	public boolean isExistPaperRiviewer() {
		return existPaperRiviewer;
	}

	public void setExistPaperRiviewer(boolean existPaperRiviewer) {
		this.existPaperRiviewer = existPaperRiviewer;
	}

	public boolean isExistMeetingRiviewer() {
		return existMeetingRiviewer;
	}

	public void setExistMeetingRiviewer(boolean existMeetingRiviewer) {
		this.existMeetingRiviewer = existMeetingRiviewer;
	}

	public static void main(String[] args) {

	}

}
