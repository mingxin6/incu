package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.model.User;
import com.vo.VOUserAccountListCondition;

public class UserAccountListController extends SimpleFormController {
	public UserAccountListController() {
		setCommandClass(VOUserAccountListCondition.class);
		setCommandName("userAccountListCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		VOUserAccountListCondition userAccountListCondition = (VOUserAccountListCondition) command;
		System.out.println("name=" + userAccountListCondition.getUserName());
		System.out.println("role=" + userAccountListCondition.getUserRole());

		ArrayList ar = new ArrayList();
		MySQLAccess o = new MySQLAccess();
		try {
			ar = o.readUserAccounts(userAccountListCondition);
			System.out.println("users size=" + ar.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("userAccountList", ar);// 符合条件的所有使用者
		request.setAttribute("userRoles", User.getUserRolesCondition());
		request.setAttribute("userStats", User.getEntityValidStatus(request));
		
		HttpSession session = request.getSession(false);
		session.setAttribute("userAccountListCondition",
				userAccountListCondition);
		return new ModelAndView("UserAccountList", "userAccountListCondition",
				userAccountListCondition);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession(false);
		VOUserAccountListCondition userAccountListCondition = (VOUserAccountListCondition) session
				.getAttribute("userAccountListCondition");
		if (userAccountListCondition == null)
			userAccountListCondition = new VOUserAccountListCondition();
		return userAccountListCondition;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// request.setAttribute("userAuthIDs",
		// SelectRoleIDs.get());////////////////////////////////////////
		// -------------------------------------------------------------
		ArrayList ar = new ArrayList();
		HttpSession session = request.getSession(false);
		VOUserAccountListCondition userAccountListCondition = (VOUserAccountListCondition) session
				.getAttribute("userAccountListCondition");
		if (userAccountListCondition == null) {
			userAccountListCondition = new VOUserAccountListCondition();
			session.setAttribute("userAccountListCondition",
					userAccountListCondition);
		}
		MySQLAccess o = new MySQLAccess();
		try {
			ar = o.readUserAccounts(userAccountListCondition);
			System.out.println("users size=" + ar.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		referenceData.put("userAccountList", ar);
		
		referenceData.put("userRoles", User.getUserRolesCondition());
		referenceData.put("userStats", User.getEntityValidStatus(request));
		
		return referenceData;
	}
}