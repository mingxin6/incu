package com.mod.cashier.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.cashier.controller.MySQLAccessCashier;
import com.model.ActivityRec;
import com.model.Cashier;
import com.model.User;
import com.utils.UserUtil;

public class CashierAddController extends SimpleFormController {

	public CashierAddController() {
		setCommandClass(Cashier.class);
		setCommandName("cashier");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		Cashier obj = (Cashier) command;
		new UserUtil().markCreater(request, obj);
		new UserUtil().markLastModify(request, obj);
		try {
			new MySQLAccessCashier().insertCashiers(obj, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("cashierList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		Cashier obj = new Cashier();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		return referenceData;
	}
}
