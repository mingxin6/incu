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
import com.model.Activity;
import com.model.UploadedFile;

public class ActivityEditController extends SimpleFormController {
	
	public ActivityEditController() {
		setCommandClass(Activity.class);
		setCommandName("activity");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		Activity obj = (Activity) command;
		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
			if(obj.getIsnew()){
				mysqlDB.insertActivity(obj);
			}else{
				mysqlDB.updateActivity(obj);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*obj.status=obj.status.replace("0", "已隐藏");
		obj.status=obj.status.replace("1", "已显示");
		obj.status=obj.status.replace("2", "已删除");
		obj.type=obj.type.replace("0", "文章");
		obj.type=obj.type.replace("1", "链接");*/
		
		//String strCategorize = obj.categorize;
		
		return new ModelAndView(new RedirectView("activityList.htm"));
		
		//return new ModelAndView(getSuccessView(), "serviceResourceData", obj);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		
		String aid = request.getParameter("aid");
		Activity obj = new Activity();
		
		if(null!=aid){
			System.out.println("aid等于==="+aid);
			request.setAttribute("pagetype", "edit");
			
			MySQLAccessSec mysqlDB = new MySQLAccessSec();
			try {
				obj = mysqlDB.readActivityByID(aid);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request, Object command,
			Errors errors) throws Exception {

		Activity obj = (Activity)command;
		 String type = request.getParameter("aid");
		 Map referenceData = new HashMap();
		 if(null!=type){
		  //referenceData = new HashMap();
		// type = type.substring(type.indexOf("_")+1, type.length());
		// String action = new String(request.getParameter("action").getBytes("iso-8859-1"),"utf-8");
		 List<UploadedFile> uploadedfilelist = new ArrayList<UploadedFile>();
		 
		 MySQLAccessSec mysqlDB = new MySQLAccessSec();
			try {
				uploadedfilelist = mysqlDB.readUploadedFileList(type);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		 
			if (uploadedfilelist.size()<=0){
				referenceData.put("IsShow", false);
			}else{
				referenceData.put("IsShow", true);
			}

		referenceData.put("uploadedfilelist", uploadedfilelist);
		
		 }
		 if(null==type&&!obj.getIsnew()){
				obj.setIsnew(true);
				obj.setAid(UUID.randomUUID().toString());
				System.out.println("obj.setaid"+ obj.getAid());
			}	
		 referenceData.put("activity", obj);
	    return referenceData;

	}
}