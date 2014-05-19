package com.mod.cashier.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.cashier.controller.MySQLAccessCashier;
import com.model.Cashier;

public class CashierViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		Cashier obj = new Cashier();
		MySQLAccessCashier o = new MySQLAccessCashier();
		try {
			obj = o.findCashierById(uid);
			
				obj.setEntityStatusRS(request);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("cashierView", "cashier", obj);
	}
}
