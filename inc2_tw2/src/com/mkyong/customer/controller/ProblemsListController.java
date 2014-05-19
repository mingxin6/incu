package com.mkyong.customer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.db.MySQLAccess;
import com.entity.Problems;

public class ProblemsListController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		MySQLAccess o = new MySQLAccess();
		List<Problems> list = o.selectProblemsList();
		session.setAttribute("prolist", list);
		return new ModelAndView("problemsList", "prolist", null);
	}
}
