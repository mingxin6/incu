package com.mkyong.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class ExcelController extends AbstractController {

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String output = ServletRequestUtils.getStringParameter(request, "output");

		if (output == null || "".equals(output)) {// return normal view
			return new ModelAndView("RevenueSummary");
		} else if ("ExcelMonthlyReportView".equals(output)) { // 
			return new ModelAndView("ExcelMonthlyReportView");
		} else if ("ExcelQuarterlyReportView".equals(output)) { // 
			return new ModelAndView("ExcelQuarterlyReportView");
		} else if ("ExcelYearlyReportView".equals(output)) { // 
			return new ModelAndView("ExcelYearlyReportView");
		} else {
			return new ModelAndView("RevenueSummary");

		}

	}

}