package com.mod.staff.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.Staff;
import com.model.Teacher;
import com.model.User;

public class StaffAddController extends SimpleFormController {

	public StaffAddController() {
		setCommandClass(Staff.class);
		setCommandName("staff");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Staff staff = (Staff) command;

		System.out.println("**********************staff.getName()===" + staff.getName());

		new MySQLAccessStaff().insertStaffs(staff, request);

		return new ModelAndView(new RedirectView("staffList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {

		Staff obj = new Staff();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");

		MySQLAccessStaff o = new MySQLAccessStaff();
		ArrayList ar = o.findAllStaffs(null);
		
//		ArrayList stf=new ArrayList();
//		for (int i = 0; i < ar.size(); i++) {
//			Staff staff = (Staff) ar.get(i);
//			if(!staff.getUid().equals(user.getUid())){
//				stf.add(staff);
//			}
//		}
		ArrayList yesnoList=new ArrayList();
		yesnoList.add("是");
		yesnoList.add("否");
		
		Map referenceData = new HashMap();
		referenceData.put("yesnoList", yesnoList);
		referenceData.put("staffList", ar);
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		return referenceData;
	}
}
