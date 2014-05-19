package com.model;

public class Activity {
	private boolean isnew = false;
	private String seq = "";
	private String aid = "";
	private String theme = "";
	private String sponsor = "";
	private String lecturer = ""; 
	private String lecturerintro="";
	private String remarks="";
	
	
	public boolean getIsnew() {
		return isnew;
	}
	public void setIsnew(boolean isnew) {
		this.isnew = isnew;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getSponsor() {
		return sponsor;
	}
	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}
	public String getLecturer() {
		return lecturer;
	}
	public void setLecturer(String lecturer) {
		this.lecturer = lecturer;
	}
	public String getLecturerintro() {
		return lecturerintro;
	}
	public void setLecturerintro(String lecturerintro) {
		this.lecturerintro = lecturerintro;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
		
}
