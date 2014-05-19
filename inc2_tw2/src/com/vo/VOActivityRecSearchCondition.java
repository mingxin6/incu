package com.vo;

public class VOActivityRecSearchCondition {

	String year = "NONE";
	String month = "NONE";
	//String compName = "";
	String keyContent = "";

	String theDate = "";
	//String compName2 = "";
	String keyContent2 = "";

	public String getYear() {
		return year;
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

	public String getTheDate() {
		if (year.equals("NONE") && month.equals("NONE")) {
			return "";
		} else if (!year.equals("NONE") && month.equals("NONE")) {
			return "%" + year + "/" + "%";
		} else if (year.equals("NONE") && !month.equals("NONE")) {
			return "%" + "/" + month + "%";
		} else
			return "%" + year + "/" + month + "%";
	}

	public void setTheDate(String talkDateTime) {
		this.theDate = talkDateTime;
	}
//
//	public String getCompName() {
//		return compName;
//	}
//
//	public void setCompName(String compName) {
//		this.compName = compName;
//	}

	public String getKeyContent() {
		return keyContent;
	}

	public void setKeyContent(String keyContent) {
		this.keyContent = keyContent;
	}

//	public String getCompName2() {
//		return "%" + compName + "%";
//	}
//
//	public void setCompName2(String compName2) {
//		this.compName2 = compName2;
//	}

	public String getKeyContent2() {
		return "%" + keyContent + "%";
	}

	public void setKeyContent2(String keyContent2) {
		this.keyContent2 = keyContent2;
	}

}
