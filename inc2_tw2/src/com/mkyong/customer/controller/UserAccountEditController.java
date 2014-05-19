package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.mod.company.controller.MySQLAccessCompany;
import com.model.Company;
import com.model.User;
import com.model.UserAuth;
import com.utils.UserUtil;
import com.vo.VOCompListCondition;

public class UserAccountEditController extends SimpleFormController {

	public UserAccountEditController() {
		setCommandClass(User.class);
		setCommandName("userx");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		User userx = (User) command;
		String userID = request.getParameter("userID");
		try {
			MySQLAccess o = new MySQLAccess();
			new UserUtil().markLastModify(request, userx);
			o.updateUser(userx);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// request.setAttribute("uid", company.uid);
		// request.setAttribute("compID", company.compName);
		request.setAttribute("userRoles", User.getUserRolesCondition());

		return new ModelAndView(getSuccessView(), "userx", userx);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String userID = request.getParameter("userID");
		User usr = new User();
		MySQLAccess o = new MySQLAccess();
		try {
			usr = o.findUsersByUid(userID);
			usr.setUserLoginPwdClearText("");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return usr;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("userRoles", SelectRoleIDs.get());
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		// ----------------------------------------------------------------------------
		String sss = "";
		VOCompListCondition compListCondition = new VOCompListCondition();
		ArrayList ar = new ArrayList();
		MySQLAccessCompany o = new MySQLAccessCompany();
		try {
			ar = o.readCompList(compListCondition);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < ar.size(); i++) {
				Company comp = (Company) ar.get(i);
				sb.append("\"");
				sb.append(comp.compName);
				sb.append("\"");
				if (i < ar.size() - 1)
					sb.append(",");
			}
			sss = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		referenceData.put("complist", sss);
		referenceData.put("userRoles", User.getUserRolesCondition());
		referenceData.put("authList", UserAuth.authList);

		return referenceData;
	}
}