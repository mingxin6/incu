package com.model;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Const;
import com.utils.KeyMaker;

public class A {

	public static String STATUS_OK = "ok";// "啟用";
	public static String STATUS_HALT = "halt";// "停用";

	public static Map getEntityValidStatus(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		Map<String, String> statusCond = new LinkedHashMap<String, String>();
		// statusCond.put("NONE", "---");
		statusCond.put(STATUS_OK, resource.getString("user.status.ok"));
		statusCond.put(STATUS_HALT, resource.getString("user.status.halt"));
		return statusCond;
	}

	String status = "";
	private String entityStatusRS = "";

	public String getEntityStatusRS() {
		return entityStatusRS;
	}

	public void setEntityStatusRS(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		if (STATUS_OK.equals(status)) {
			this.entityStatusRS = resource.getString("user.status.ok");
		} else if (STATUS_HALT.equals(status)) {
			this.entityStatusRS = resource.getString("user.status.halt");
		} else {
			this.entityStatusRS = status;
		}
	}

	private String userLoginId = "";

	private String userLoginPwd = "";
	private String userLoginPwdClearText = "";
	private String userLoginPwdClearText2 = "";

	private String createdBy = "";
	private String createdTime = "";

	private String lastUpdateUser = "";
	private String lastUpdateTime = "";

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLastUpdateUser() {
		return lastUpdateUser;
	}

	public void setLastUpdateUser(String lastUpdateUser) {
		this.lastUpdateUser = lastUpdateUser;
	}

	public String getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(String lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}

	public void markCreatinfo(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		setCreatedBy(u.getUserName());
		setCreatedTime(KeyMaker.newKey());
	}

	public void markModifyinfo(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		setLastUpdateUser(u.getUserName());
		setLastUpdateTime(KeyMaker.newKey());
	}

	public String getUserLoginId() {
		return userLoginId;
	}

	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}

	public String getUserLoginPwd() {
		return userLoginPwd;
	}

	public void setUserLoginPwd(String userLoginPwd) {
		this.userLoginPwd = userLoginPwd;
	}

	public String getUserLoginPwdClearText() {
		return userLoginPwdClearText;
	}

	public void setUserLoginPwdClearText(String userLoginPwdClearText) {
		this.userLoginPwdClearText = userLoginPwdClearText;
	}

	public String getUserLoginPwdClearText2() {
		return userLoginPwdClearText2;
	}

	public void setUserLoginPwdClearText2(String userLoginPwdClearText2) {
		this.userLoginPwdClearText2 = userLoginPwdClearText2;
	}

	// ---------------------------------------------------------------------
	public String getCreatedTime2() {
		try {
			return convertROCDate(createdTime);
		} catch (Exception e) {
			return createdTime;
		}
	}

	public String getLastUpdateTime2() {
		try {
			return convertROCDate(lastUpdateTime);
		} catch (Exception e) {
			return lastUpdateTime;
		}
	}

	String convertROCDate(String d) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("yyyyMMddHHmmssSSS");
		Date testeddate = sdf.parse(d);
		Calendar c = Calendar.getInstance();
		c.setTime(testeddate);
		DecimalFormat formatter = new DecimalFormat("00");
		DecimalFormat formatter2 = new DecimalFormat("000");
		int year = c.get(Calendar.YEAR) - 1911;
		String yyy = formatter2.format(year);
		int month = c.get(Calendar.MONTH) + 1;
		String mm = formatter.format(month);
		int day = c.get(Calendar.DAY_OF_MONTH);
		String dd = formatter.format(day);
		return yyy + "/" + mm + "/" + dd;
	}
}
