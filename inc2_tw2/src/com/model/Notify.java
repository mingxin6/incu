package com.model;

import java.util.ArrayList;

public class Notify extends A{
	
	public static String STATUS_SENT ="SENT";// "已發送";
	public static String STATUS_NEW = "NOT_SENT";//"未發送";
	
	String notifyUid = "";
	String referenceUid = "";
	String subject = "";
	String content = "";

	ArrayList<Notifyee> notifyees = new ArrayList<Notifyee>();

	public String getNotifyUid() {
		return notifyUid;
	}

	public void setNotifyUid(String notifyUid) {
		this.notifyUid = notifyUid;
	}

	public String getReferenceUid() {
		return referenceUid;
	}

	public void setReferenceUid(String referenceUid) {
		this.referenceUid = referenceUid;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public ArrayList<Notifyee> getNotifyees() {
		return notifyees;
	}

	public void setNotifyees(ArrayList<Notifyee> notifyees) {
		this.notifyees = notifyees;
	}

}
