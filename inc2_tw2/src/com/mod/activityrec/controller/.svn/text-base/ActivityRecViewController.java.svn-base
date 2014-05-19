package com.mod.activityrec.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.model.ActivityRec;

public class ActivityRecViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		ActivityRec obj = new ActivityRec();
		MySQLAccessActivityRec o = new MySQLAccessActivityRec();
		try {
			obj = o.findActivityRecById(uid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("activityRecView", "activityRec", obj);
	}
}
