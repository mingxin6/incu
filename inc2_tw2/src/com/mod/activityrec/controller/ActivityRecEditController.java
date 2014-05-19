package com.mod.activityrec.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.ActivityRec;

public class ActivityRecEditController extends SimpleFormController {

	public ActivityRecEditController() {
		setCommandClass(ActivityRec.class);
		setCommandName("ActivityRec");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {	
		ActivityRec obj = (ActivityRec) command;	
		MySQLAccessActivityRec o = new MySQLAccessActivityRec();
		try {
			o.updateActivityRec(obj,request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
//		return new ModelAndView(new RedirectView("TalkNotesById.htm?compName="+obj.compName+"&compId=" + obj.getcompId()));
		return new ModelAndView(new RedirectView("activityRecView.htm?uid=" + obj.getUid()));
		
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String uid = request.getParameter("uid");
		ActivityRec obj = new ActivityRec();
		MySQLAccessActivityRec o = new MySQLAccessActivityRec();
		try {
			obj = o.findActivityRecById(uid);			
//			System.out.println("hhhhh xxx===obj.getcompId() >>>"+ActivityRec.getcompId());
			request.setAttribute("activityRec", obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		return referenceData;
	}
}
