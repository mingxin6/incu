package com.model;

public class Staff extends A {
	String uid = "";
	String domain = "";
	String name = "";
	String email = "";
	String phone = "";
	String unit = "";
	String title = "";
	String remark = "";

	
	String officeHour = "";

	String seeAllTalkNote = "";
	String[] coveredUserOfTalkNote = new String[] {};
	String coveredUserOfTalkNote2 = "";

	public static String YES = "是";
	public static String NO = "否";

	@Override
	public int hashCode() {
		return uid.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (!(obj instanceof Staff)) {
			return false;
		}
		return this.uid == ((Staff) obj).getUid();
	}

	public boolean isCanSeeAll() {
		return seeAllTalkNote.equals(YES);
	}

	public boolean isCannotSeeAll() {
		return seeAllTalkNote.equals(NO);
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
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

	

	public String getOfficeHour() {
		return officeHour;
	}

	public void setOfficeHour(String officeHour) {
		this.officeHour = officeHour;
	}

	public String getSeeAllTalkNote() {
		return seeAllTalkNote;
	}

	public void setSeeAllTalkNote(String seeAllTalkNote) {
		this.seeAllTalkNote = seeAllTalkNote;
	}

	// 轉coveredUserOfTalkNote2成 array, 準備頁面供挑選
	public String[] getCoveredUserOfTalkNote() {
		if (this.coveredUserOfTalkNote2 != null && !this.coveredUserOfTalkNote2.equals("")) {
			return coveredUserOfTalkNote2.split(",");
		} else {
			return new String[] {};
		}
	}

	// 保存頁面挑選的項目到真正的 coveredUserOfTalkNote2
	public void setCoveredUserOfTalkNote(String[] coveredUserOfTalkNote) {
		String s = "";
		for (int i = 0; i < coveredUserOfTalkNote.length; i++) {
			s = s + coveredUserOfTalkNote[i];
			if (i != coveredUserOfTalkNote.length - 1) {
				s = s + ",";
			}
		}
		this.coveredUserOfTalkNote2 = s;
	}

	public String getCoveredUserOfTalkNote2() {
		return this.coveredUserOfTalkNote2;
	}

	public void setCoveredUserOfTalkNote2(String coveredUserOfTalkNote2) {
		this.coveredUserOfTalkNote2 = coveredUserOfTalkNote2;
	}

	// --------------------------------------------------------------

	public String getCoveredUsersForDBQuery() {
		String s = "";
		String[] a = getCoveredUserOfTalkNote();
		for (int i = 0; i < a.length; i++) {
			s = s + "'" + a[i] + "'";
			if (i != a.length - 1) {
				s = s + ",";
			}
		}
		return s;
	}

}
