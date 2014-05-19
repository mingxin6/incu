package com.mod.parkingLot.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.ParkingLot;

public class ParkingLotEditController extends SimpleFormController {

	public ParkingLotEditController() {
		setCommandClass(ParkingLot.class);
		setCommandName("parkingLot");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {	
		ParkingLot obj = (ParkingLot) command;
		
		System.out.println("parkingLot uid="+obj.getUid());
		
		MySQLAccessParkingLot o = new MySQLAccessParkingLot();
		try {
			o.updateParkingLot(obj,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return new ModelAndView(new RedirectView("parkingLotView.htm?uid=" + obj.getUid()));
		
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String uid = request.getParameter("uid");
		ParkingLot obj = new ParkingLot();
		MySQLAccessParkingLot o = new MySQLAccessParkingLot();
		try {
			obj = o.findParkingLotById(uid);			
			request.setAttribute("parkingLot", obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("statuses", ParkingLot.getEntityValidStatus(request));
		return referenceData;
	}
}
