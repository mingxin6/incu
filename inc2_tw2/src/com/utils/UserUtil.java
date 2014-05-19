package com.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.model.A;
import com.model.User;

public class UserUtil {

	public String getLoginUserName(HttpServletRequest request, A obj) {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		return u.getUserName();
	}

	public void markCreater(HttpServletRequest request, A obj) {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		obj.setCreatedBy(u.getUserName());
		obj.setCreatedTime(KeyMaker.newKey());
	}

	public void markLastModify(HttpServletRequest request, A obj) {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");
		obj.setLastUpdateUser(u.getUserName());
		obj.setLastUpdateTime(KeyMaker.newKey());
	}
	
	public static void main(String[] args) {

	}
}
