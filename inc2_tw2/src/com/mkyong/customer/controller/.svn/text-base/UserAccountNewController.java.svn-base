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

import com.mod.company.controller.MySQLAccessCompany;
import com.mod.user.controller.MySQLAccessUser;
import com.model.Company;
import com.model.User;
import com.model.UserAuth;
import com.utils.KeyMaker;
import com.utils.UserUtil;
import com.vo.VOCompListCondition;
import com.vo.VOUserAccountListCondition;

public class UserAccountNewController extends SimpleFormController {

	public UserAccountNewController() {
		setCommandClass(User.class);
		setCommandName("userx");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		User userx = (User) command;
		try {
			MySQLAccessUser o = new MySQLAccessUser();
			userx.setUid(KeyMaker.newKey());
			// userx.userCompId = o
			// .readCompIdFromCompName(userx.userCompName);
			new UserUtil().markLastModify(request, userx);
			o.insertUser(userx);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// request.setAttribute("uid", company.uid);
		// request.setAttribute("compID", company.compName);
		request.setAttribute("userRoles", User.getUserRolesCondition());

		return new ModelAndView(getSuccessView(), "userx", userx);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		// String userID = request.getParameter("userID");
		User usr = new User();
		usr.setUid("NEW");
		HttpSession session = request.getSession(false);
		VOUserAccountListCondition c = (VOUserAccountListCondition) session.getAttribute("userAccountListCondition");
		// System.out.println(c);
		usr.setUserRole(c.getUserRole());
		usr.setUserStatus(User.STATUS_HALT);
		return usr;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
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
		// ----------------------------------------------------------------------------
		Map referenceData = new HashMap();
		// referenceData.put("userRoles", SelectRoleIDs.get());
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		referenceData.put("complist", sss);

		referenceData.put("userRoles", User.getUserRolesCondition());
		referenceData.put("authList", UserAuth.authList);

		return referenceData;
	}
}