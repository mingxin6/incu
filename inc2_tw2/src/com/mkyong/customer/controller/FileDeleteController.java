package com.mkyong.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.db.MySQLAccessSec;

public class FileDeleteController implements Controller {
	

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String action = request.getParameter("action");
		String ufid = request.getParameter("ufid");
		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
				mysqlDB.deleteUploadedFile(ufid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

				
			return null;
	}

	
}
