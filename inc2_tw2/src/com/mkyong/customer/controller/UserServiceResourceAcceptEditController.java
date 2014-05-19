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
import com.model.ServiceResourceAccept;
import com.model.User;

public class UserServiceResourceAcceptEditController extends SimpleFormController {
	
	public UserServiceResourceAcceptEditController() {
		setCommandClass(ServiceResourceAccept.class);
		setCommandName("userServiceResourceAccept");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		//String sraid = request.getParameter("sraid");
		
		ServiceResourceAccept obj = (ServiceResourceAccept) command;

		MySQLAccess o = new MySQLAccess();
		try {
			//obj.sraid=sraid;
			o.updateServiceResourceAccept(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*obj.status=obj.status.replace("0", "已隐藏");
		obj.status=obj.status.replace("1", "已显示");
		obj.status=obj.status.replace("2", "已删除");
		obj.type=obj.type.replace("0", "文章");
		obj.type=obj.type.replace("1", "链接");*/
		
		String strCategorize = request.getParameter("categorize");
		
		return new ModelAndView(new RedirectView("userServiceResourceAcceptList.htm?categorize="+strCategorize));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		
		String str_id = request.getParameter("sraid");

		request.setAttribute("pagetype", "edit");
		
		ServiceResourceAccept obj = new ServiceResourceAccept();
		MySQLAccess o = new MySQLAccess();
		try {
			String strCategorize = request.getParameter("categorize");
			String strCategorizeID = request.getParameter("categorize");
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			
			obj = o.readServiceResourceAcceptByID(str_id,strCategorize,user.getCompid());
			request.setAttribute("a_status", obj.accept_status);

			request.setAttribute("strCategorizeID", strCategorizeID);
			
			strCategorize=strCategorize.replace("1", "一般服务");
			strCategorize=strCategorize.replace("2", "会议室");
			strCategorize=strCategorize.replace("3", "人才公寓");
			strCategorize=strCategorize.replace("4", "办公用房");
			strCategorize=strCategorize.replace("5", "顾问资料");
			strCategorize=strCategorize.replace("6", "导师资料");
			strCategorize=strCategorize.replace("7", "云服务资料");
			request.setAttribute("strCategorize", strCategorize);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {

		Map referenceData = new HashMap();
		String strCategorize = request.getParameter("categorize");
		referenceData.put("srdLists", SelectLists.getServiceResourceAcceptSrd(strCategorize));
		referenceData.put("statusLists", SelectLists.getServiceResourceAcceptStatus());
		referenceData.put("strCategorizeID", strCategorize);
		
		strCategorize=strCategorize.replace("1", "一般服务");
		strCategorize=strCategorize.replace("2", "会议室");
		strCategorize=strCategorize.replace("3", "人才公寓");
		strCategorize=strCategorize.replace("4", "办公用房");
		strCategorize=strCategorize.replace("5", "顾问资料");
		strCategorize=strCategorize.replace("6", "导师资料");
		referenceData.put("strCategorize", strCategorize);
		
		return referenceData;
	}
}
