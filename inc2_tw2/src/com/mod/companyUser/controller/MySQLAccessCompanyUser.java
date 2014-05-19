package com.mod.companyUser.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.db.DbWhere;
import com.db.MySQLAccessMyBatis;
import com.model.Company;
import com.model.CompanyUser;
import com.model.Staff;
import com.model.User;
import com.utils.KeyMaker;
import com.utils.PassUtil;
import com.utils.UserUtil;
import com.vo.VOYearMonthCondition;

public class MySQLAccessCompanyUser {

	public ArrayList findAllCompanyUsers(VOYearMonthCondition voYearMonthCondition) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList recs = (ArrayList) o.findAllCompanyUsers();
		o.closeSession();
		return recs;
	}

	public List findCompanyUsersByCompId(String compUid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		
		StringBuffer sb = new StringBuffer();
		sb.append(" compUid='" + compUid + "' ");
		System.out.println("findCompanyUsersByCompId==>"+sb.toString());
		
		DbWhere d = new DbWhere();
		d.setWhere(sb.toString());
		ArrayList recs = (ArrayList) o.findCompanyUserByWhereString(d);
		System.out.println("compUsers recs size="+recs.size());
		o.closeSession();
		return recs;
	}

	public CompanyUser findCompanyUserById(String uid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		CompanyUser obj = o.findCompanyUserById(uid);
		o.closeSession();
		return obj;
	}

	public User fillUserObjOfCompanyUser(CompanyUser obj) {
		User user = new User();
		user.setUid(obj.getUid());
		user.setUserName(obj.getName());
		user.setUserEmail(obj.getEmail());
		user.setUserPhone(obj.getPhone());

		user.setCompid(obj.getCompUid());
		user.setUserComp(obj.getCompName());
		user.setLinkedObjId(obj.getCompUid());

		user.setUserRole(User.BUSINESS);
		user.setUserLoginId(obj.getUserLoginId());
		user.setUserLoginPwd(obj.getUserLoginPwd());
		user.setUserStatus(obj.getStatus());
		user.setCreatedBy(obj.getCreatedBy());
		user.setCreatedTime(obj.getCreatedTime());
		user.setLastUpdateUser(obj.getLastUpdateUser());
		user.setLastUpdateTime(obj.getLastUpdateTime());
		return user;
	}

	public void insertCompanyUsers(CompanyUser compUser, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		Company comp = (Company) o.findCompanyByCompName(compUser.getCompName());

		compUser.setUid("compUser" + KeyMaker.newKey());

		String p2 = compUser.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			compUser.setUserLoginPwd(p2);
		}

		compUser.setCompUid(comp.getUid());
		compUser.setCustomId(comp.getCustomId());
		compUser.markCreatinfo(request);
		compUser.markModifyinfo(request);

		o.insertCompanyUsers(compUser);

		// -------------------------------------------------
		User user = fillUserObjOfCompanyUser(compUser);
		o.insertUser(user);

		o.closeSession();
	}

	public void updateCompanyUser(CompanyUser obj, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		String p2 = obj.getUserLoginPwdClearText().trim();
		if (!p2.equals("")) {
			p2 = new PassUtil().encodeClearText(p2);
			obj.setUserLoginPwd(p2);
		}
		obj.markModifyinfo(request);
		o.updateCompanyUser(obj);

		User user = fillUserObjOfCompanyUser(obj);
		o.updateUser(user);

		o.closeSession();
	}

	public void deleteCompanyUser(String uid, HttpServletRequest request) throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		// o.deleteCompanyUser(uid);

		CompanyUser obj = o.findCompanyUserById(uid);
		obj.setStatus(User.STATUS_HALT);
		obj.markModifyinfo(request);
		o.updateCompanyUser(obj);

		User user = fillUserObjOfCompanyUser(obj);
		o.updateUser(user);

		o.closeSession();
	}

}
