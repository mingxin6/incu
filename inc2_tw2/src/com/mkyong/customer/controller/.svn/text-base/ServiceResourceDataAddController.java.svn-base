package com.mkyong.customer.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;
import com.model.ServiceResourceData;

public class ServiceResourceDataAddController extends SimpleFormController {
	public ServiceResourceDataAddController() {
		setCommandClass(ServiceResourceData.class);
		setCommandName("serviceResourceData");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		ServiceResourceData obj = (ServiceResourceData) command;
		obj.srdid = UUID.randomUUID().toString();

		MySQLAccess o = new MySQLAccess();
		try {
			o.insertServiceResourceData(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String strCategorize = request.getParameter("categorize");
		
		return new ModelAndView(new RedirectView("serviceResourceDataList.htm?categorize="+strCategorize));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {

		request.setAttribute("pagetype", "new");
		
		ServiceResourceData obj = new ServiceResourceData();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {

		Map referenceData = new HashMap();

		referenceData.put("statusLists", SelectLists.getServiceResourceDataStatus());

		String strCategorize = request.getParameter("categorize");
		referenceData.put("strCategorizeID", strCategorize);
		strCategorize=strCategorize.replace("1", "一般服务");
		strCategorize=strCategorize.replace("2", "会议室");
		strCategorize=strCategorize.replace("3", "人才公寓");
		strCategorize=strCategorize.replace("4", "办公用房");
		strCategorize=strCategorize.replace("5", "顾问资料");
		strCategorize=strCategorize.replace("6", "导师资料");
		strCategorize=strCategorize.replace("7", "云端服务资料");
		referenceData.put("strCategorize", strCategorize);
		
		return referenceData;
	}
}
