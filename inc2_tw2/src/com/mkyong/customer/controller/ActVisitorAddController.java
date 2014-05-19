package com.mkyong.customer.controller;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccessSec;
import com.model.Actvisitor;

public class ActVisitorAddController extends SimpleFormController {
	
	public ActVisitorAddController() {
		setCommandClass(Actvisitor.class);
		setCommandName("actvisitor");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		String avid = request.getParameter("avid");
		String action = request.getParameter("action");
		String actid = request.getParameter("actid");
		String strTemp = "";
		
		if(avid==null){
//			String actid = request.getParameter("actid");
//			String action = request.getParameter("action");
			Actvisitor obj = (Actvisitor) command;
			obj.setActid(actid);
			obj.setAvid(UUID.randomUUID().toString());
			MySQLAccessSec mysqlDB = new MySQLAccessSec();
			try {
				mysqlDB.connectDB();
				Connection conn = mysqlDB.getConn();
				conn.setAutoCommit(false);
				mysqlDB.insertActvisitor(obj);
				//if("1".equals(obj.getStatus())){
				// Actvisitor obj insert into 潜在企业表******************************************
				//}
				conn.commit();
				mysqlDB.closeDB();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(avid!=null){
			Actvisitor obj = (Actvisitor) command;
			obj.setActid(actid);
			obj.setAvid(avid);
			MySQLAccessSec mysqlDB = new MySQLAccessSec();
			try {
				mysqlDB.connectDB();
				Connection conn = mysqlDB.getConn();
				conn.setAutoCommit(false);
				mysqlDB.updateActvisitor(obj);
				//if("1".equals(obj.getStatus())
				//	&&"0".equals(mysqlDB.readActvisitorByID(avid).getStatus())){
				// Actvisitor obj insert into 潜在企业表******************************************
				//}
				conn.commit();
				mysqlDB.closeDB();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			if("back".equals(action)){
				strTemp= "activityList.htm";
			}else if("saveback".equals(action)){
				//request.setAttribute("actid", actid);
				strTemp= "actVisitorAdd.htm?actid="+actid;	
			}
			return new ModelAndView(new RedirectView(strTemp));
		
		//return new ModelAndView(getSuccessView(), "serviceResourceData", obj);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		
		String avid = request.getParameter("avid");
		Actvisitor obj = new Actvisitor();
		if(avid!=null){
		//System.out.println("aid等于==="+aid);
		request.setAttribute("pagetype", "edit");
		
		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
			obj = mysqlDB.readActvisitorByID(avid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		
		List<Actvisitor> alist = new ArrayList<Actvisitor>();
		Map referenceData = new HashMap();
		String actid = request.getParameter("actid");
		
		//Actvisitor obj = new Actvisitor();
		if(actid!=null){
			MySQLAccessSec mysqlDB = new MySQLAccessSec();
			try {
				alist = mysqlDB.readActvisitorList(actid);
				System.out.println("actvisitorList.size====="+alist.size());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}

		if (alist.size()<=0)
			referenceData.put("IsShow", false);
		else
			referenceData.put("IsShow", true);

		
		referenceData.put("actvisitorList", alist);
		referenceData.put("statusCond", SelectActvisitorStatuses.get());
		referenceData.put("statusCondSec", SelectActvisitorStatuses.getSec());
		
		return referenceData;	
	}


}
