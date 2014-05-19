package com.mod.parkingLotBike.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.parkingLot.controller.MySQLAccessParkingLot;

public class ParkingLotBikeDeleteController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		try {
			new MySQLAccessParkingLotBike().deleteParkingLotBike(uid, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("parkingLotBikeList.htm"));
	}
}
