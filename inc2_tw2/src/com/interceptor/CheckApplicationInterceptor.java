package com.interceptor;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.db.MySQLAccessMyBatis;
import com.model.User;

public class CheckApplicationInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = Logger.getLogger(CheckApplicationInterceptor.class);

	// before the actual handler will be executed
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//		System.out.println("CheckApplicationInterceptor, preHandle..........................."
//				+ request.getRequestURI());
//		if (request.getRequestURI().contains("compNew_B0.htm"))
//			return true;
//		if (request.getRequestURI().contains("userNew0.htm"))
//			return true;
//
//		HttpSession session = request.getSession(false);
//		if (session == null)
//			return true;

//		{
//			// 如果 DB 沒有屬於此 user 的 Company, 則 user 的 compId 屬性應清空
//			User u = (User) session.getAttribute("user");
//			if (u == null)
//				return true;
//
//			String uid = u.getUid();
//			MySQLAccessMyBatis o = new MySQLAccessMyBatis();
//			o.openSession();
//			ArrayList comps =  (ArrayList) o.findCompanyB0ByCreatorId(uid);
//			if (comps==null) {
//				u.setCompid("");
//				u.setUserComp("");
//				o.updateUser(u);
//			}
//			o.closeSession();
//
//			if (comps==null) {
//				response.sendRedirect("companyView_B0_Fail.jsp");
//			}
//			return true;
//		}
		
		return true;
	}

	// after the handler is executed
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}
}