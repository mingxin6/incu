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
import com.model.User;

public class StaffEditController extends SimpleFormController {

	public StaffEditController() {
		setCommandClass(Staff.class);
		setCommandName("staff");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Staff obj = (Staff) command;

		System.out.println("staff uid=" + obj.getUid());

		MySQLAccessStaff o = new MySQLAccessStaff();
		o.updateStaff(obj, request);
		return new ModelAndView(new RedirectView("staffView.htm?uid=" + obj.getUid()));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String uid = request.getParameter("uid");
		MySQLAccessStaff o = new MySQLAccessStaff();
		Staff obj = o.findStaffById(uid);
		request.setAttribute("staff", obj);

		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		// HttpSession session = request.getSession(false);
		// User user = (User) session.getAttribute("user");
		String staffUid = request.getParameter("uid");

		MySQLAccessStaff o = new MySQLAccessStaff();
		ArrayList ar = o.findAllStaffs(null);

		// 排除自己
		ArrayList stf = new ArrayList();
		for (int i = 0; i < ar.size(); i++) {
			Staff staff = (Staff) ar.get(i);
			if (!staff.getUid().equals(staffUid)) {
				stf.add(staff);
			}
		}

		ArrayList yesnoList = new ArrayList();
		yesnoList.add("是");
		yesnoList.add("否");

		Map referenceData = new HashMap();
		referenceData.put("yesnoList", yesnoList);
		referenceData.put("staffList", stf);
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		return referenceData;
	}
}
