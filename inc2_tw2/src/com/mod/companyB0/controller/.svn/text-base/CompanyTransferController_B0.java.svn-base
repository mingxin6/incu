package com.mod.companyB0.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.room.controller.MySQLAccessRoom;
import com.mod.staff.controller.MySQLAccessStaff;
import com.model.Company;

public class CompanyTransferController_B0 extends SimpleFormController {

	public CompanyTransferController_B0() {
		setCommandClass(Company.class);
		setCommandName("comp");
	}

	@Override
	protected ModelAndView processFormSubmission(HttpServletRequest request, HttpServletResponse res, Object obj,
			BindException errors) throws Exception {
		String[] roomChecked = request.getParameterValues("roomChecked");
		if (roomChecked == null) {
			// errors.reject("reuired.compay");
		}

		if (!errors.hasErrors()) {
			return onSubmit(request, res, obj, errors);
		}

		return super.processFormSubmission(request, res, obj, errors);
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		String[] roomChecked = request.getParameterValues("roomChecked");
		if (roomChecked != null) {
			for (int i = 0; i < roomChecked.length; i++) {
				System.out.println("roomChecked -->" + roomChecked[i]);
			}
		}

		Company compB0 = (Company) command;
//		System.out.println(" am() -->" + compB0.getAmId());
//		System.out.println(" pm() -->" + compB0.getPmId());

		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		o.doTransfer(request, compB0, roomChecked);

		return new ModelAndView(new RedirectView("compDetailView_B.htm?compID=" + compB0.getUid()));

	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String uid = request.getParameter("compID");
		Company comp = new Company();
		MySQLAccessCompany_B0 o = new MySQLAccessCompany_B0();
		
			comp = o.readCompanyB0ByUniqueID(uid);
			comp.setCompStatusRS(request);
		
		// -----------------------------------------------
		{
			// 列出房間
			ArrayList ar = new ArrayList();
			MySQLAccessRoom o2 = new MySQLAccessRoom();
			try {
				ar = o2.findAllRooms();
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("roomList", ar);
		}
		// -----------------------------------------------
		{
			// 列出 AM/PM
			ArrayList ar = new ArrayList();
			MySQLAccessStaff o2 = new MySQLAccessStaff();
			try {
				ar = o2.findAllStaffs(null);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("staffList", ar);
		}
		return comp;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("statusCond_B", SelectCompanyStatuses_B.get());
		return referenceData;
	}
}