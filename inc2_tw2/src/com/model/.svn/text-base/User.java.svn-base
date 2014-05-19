package com.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import z.Org;

public class User extends A {

	public static String MEMBER ="MEMBER";// "會員";
	public static String REVIEWER ="REVIEWER";// "審查委員";
	public static String Cashier ="Cashier";// "出納人員";
	public static String FinancialOfficer ="FinancialOfficer";// "財務人員";
	public static String TEACHER ="TEACHER";// "業師";
	public static String STAFF ="STAFF";// "中心人員";
	public static String BUSINESS ="BUSINESS";// "進駐企業";
	public static String ADMIN ="ADMIN";// "系統管理員";

	
	public static Map getUserRolesCondition() {
		Map<String, String> statusCond = new LinkedHashMap<String, String>();
		// statusCond.put("NONE", "---");
		statusCond.put(MEMBER, MEMBER);
		statusCond.put(Cashier, Cashier);
		statusCond.put(FinancialOfficer, FinancialOfficer);
		statusCond.put(REVIEWER, REVIEWER);
		statusCond.put(TEACHER, TEACHER);
		statusCond.put(STAFF, STAFF);
		statusCond.put(BUSINESS, BUSINESS);
		statusCond.put(ADMIN, ADMIN);
		return statusCond;
	}

	

	private String uid = "";
	private String userName = "";
	private String userPhone = "";
	private String userEmail = "";

	private String userStatus = "";// 暂停, 启用, 删除...
	private String userRole = "";

	private String compid = ""; // 公司唯一代码
	private String userComp = "";
	private String linkedObjId = "";// 對應的物件的id, 例如業師貨公司的id

	private String userid = "";
	private String userpwd = "";

	boolean seeAllTalkNote = false;
	String[] coveredUserOfTalkNote = new String[] {};

	String[] auths;

	private ArrayList<Org> orgs = new ArrayList();

	private boolean hasAuth(String a) {
		boolean b = false;
		for (int i = 0; i < auths.length; i++) {
			if (a.equals(auths[i])) {
				b = true;
				break;
			}
		}
		return b;
	}

	public boolean getIsBusiness() {
		return userRole.equals(BUSINESS);
	}

	public boolean getIsStaff() {
		return userRole.equals(STAFF);
	}

	public boolean getIsAdmin() {
		return userRole.equals(ADMIN);
	}

	public boolean getIsReviewer() {
		return userRole.equals(REVIEWER);
	}

	public boolean getIsTeacher() {
		return userRole.equals(TEACHER);
	}

	public boolean getIsMember() {
		return userRole.equals(MEMBER);
	}

	public boolean getIsCashier() {
		return userRole.equals(Cashier);
	}

	public boolean getIsFinancialOfficer() {
		return userRole.equals(FinancialOfficer);
	}

	public String getUid() {
		return uid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public ArrayList<Org> getOrgs() {
		return orgs;
	}

	public void setOrgs(ArrayList<Org> orgs) {
		this.orgs = orgs;
	}

	public String getUserComp() {
		return userComp;
	}

	public void setUserComp(String userComp) {
		this.userComp = userComp;
	}

	public void setCompid(String compid) {
		this.compid = compid;
	}

	public String getCompid() {
		return compid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String[] getAuths() {
		return auths;
	}

	public void setAuths(String[] auths) {
		this.auths = auths;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getLinkedObjId() {
		return linkedObjId;
	}

	public void setLinkedObjId(String linkedObjId) {
		this.linkedObjId = linkedObjId;
	}

	public boolean isSeeAllTalkNote() {
		return seeAllTalkNote;
	}

	public void setSeeAllTalkNote(boolean seeAllTalkNote) {
		this.seeAllTalkNote = seeAllTalkNote;
	}

	public String[] getCoveredUserOfTalkNote() {
		return coveredUserOfTalkNote;
	}

	public void setCoveredUserOfTalkNote(String[] coveredUserOfTalkNote) {
		this.coveredUserOfTalkNote = coveredUserOfTalkNote;
	}

}
