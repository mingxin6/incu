package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.db.MySQLAccessSec;
import com.model.ManagementDept;
import com.model.User;

public class ManagementDeptListController implements Controller {


	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List<ManagementDept> alist = new ArrayList<ManagementDept>();
		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
				alist = mysqlDB.readManagementDeptList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (alist.size()<=0)
			request.setAttribute("IsShow", false);
		else
			request.setAttribute("IsShow", true);
		request.setAttribute("managementDeptList", alist);

		
		
		
		HttpSession session = request.getSession(false);

		User user = (User) session.getAttribute("user");
		String str="managementDeptList";
		if(user.getIsBusiness()){
			System.out.println("its done.....its worked");
					
				str = "userManagementDeptList";
				}
			//System.out.println(this.getFormView()+"111111formview and successview"+this.getSuccessView());
		//System.out.println(this.getFormView()+"111formview and successview"+this.getSuccessView());
		
			return new ModelAndView(str);
	}

	
}
