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

public class ParkingLotBikeEditController extends SimpleFormController {

	public ParkingLotBikeEditController() {
		setCommandClass(ParkingLotBike.class);
		setCommandName("parkingLotBike");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {	
		ParkingLotBike obj = (ParkingLotBike) command;
		
		System.out.println("parkingLotBike uid="+obj.getUid());
		
		MySQLAccessParkingLotBike o = new MySQLAccessParkingLotBike();
		try {
			o.updateParkingLotBike(obj,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return new ModelAndView(new RedirectView("parkingLotBikeView.htm?uid=" + obj.getUid()));
		
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String uid = request.getParameter("uid");
		ParkingLotBike obj = new ParkingLotBike();
		MySQLAccessParkingLotBike o = new MySQLAccessParkingLotBike();
		try {
			obj = o.findParkingLotBikeById(uid);			
			request.setAttribute("parkingLotBike", obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("statuses", ParkingLotBike.getEntityValidStatus(request));
		return referenceData;
	}
}
