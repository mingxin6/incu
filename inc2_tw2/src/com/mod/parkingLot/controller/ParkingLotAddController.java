package com.mod.parkingLot.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.parkingLot.controller.MySQLAccessParkingLot;
import com.model.ActivityRec;
import com.model.ParkingLot;
import com.model.ParkingLotBike;

public class ParkingLotAddController extends SimpleFormController {

	public ParkingLotAddController() {
		setCommandClass(ParkingLot.class);
		setCommandName("parkingLot");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		ParkingLot obj = (ParkingLot) command;
		try {
			new MySQLAccessParkingLot().insertParkingLots(obj, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("parkingLotList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		// String compName = request.getParameter("compName");
		// String compId = request.getParameter("compId");
		// request.setAttribute("compName", compName);
		ParkingLot obj = new ParkingLot();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("compId", request.getParameter("compId"));
		referenceData.put("statuses", ParkingLot.getEntityValidStatus(request));
		return referenceData;
	}
}
