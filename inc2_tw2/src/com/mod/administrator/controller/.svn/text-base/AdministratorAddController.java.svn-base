package com.mod.administrator.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.administrator.controller.MySQLAccessAdministrator;
import com.model.ActivityRec;
import com.model.Administrator;
import com.model.User;
import com.utils.UserUtil;

public class AdministratorAddController extends SimpleFormController {

	public AdministratorAddController() {
		setCommandClass(Administrator.class);
		setCommandName("administrator");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		Administrator obj = (Administrator) command;
		new UserUtil().markCreater(request, obj);
		new UserUtil().markLastModify(request, obj);
		try {
			new MySQLAccessAdministrator().insertAdministrators(obj, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("administratorList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		Administrator obj = new Administrator();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		return referenceData;
	}
}
