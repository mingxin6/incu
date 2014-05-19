package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.model.User;
import com.vo.VOAnnouncementCondition;

public class AnnouncementListController extends SimpleFormController {

	public AnnouncementListController() {
		setCommandClass(VOAnnouncementCondition.class);
		setCommandName("objName");
		//System.out.println("objNam1e");
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");

		Map mapobj = new HashMap();

		ArrayList al = new ArrayList();
		MySQLAccess o = new MySQLAccess();
		try {
			al = o.readAnnouncementList(user);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mapobj.put("announcementList", al);

		if (al.size() <= 0)
			mapobj.put("IsShow", false);
		else
			mapobj.put("IsShow", true);

		return mapobj;
	}

}
