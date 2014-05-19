package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.validation.Errors;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccessSec;
import com.model.SharedResources;

public class SharedResourcesAddController extends SimpleFormController {
	
	public SharedResourcesAddController(){
		this.setCommandClass(SharedResources.class);
		this.setCommandName("sharedResources");
	}
	
	

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
			
		SharedResources obj = (SharedResources)command;
		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		obj.setSrid(UUID.randomUUID().toString());

		try{
			mysqlDB.insertSharedResources(obj);
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return new ModelAndView(new RedirectView("sharedResourcesAdd.htm"));
	}



	@Override
	protected Map referenceData(HttpServletRequest request, Object command,
			Errors errors) throws Exception {
		Map referenceData = new HashMap();
		List<SharedResources> srlist = new ArrayList<SharedResources>();
		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
				srlist = mysqlDB.readSharedResourcesList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (srlist.size()<=0)
			referenceData.put("IsShow", false);
		else
			referenceData.put("IsShow", true);
		referenceData.put("sharedResourcesList", srlist);
		
		return referenceData;
	}



	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String srid = request.getParameter("srid");
		SharedResources obj = new SharedResources();
		if(null!=srid){
			MySQLAccessSec mysqlDB = new MySQLAccessSec();
			try {
				//System.out.println("companyIntro...idis"+user.getCompid());
				obj = mysqlDB.readSharedResourcesByID(srid);
				//System.out.println("business...."+obj.getBusiness()+" ");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		return obj;
	}

	
}
