package com.mod.parkingLot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.view.RedirectView;

import com.model.ParkingLot;

public class ParkingLotClearController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uid = request.getParameter("uid");

		MySQLAccessParkingLot o = new MySQLAccessParkingLot();
		ParkingLot obj = o.findParkingLotById(uid);
		obj.setUsedBy("");

		o.updateParkingLot(obj, request);

		return new ModelAndView(new RedirectView("parkingLotView.htm?uid=" + obj.getUid()));

	}
}
