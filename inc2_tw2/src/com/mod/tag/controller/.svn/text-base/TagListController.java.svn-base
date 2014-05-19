package com.mod.tag.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.model.Dumb;
import com.model.Tag;
import com.utils.KeyMaker;

public class TagListController extends SimpleFormController {

	public TagListController() {
		setCommandClass(Dumb.class);
		setCommandName("Dumb");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		String[] myTags = request.getParameterValues("myTag");

		MySQLAccessTag o = new MySQLAccessTag();
		o.insertTag(myTags, request);
		ArrayList tags = o.findTagsByUid(request);
		request.setAttribute("tagsList", tags);

		// return new ModelAndView("tagsList");
		return new ModelAndView(new RedirectView("tagList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		return new Dumb();
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		MySQLAccessTag o = new MySQLAccessTag();
		ArrayList ar = o.findTagsByUid(request);
		Map referenceData = new HashMap();
		referenceData.put("tagsList", ar);
		return referenceData;
	}
}