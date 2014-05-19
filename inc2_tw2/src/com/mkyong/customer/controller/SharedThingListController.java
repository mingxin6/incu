package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.model.SharedThing;

public class SharedThingListController extends SimpleFormController {

	public SharedThingListController() {
		setCommandClass(SharedThing.class);
		setCommandName("SharedThing");
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map mapobj = new HashMap();

		String table = "";
		String type = request.getParameter("type");
		if (type.equals("doc")) {
			table = "SharedDoc";
		}else if (type.equals("form")) {
			table = "SharedForm";
		}else if (type.equals("equipment")) {
			table = "sharedequipment";
		}
		
		ArrayList al = new ArrayList();
		MySQLAccess o = new MySQLAccess();
		try {
			al = o.readSharedThingList(table);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mapobj.put("sharedThingList", al);
		mapobj.put("type", type);

		if (al.size() <= 0)
			mapobj.put("IsShow", false);
		else
			mapobj.put("IsShow", true);

		return mapobj;
	}

}
