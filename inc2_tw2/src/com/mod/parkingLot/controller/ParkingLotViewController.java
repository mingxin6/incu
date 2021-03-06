package com.mod.parkingLot.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.parkingLot.controller.MySQLAccessParkingLot;
import com.model.ParkingLot;

public class ParkingLotViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		ParkingLot obj = new ParkingLot();
		MySQLAccessParkingLot o = new MySQLAccessParkingLot();
		try {
			obj = o.findParkingLotById(uid);
			
				obj.setEntityStatusRS(request);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("parkingLotView", "parkingLot", obj);
	}
}
