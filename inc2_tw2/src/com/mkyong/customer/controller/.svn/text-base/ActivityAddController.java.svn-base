package com.mkyong.customer.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccessSec;
import com.model.Activity;

public class ActivityAddController extends SimpleFormController {
	public ActivityAddController() {
		setCommandClass(Activity.class);
		setCommandName("activity");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Activity obj = (Activity) command;
		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
			mysqlDB.insertActivity(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView(new RedirectView("activityList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		Activity obj = new Activity();
		obj.setAid(UUID.randomUUID().toString());
		return obj;
	}	
}
