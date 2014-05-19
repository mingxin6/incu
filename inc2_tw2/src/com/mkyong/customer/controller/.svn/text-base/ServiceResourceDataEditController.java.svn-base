package com.mkyong.customer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;
import com.model.ServiceResourceData;
import com.model.User;

public class ServiceResourceDataEditController extends SimpleFormController {
	
	public ServiceResourceDataEditController() {
		setCommandClass(ServiceResourceData.class);
		setCommandName("serviceResourceData");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		ServiceResourceData obj = (ServiceResourceData) command;

		MySQLAccess o = new MySQLAccess();
		try {
			o.updateServiceResourceData(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*obj.status=obj.status.replace("0", "已隐藏");
		obj.status=obj.status.replace("1", "已显示");
		obj.status=obj.status.replace("2", "已删除");
		obj.type=obj.type.replace("0", "文章");
		obj.type=obj.type.replace("1", "链接");*/
		
		String strCategorize = obj.categorize;
		
		return new ModelAndView(new RedirectView("serviceResourceDataList.htm?categorize="+strCategorize));
		
		//return new ModelAndView(getSuccessView(), "serviceResourceData", obj);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		
		String str_id = request.getParameter("srdid");

		request.setAttribute("pagetype", "edit");
		
		ServiceResourceData obj = new ServiceResourceData();
		MySQLAccess o = new MySQLAccess();
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			obj = o.readServiceResourceDataByID(str_id);
			request.setAttribute("a_status", obj.status);

			String strCategorize = obj.categorize;
			String strCategorizeID = obj.categorize;
			request.setAttribute("strCategorizeID", strCategorizeID);
			
			strCategorize=strCategorize.replace("1", "一般服务");
			strCategorize=strCategorize.replace("2", "会议室");
			strCategorize=strCategorize.replace("3", "人才公寓");
			strCategorize=strCategorize.replace("4", "办公用房");
			strCategorize=strCategorize.replace("5", "顾问资料");
			strCategorize=strCategorize.replace("6", "导师资料");
			strCategorize=strCategorize.replace("7", "云端服务资料");
			request.setAttribute("strCategorize", strCategorize);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {

		Map referenceData = new HashMap();

		referenceData.put("statusLists", SelectLists.getServiceResourceDataStatus());

		return referenceData;
	}
}
