package com.mkyong.customer.controller;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.Const;
import com.db.MySQLAccess;
import com.model.User;
import com.vo.VOLoginInfo;

public class LoginController extends SimpleFormController {

	public LoginController() {
		setCommandClass(VOLoginInfo.class);
		setCommandName("voLogin");
	}
	
	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(); // a new session created if no session exists

		Locale locale = new Locale("zh", "TW");// Locale.getDefault();
		 
		session.setAttribute(Const.LocaleSessionKey, locale);
		
		return null;
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		HttpSession session = request.getSession(); // a new session created if no session exists

		Locale locale = new Locale("zh", "TW");// Locale.getDefault();
		// String lang = locale.getDisplayLanguage();
		// String country = locale.getDisplayCountry();
		// System.out.println("CheckSessionInterceptor, locale=" + locale);
		session.setAttribute(Const.LocaleSessionKey, locale);

		VOLoginInfo voLogin = (VOLoginInfo) command;
		
		
		//*************************************************
		String check = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if(!check.equals(voLogin.getUserLoginCheck())){
			String redict = "login.htm";
			session.setAttribute("check_error", "验证码输入错误！");
			return new ModelAndView(new RedirectView(redict));
		}
		//************************************************
		

		String loginid = voLogin.getUserLoginId();
		String loginPwd = voLogin.getUserLoginPwd();

		MySQLAccess o = new MySQLAccess();
		User user = o.findUserByLoginIdAndPwdUser(loginid, loginPwd);

		session.setAttribute("user", user);

		if (user.getIsStaff())
			return new ModelAndView(new RedirectView("adminMain.htm"));
		else
			return new ModelAndView(new RedirectView("businessMain.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
//		HttpSession session = request.getSession(false);
//		if (session != null) {
//			session.invalidate();
//			session = null;
//			System.out.println("session reset !!");
//		}
		return new VOLoginInfo();
	}
}