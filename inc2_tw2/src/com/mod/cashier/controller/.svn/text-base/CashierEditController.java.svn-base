package com.mod.cashier.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.Cashier;
import com.model.User;

public class CashierEditController extends SimpleFormController {

	public CashierEditController() {
		setCommandClass(Cashier.class);
		setCommandName("cashier");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {	
		Cashier obj = (Cashier) command;	
		MySQLAccessCashier o = new MySQLAccessCashier();
		try {
			o.updateCashier(obj,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("cashierView.htm?uid=" + obj.getUid()));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String uid = request.getParameter("uid");
		Cashier obj = new Cashier();
		MySQLAccessCashier o = new MySQLAccessCashier();
		try {
			obj = o.findCashierById(uid);			
			request.setAttribute("cashier", obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		return referenceData;
	}
}
