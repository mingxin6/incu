package com.mod.parkingLotBike.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.ParkingLotBike;
import com.model.User;

public class ParkingLotBikeAddController extends SimpleFormController {

	public ParkingLotBikeAddController() {
		setCommandClass(ParkingLotBike.class);
		setCommandName("parkingLotBike");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		ParkingLotBike obj = (ParkingLotBike) command;

		
		
		new MySQLAccessParkingLotBike().insertParkingLotBikes(obj, request);

		return new ModelAndView(new RedirectView("parkingLotBikeList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		// String compName = request.getParameter("compName");
		// String compId = request.getParameter("compId");
		// request.setAttribute("compName", compName);
		ParkingLotBike obj = new ParkingLotBike();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("statuses", ParkingLotBike.getEntityValidStatus(request));
		return referenceData;
	}
}
