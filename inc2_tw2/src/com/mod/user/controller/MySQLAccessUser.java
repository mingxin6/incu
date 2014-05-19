package com.mod.user.controller;

import java.sql.SQLException;

import com.db.MySQLAccessMyBatis;
import com.model.Company;
import com.model.User;
import com.utils.KeyMaker;
import com.utils.PassUtil;

public class MySQLAccessUser {

	public void insertUser(User user) throws SQLException {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		user.setUid("user" + KeyMaker.newKey());
		String p2 = user.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			user.setUserLoginPwd(p2);
		}

		Company comp = (Company) o.findCompanyByCompName(user.getUserComp());

		System.out.println("OOPPPP++===>" + comp.getUid() + ","
				+ comp.getCompName());

		user.setCompid(comp.getUid());

		o.insertUser(user);
		o.closeSession();
	}
	
	public void insertUserRegister(User user) throws SQLException {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		user.setUid("user" + KeyMaker.newKey());
		String p2 = user.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			user.setUserLoginPwd(p2);
		}
		o.insertUser(user);
		o.closeSession();
	}
}
