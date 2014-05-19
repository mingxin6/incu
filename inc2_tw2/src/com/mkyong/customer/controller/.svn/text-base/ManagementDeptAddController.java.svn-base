package com.mkyong.customer.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccessSec;
import com.model.ManagementDept;

public class ManagementDeptAddController extends SimpleFormController {
	public ManagementDeptAddController() {
		setCommandClass(ManagementDept.class);
		setCommandName("managementDept");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		ManagementDept obj = (ManagementDept) command;
		obj.setMdid(UUID.randomUUID().toString());

		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
			mysqlDB.insertManagementDept(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView(new RedirectView("managementDeptList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {

		request.setAttribute("pagetype", "new");
		
		ManagementDept obj = new ManagementDept();
		return obj;
	}

	
}
