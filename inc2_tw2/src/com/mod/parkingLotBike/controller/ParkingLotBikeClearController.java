package com.mod.parkingLotBike.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.view.RedirectView;

import com.model.ParkingLotBike;

public class ParkingLotBikeClearController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uid = request.getParameter("uid");

		MySQLAccessParkingLotBike o = new MySQLAccessParkingLotBike();
		ParkingLotBike obj = o.findParkingLotBikeById(uid);
		obj.setUsedBy("");

		o.updateParkingLotBike(obj, request);

		return new ModelAndView(new RedirectView("parkingLotBikeView.htm?uid=" + obj.getUid()));

	}
}
