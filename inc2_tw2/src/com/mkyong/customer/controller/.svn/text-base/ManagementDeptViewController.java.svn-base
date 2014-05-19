package com.mkyong.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccessSec;
import com.model.ManagementDept;
import com.model.User;

public class ManagementDeptViewController extends SimpleFormController {
	
	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		User user = (User) session.getAttribute("user");//user.userAuth.managerMenu

		String mdid = "";
		mdid = request.getParameter("mdid");
		if (user.getIsBusiness()) {
			System.out.println("userid=" + user.getUserid() + ", user.getUserComp()=" + user.getUserComp());

			request.setAttribute("type", "B");
		} else {//manager
			request.setAttribute("type", "A");
		}

		System.out.println("mdid=" + mdid);

		ManagementDept obj = new ManagementDept();
		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
			obj = mysqlDB.readManagementDeptByID(mdid);
			/*obj.status=obj.status.replace("0", "已隐藏");
			obj.status=obj.status.replace("1", "已显示");
			obj.status=obj.status.replace("2", "已删除");
			obj.type=obj.type.replace("0", "文章");
			obj.type=obj.type.replace("1", "链接");*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("managementDeptView", "managementDept", obj);

	}
}
