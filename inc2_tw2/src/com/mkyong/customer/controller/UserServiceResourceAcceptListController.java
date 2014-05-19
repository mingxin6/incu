package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.model.ServiceResourceAccept;
import com.model.User;

public class UserServiceResourceAcceptListController extends SimpleFormController {
	
	public UserServiceResourceAcceptListController() {
		setCommandClass(ServiceResourceAccept.class);
		setCommandName("serviceResourceAccept");
	}
	
	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		

		HttpSession session = request.getSession(false);

		User user = (User) session.getAttribute("user");
		String strCategorize = request.getParameter("categorize");
		
		Map mapobj = new HashMap();
		
		ArrayList al = new ArrayList();
		MySQLAccess o = new MySQLAccess();
		try {
				al = o.readServiceResourceAcceptList(strCategorize,user.getCompid());
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		mapobj.put("serviceResourceAcceptList", al);

		if (al.size()<=0)
			mapobj.put("IsShow", false);
		else
			mapobj.put("IsShow", true);
		
		mapobj.put("strCategorizeID", strCategorize);
		strCategorize=strCategorize.replace("1", "一般服务");
		strCategorize=strCategorize.replace("2", "会议室");
		strCategorize=strCategorize.replace("3", "人才公寓");
		strCategorize=strCategorize.replace("4", "办公用房");
		strCategorize=strCategorize.replace("5", "顾问资料");
		strCategorize=strCategorize.replace("6", "导师资料");
		strCategorize=strCategorize.replace("7", "云服务资料");
		mapobj.put("strCategorize", strCategorize);

		return mapobj;
	}

}
