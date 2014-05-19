package com.mkyong.customer.controller;

import java.util.ArrayList;
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
import com.model.Announcement;
import com.utils.FileUpDownLoadUtil;

public class AnnouncementAddController extends SimpleFormController {

	public AnnouncementAddController() {
		setCommandClass(Announcement.class);
		setCommandName("announcement");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Announcement obj = (Announcement) command;
		obj.aid = UUID.randomUUID().toString();
		
//		Date date = new Date();
//		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//		obj.createDate = dateFormat.format(date);

		List files = obj.getFiles();
		ArrayList res = FileUpDownLoadUtil.upload(request, files);
		obj.setFileInfo(res);

		MySQLAccess o = new MySQLAccess();
		try {
			o.insertAnnouncement(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView(new RedirectView("announcementList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		request.setAttribute("pagetype", "new");
		Announcement obj = new Announcement();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("typeCond", SelectAnnouncementStatuses.getType());
		referenceData.put("statusCond", SelectAnnouncementStatuses.get());
		return referenceData;
	}
}
