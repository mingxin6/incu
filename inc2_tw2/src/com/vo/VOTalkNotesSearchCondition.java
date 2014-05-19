package com.vo;

import java.util.ArrayList;

public class VOTalkNotesSearchCondition {

	String year = "";
	String month = "";
	String compName = "";
	String keyContent = "";

	String[] tags; // tag

	String talkDateTime = "";
	String compName2 = "";
	String keyContent2 = "";

	String compId = "";
	String type = ""; // AM? PM? Teacher? Self?

	String status = "";

	String consultantId = "";
	
	String userIdList="";
	
	

	public String getUserIdList() {
		return userIdList;
	}

	public void setUserIdList(String userIdList) {
		this.userIdList = userIdList;
	}

	public String getConsultantId() {
		return consultantId;
	}

	public void setConsultantId(String consultantId) {
		this.consultantId = consultantId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getYear() {
		return year;
	}

	public String[] getTags() {
		return tags;
	}

	public void setTags(String[] tags) {
		this.tags = tags;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getTalkDateTime() {
		// System.out.println("year="+year);
		// System.out.println("month="+month);

		if (year.equals("") && month.equals("")) {
			return "";
		} else if (year.equals("NONE") && month.equals("NONE")) {
			return "";
		} else if (!year.equals("NONE") && month.equals("NONE")) {
			return "%" + year + "/" + "%";
		} else if (year.equals("NONE") && !month.equals("NONE")) {
			return "%" + "/" + month + "%";
		} else
			return "%" + year + "/" + month + "%";
	}

	public void setTalkDateTime(String talkDateTime) {
		this.talkDateTime = talkDateTime;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getKeyContent() {
		return keyContent;
	}

	public void setKeyContent(String keyContent) {
		this.keyContent = keyContent;
	}

	public String getCompName2() {
		return "%" + compName + "%";
	}

	public void setCompName2(String compName2) {
		this.compName2 = compName2;
	}

	public String getKeyContent2() {
		return "%" + keyContent + "%";
	}

	public void setKeyContent2(String keyContent2) {
		this.keyContent2 = keyContent2;
	}

}
