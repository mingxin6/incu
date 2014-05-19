package com.mod.companyB0.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.parkingLot.controller.MySQLAccessParkingLot;
import com.model.User;

public class CompanyDelController_B0 implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String compid = request.getParameter("uid");
		try {
			new MySQLAccessCompany_B0().deleteCompany(compid, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("companyDel_B0_ok");
	}
}
