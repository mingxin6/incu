package com.mkyong.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.view.RedirectView;

import com.Const;

public class LogoutController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String language = "";
		HttpSession session = request.getSession(false);
		if (session != null) {
			Object obj = session.getAttribute(Const.LocaleSessionKey);
			if (obj != null) {
				language = "" + obj;
				System.out.println("CheckSessionInterceptor,language=" + language);
			}

			session.setAttribute("user", null);
			session.invalidate();
			session = null;
		}

		if (language.equals("zh_TW")) {
			return new ModelAndView(new RedirectView("login.htm"));
		} else {
			return new ModelAndView(new RedirectView("login_CN2.htm"));
		}
		// return new ModelAndView("index", "comp", null);
	}

}