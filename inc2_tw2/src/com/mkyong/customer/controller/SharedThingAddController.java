package com.mkyong.customer.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;
import com.model.SharedThing;
import com.utils.FileUpDownLoadUtil;

public class SharedThingAddController extends SimpleFormController {

	public SharedThingAddController() {
		setCommandClass(SharedThing.class);
		setCommandName("SharedThing");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		String table = "";
		String type = request.getParameter("type");
		if (type.equals("doc")) {
			table = "SharedDoc";
		} else if (type.equals("form")) {
			table = "SharedForm";
		} else if (type.equals("equipment")) {
			table = "sharedequipment";
		}

		SharedThing obj = (SharedThing) command;

		obj.aid = UUID.randomUUID().toString();

		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		obj.createDate = dateFormat.format(date);

		List files = obj.getFiles();
		ArrayList res = FileUpDownLoadUtil.upload(request, files);
		obj.setFileInfo(res);

		MySQLAccess o = new MySQLAccess();
		try {
			o.insertSharedThing(obj, table);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView(new RedirectView("SharedThingList.htm?type=" + type));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		request.setAttribute("pagetype", "new");
		SharedThing obj = new SharedThing();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("typeCond", SelectAnnouncementStatuses.getType());
		referenceData.put("statusCond", SelectAnnouncementStatuses.get());

		referenceData.put("type", request.getParameter("type"));

		return referenceData;
	}
}
