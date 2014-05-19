package com.mkyong.customer.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;
import com.entity.Problems;

public class ProblemsAddController extends SimpleFormController {

	public ProblemsAddController() {
		setCommandClass(Problems.class);
		setCommandName("pro");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		Problems pro = (Problems) command;
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		pro.times = dateFormat.format(date);
		
		MySQLAccess o = new MySQLAccess();
		try {
			o.insertProblems(pro);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("problemsList.htm"));
	}
}
