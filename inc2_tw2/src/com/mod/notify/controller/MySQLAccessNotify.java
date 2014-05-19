package com.mod.notify.controller;

import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;

import com.db.DbWhere;
import com.db.MySQLAccessMyBatis;
import com.mod.reviewer.controller.MySQLAccessReviewer;
import com.model.Company;
import com.model.Notify;
import com.model.Notifyee;
import com.model.ReviewPaper;
import com.model.ReviewPaperResult;
import com.model.Reviewer;
import com.utils.KeyMaker;
import com.utils.UserUtil;

public class MySQLAccessNotify  {

	public int insertNotifyAndNotifyees(Notify notify) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		int n = o.insertNotify(notify);

		ArrayList<Notifyee> notifyees = notify.getNotifyees();
		for (int i = 0; i < notifyees.size(); i++) {
			Notifyee notifyee = (Notifyee) notifyees.get(i);
			o.insertNotifyee(notifyee);
		}
		o.closeSession();
		return n;
	}

	public int insertNotifyee(Notifyee notifyee) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		int n = o.insertNotifyee(notifyee);
		o.closeSession();
		return n;
	}

	public ArrayList<Notify> findNotifyByWhereString(String reviewPaperUid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		DbWhere d = new DbWhere();
		d.setWhere(" referenceUid='" + reviewPaperUid + "'");
		ArrayList<Notify> recs = (ArrayList) o.findNotifyByWhereString(d);

		for (int i = 0; i < recs.size(); i++) {
			Notify notify = recs.get(i);
			String notifyUid = notify.getNotifyUid();

			DbWhere d2 = new DbWhere();
			d2.setWhere(" notifyUid='" + notifyUid + "'");
			ArrayList<Notifyee> notifyees = (ArrayList) o.findNotifyeeByWhereString(d2);
			notify.setNotifyees(notifyees);
		}
		o.closeSession();
		return recs;
	}

	public static void main(String[] args) {

	}

}
