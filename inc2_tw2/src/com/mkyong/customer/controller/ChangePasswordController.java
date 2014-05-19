package com.mkyong.customer.controller;

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
import com.vo.VOChangePwd;

public class ChangePasswordController extends SimpleFormController {

	public ChangePasswordController() {
		setCommandClass(VOChangePwd.class);
		setCommandName("voChangePwd");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {

		VOChangePwd voChangePwd = (VOChangePwd) command;

		String newpwd = voChangePwd.getNewPwd();

		String newpwdAgain = voChangePwd.getNewPwdAgain();
		String oldpwd = voChangePwd.getOldPwd();

		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		String loginid = user.getUserid();
		String loginpwd = user.getUserpwd();

		// System.out.println("loginpwd="+loginpwd+", oldpwd="+oldpwd);

		User userx = null;
		try {
			MySQLAccess o = new MySQLAccess();
//			userAccount = o.readUserAccountByLoginIdAndPwd(loginid, newpwd);
			userx = o.findUserByLoginIdAndPwdUser(loginid, newpwd);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// if(userAccount==null){
		// System.out.println("userAccount ===>>>> null ");
		// }else{
		// System.out.println("userAccount ===>>>>not null ");
		// }

		if (userx != null) {// account already exists
			return new ModelAndView("changePwdErrorAccount");
		} else if (!(oldpwd.equals(loginpwd))) { // wrong old password
			return new ModelAndView("changePwdErrorOldPwd");
			// return new ModelAndView(new RedirectView("login.htm"));
		} else {

			try {
				MySQLAccess o = new MySQLAccess();
				o.updatePassword(loginid, loginpwd, newpwd);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return new ModelAndView(getSuccessView(), "voChangePwd",
					voChangePwd);

		}

	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		VOChangePwd voChangePwd = new VOChangePwd();

		return voChangePwd;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {

		Map referenceData = new HashMap();

		// referenceData.put("userRoles", SelectRoleIDs.get());
		// referenceData.put("userStatuses", SelectUserStatuses.get());
		//
		// //
		// ----------------------------------------------------------------------------
		// String sss = "";
		// VOCompListCondition compListCondition = new VOCompListCondition();
		// ArrayList ar = new ArrayList();
		// MySQLAccess o = new MySQLAccess();
		// try {
		// ar = o.readCompList(compListCondition);
		//
		// StringBuffer sb = new StringBuffer();
		//
		// for (int i = 0; i < ar.size(); i++) {
		// Company comp = (Company) ar.get(i);
		// sb.append("\"");
		// sb.append(comp.compName);
		// sb.append("\"");
		// if (i < ar.size() - 1)
		// sb.append(",");
		// }
		// sss = sb.toString();
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		VOChangePwd voChangePwd = new VOChangePwd();
		referenceData.put("voChangePwd", voChangePwd);

		return referenceData;
	}
}