package com.interceptor;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.Const;
import com.model.User;

public class CheckSessionInterceptor extends HandlerInterceptorAdapter {

	private String maintenanceMapping;

	public void setMaintenanceMapping(String maintenanceMapping) {
		this.maintenanceMapping = maintenanceMapping;
	}

	// before the actual handler will be executed
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession(false);
//		if (session != null) {
//			Object obj = session.getAttribute(Const.LocaleSessionKey);
//			if (obj != null) {
//				String language = "" + obj;
//				System.out.println("CheckSessionInterceptor,language=" + language);
//			}
//		}
//
//		Locale locale = Locale.getDefault();
//		// String lang = locale.getDisplayLanguage();
//		// String country = locale.getDisplayCountry();
//		System.out.println("CheckSessionInterceptor, locale=" + locale);

		// String lo = System.getProperty("user.language");
		// String co = System.getProperty("user.country");
		// System.out.println("The Locale of the system is: " + lo + "," + co);

//		System.out.println("CheckSessionInterceptor, preHandle...........................");

		if (request.getRequestURI().contains("login"))
			return true;

		
		if (request.getRequestURI().contains("image"))
			return true;

		if (request.getRequestURI().contains("userNew0.htm"))
			return true;

		if (session == null) {
			System.out.println("CheckSessionInterceptor, session =null");
			response.sendRedirect(maintenanceMapping);
			return false;
		} else {
			User u = (User) session.getAttribute("user");
			if (u == null) {
				System.out.println("CheckSessionInterceptor, user =null");
				response.sendRedirect(maintenanceMapping);
				return false;
			} else
				return true;
		}

	}
}