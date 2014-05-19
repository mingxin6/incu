package com.mkyong.customer.controller;

//import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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

public class UserServiceResourceAcceptAddController extends SimpleFormController {
	
	public UserServiceResourceAcceptAddController() {
		setCommandClass(ServiceResourceAccept.class);
		setCommandName("userServiceResourceAccept");
	}
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {


		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		
		ServiceResourceAccept obj = (ServiceResourceAccept) command;
		obj.sraid = UUID.randomUUID().toString();
		obj.company_id=user.getCompid();
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
//		System.out.println(dateFormat.format(date));
		obj.create_date=dateFormat.format(date);
		
//		obj.create_date=DateFormat.getDateInstance().format(new Date());
//		System.out.println("CCXXCCCXXXX ---->>>obj.create_date="+obj.create_date);
		
		obj.accept_status="0";

		MySQLAccess o = new MySQLAccess();
		try {
			o.insertServiceResourceAccept(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String strCategorize = request.getParameter("categorize");
		
		return new ModelAndView(new RedirectView("userServiceResourceAcceptList.htm?categorize="+strCategorize));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {

		request.setAttribute("pagetype", "new");
		
		ServiceResourceAccept obj = new ServiceResourceAccept();
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
		strCategorize=strCategorize.replace("7", "云服务资料");
		referenceData.put("strCategorize", strCategorize);
		
		return referenceData;
	}
}
