package com.mkyong.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.utils.FileUpDownLoadUtil;

public class DownLoadController extends SimpleFormController {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String originalFileName = request.getParameter("fName");
		String topicId = request.getParameter("aid");
		String modifiedFileName = request.getParameter("mName");
		FileUpDownLoadUtil.download(request, response, originalFileName, modifiedFileName);
		return null;
	}
}