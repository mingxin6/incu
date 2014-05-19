package com.mkyong.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccessSec;
import com.model.ManagementDept;

public class ManagementDeptEditController extends SimpleFormController {
	
	public ManagementDeptEditController() {
		setCommandClass(ManagementDept.class);
		setCommandName("managementDept");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		ManagementDept obj = (ManagementDept) command;

		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
			mysqlDB.updateManagementDept(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*obj.status=obj.status.replace("0", "已隐藏");
		obj.status=obj.status.replace("1", "已显示");
		obj.status=obj.status.replace("2", "已删除");
		obj.type=obj.type.replace("0", "文章");
		obj.type=obj.type.replace("1", "链接");*/
		
		//String strCategorize = obj.categorize;
		
		return new ModelAndView(new RedirectView("managementDeptList.htm"));
		
		//return new ModelAndView(getSuccessView(), "serviceResourceData", obj);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		
		String mdid = request.getParameter("mdid");
		System.out.println("mdid等于==="+mdid);
		request.setAttribute("pagetype", "edit");
		
		ManagementDept obj = new ManagementDept();
		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
			obj = mysqlDB.readManagementDeptByID(mdid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return obj;
	}


}
