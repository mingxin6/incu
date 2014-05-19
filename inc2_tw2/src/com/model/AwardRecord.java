package com.model;

public class AwardRecord {

	String uid = "";
	String compId = "";
	String awardName = "";
	String awardIssuer = "";
	String awardDate = "";
	String hasAwardMoney = "";//Y/N
	String remark = "";

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getAwardName() {
		return awardName;
	}

	public void setAwardName(String awardName) {
		this.awardName = awardName;
	}

	public String getAwardIssuer() {
		return awardIssuer;
	}

	public void setAwardIssuer(String awardIssuer) {
		this.awardIssuer = awardIssuer;
	}

	public String getAwardDate() {
		return awardDate;
	}

	public void setAwardDate(String awardDate) {
		this.awardDate = awardDate;
	}

	public String getHasAwardMoney() {
		return hasAwardMoney;
	}

	public void setHasAwardMoney(String hasAwardMoney) {
		this.hasAwardMoney = hasAwardMoney;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
