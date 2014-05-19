package com.model;

import java.util.ArrayList;

import com.vo.VOFile;

public class Notifyee extends A {
	String notifyeeUid = "";
	String notifyUid = "";
	String subject = "";
	String content = "";
	String name = "";
	String compName = "";
	String email = "";
	String phone = "";
	int tryTimes = 0;
	
	String result = "";

	String attachDir = "";// 附件存放路徑

	public String getNotifyeeUid() {
		return notifyeeUid;
	}

	public void setNotifyeeUid(String notifyeeUid) {
		this.notifyeeUid = notifyeeUid;
	}

	public String getNotifyUid() {
		return notifyUid;
	}

	public void setNotifyUid(String notifyUid) {
		this.notifyUid = notifyUid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getTryTimes() {
		return tryTimes;
	}

	public void setTryTimes(int tryTimes) {
		this.tryTimes = tryTimes;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	

	public String getAttachDir() {
		return attachDir;
	}

	public void setAttachDir(String attachDir) {
		this.attachDir = attachDir;
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

}
