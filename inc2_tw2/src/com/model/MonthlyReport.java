package com.model;

public class MonthlyReport {

	public String seq;

	public String uid = "";
	public String compId = "";
	public String compName = "";
	public String year = "";
	public String month = "";
	public String yearMonth = "";
	public float revenue = 0;
	public int phd = 0;
	public int master = 0;
	public int proMajor = 0;// 本科
	public int bachelor = 0;// 大专
	public int totalEmployee = 0;//

	public int ip_invent = 0;
	public int ip_newType = 0;
	public int ip_look = 0;
	public int icDrawing = 0;
	public int softwareProd = 0;
	public int softwareBook = 0;// 软件著作权
	public String remark = "";// 备注

	public boolean status = true;// false : 已确认

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public int getTotalEmployee() {
		return totalEmployee;
	}

	public void setTotalEmployee(int totalEmployee) {
		this.totalEmployee = totalEmployee;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

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

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

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

	public String getYearMonth() {
		return yearMonth;
	}

	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}

	public float getRevenue() {
		return revenue;
	}

	public void setRevenue(float revenue) {
		this.revenue = revenue;
	}

	public int getPhd() {
		return phd;
	}

	public void setPhd(int phd) {
		this.phd = phd;
	}

	public int getMaster() {
		return master;
	}

	public void setMaster(int master) {
		this.master = master;
	}

	public int getProMajor() {
		return proMajor;
	}

	public void setProMajor(int proMajor) {
		this.proMajor = proMajor;
	}

	public int getBachelor() {
		return bachelor;
	}

	public void setBachelor(int bachelor) {
		this.bachelor = bachelor;
	}

	public int getIp_invent() {
		return ip_invent;
	}

	public void setIp_invent(int ip_invent) {
		this.ip_invent = ip_invent;
	}

	public int getIp_newType() {
		return ip_newType;
	}

	public void setIp_newType(int ip_newType) {
		this.ip_newType = ip_newType;
	}

	public int getIp_look() {
		return ip_look;
	}

	public void setIp_look(int ip_look) {
		this.ip_look = ip_look;
	}

	public int getIcDrawing() {
		return icDrawing;
	}

	public void setIcDrawing(int icDrawing) {
		this.icDrawing = icDrawing;
	}

	public int getSoftwareProd() {
		return softwareProd;
	}

	public void setSoftwareProd(int softwareProd) {
		this.softwareProd = softwareProd;
	}

	public int getSoftwareBook() {
		return softwareBook;
	}

	public void setSoftwareBook(int softwareBook) {
		this.softwareBook = softwareBook;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
