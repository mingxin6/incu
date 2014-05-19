package com.mkyong.customer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.entity.Problems;

public class ProblemsViewController extends SimpleFormController {

	public ProblemsViewController() {
		setCommandClass(Problems.class);
		setCommandName("pcn");
	}

	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		System.out.println("jinlai le jianla进来了");
		String id = request.getParameter("aid");
		Problems pcn = new Problems();
		MySQLAccess o = new MySQLAccess();
		try {
			pcn = o.selectProblemsById(Integer.parseInt(id));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pcn;
	}
}
